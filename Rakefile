# == Dependencies ==============================================================

require 'rake'
require 'yaml'
require 'fileutils'
require 'rbconfig'
require 'nokogiri'

# == Configuration =============================================================

# Set "rake watch" as default task
task :default => :watch

# Load the configuration file
CONFIG = YAML.load_file("_config.yml")

# Get and parse the date
DATE = Time.now.strftime("%Y-%m-%d")

# Directories
POSTS = "_posts"
DRAFTS = "_drafts"

# == Helpers ===================================================================

class NilClass
  def blank?
    true
  end
end

class Object
  def blank?
    empty?
  end
end

# Execute a system command
def execute(command)
  if not system "#{command}"
    raise "failure when executing the command:\n$> #{command}"
  end
end

# Chech the title
def check_title(title)
  if title.nil? or title.empty?
    raise "Please add a title to your file."
  end
end

# Transform the filename and date to a slug
def transform_to_slug(title, extension)
  characters = /("|'|!|\?|:|\s\z)/
  whitespace = /\s/
  "#{title.gsub(characters,"").gsub(whitespace,"-").downcase}.#{extension}"
end

# Read the template file
def read_file(template)
  File.read(template)
end

# Save the file with the title in the YAML front matter
def write_file(content, title, directory, filename)
  parsed_content = "#{content.sub("title:", "title: \"#{title}\"")}"
  File.write("#{directory}/#{filename}", parsed_content)
  puts "#{filename} was created in '#{directory}'."
end

# Get the "open" command
def open_command
  if RbConfig::CONFIG["host_os"] =~ /mswin|mingw/
    "start"
  elsif RbConfig::CONFIG["host_os"] =~ /darwin/
    "open"
  else
    "xdg-open"
  end
end

# Create the file with the slug and open the default editor
def create_file(directory, filename, content, title, editor, force=false)
  if not force and File.exists?("#{directory}/#{filename}")
    raise "The file already exists."
  else
    write_file(content, title, directory, filename)
    if editor && !editor.nil?
      sleep 1
      execute("#{editor} #{directory}/#{filename}")
    end
  end
end

def write_with_path(dst, content)
  FileUtils.mkdir_p(File.dirname(dst))
  # Not available on Ruby installed on Ubuntu LTS
  #File.write(dst,content)
  file = File.open(dst, "w")
  file.write(content) 
  file.close unless file == nil
end

def fixing_documentation_page(source)
  f = File.open(source)
  html_doc = Nokogiri::HTML(f)
  # Extract the documentation as html (not the jnario spec source)
  info = html_doc.css("div#spec")
  # Force the CSS style for tables
  html_doc.xpath("//table").each do |table_element|
    type = table_element["class"]
    if type.nil? or type.empty? then
      table_element["class"] = "table-bordered"
    end
  end
  # Extract the documentation title
  title_tag = html_doc.css("body").css('h1')
  title = title_tag.children.to_html
  # Acknowledge Jnario's great work
  jnario = CONFIG["jnario"]["html_foot"]
  # Reply the Jekyl template
  template = CONFIG["page"]["template"]
  content = read_file(template)
  parsed_content = "#{content.sub("title:", "title: \"#{title}\"")}"
  f.close
  return "#{parsed_content}\n\n#{info.to_html}\n#{jnario}"
end

def generate_changelog_markdown(git_folder, project, revision='HEAD')
  rawlog = `cd #{git_folder} && git log "#{revision}" --pretty=format:"[[%H]]%s\n"`
  logs = {}
  rawlogs = rawlog.strip.split(/\s*[\n\r]+\s*/)
  rawlogs.each do |log|
    m1 = /^\[\[([a-zA-Z0-9]+)\]\](.+)$/.match(log)
    if (m1 and m1[1] and m1[2]) then
      msg = m1[2]
      m2 = /^\s*\[\#([0-9]+)\]\s*(.*)$/.match(msg)
      if (m2 and m2[1]) then
        msg = "[all] " + m2[2]
      elsif (msg and not /^\s*\[/.match(msg)) then
        msg = "[all] " + msg
      end
      sections = []
      while (msg and (m2 = /^\s*\[([^.\]]+)\]\s*(.+)$/.match(msg))) do
        msg = m2[2]
        sections.push(m2[1])
      end
      sections.each do |section|
        if (logs[section].blank?) then
	  logs[section] = { msg => m1[1]}
        elsif (logs[section][msg].blank?) then
	  logs[section][msg] = m1[1]
        end
      end
    end
  end
  changelog = "\n\n"
  logs.each { |section, lines|
    content = ''
    lines.each { |msg, commit|
      if (msg and not msg =~ /^merge\s+branch/i and not msg =~ /^fixup/i) then 
        msg = msg.gsub(/((?:(?:http|(?:ftp)))s?\:\/\/[0-9a-zA-Z\-\.\_\~\:\/\?\#\[\]\@\!\$\&\'\(\)\*\+\,\;\=]+)/, "[\1](\1)")
        msg = msg.gsub(/\#([0-9]+)/) { "[\#"+Regexp.last_match[1]+"](http://github.com/#{project}/issues/"+Regexp.last_match[1]+")" }
        msg = msg.gsub(/\@([0-9a-zA-Z_]+)/, "[\1](http://github.com/\1)")
        content = content + "   *  #{msg} ([details](http://github.com/#{project}/commit/#{commit}))\n"
      end
    }
    if (content and section) then
      changelog = changelog + "*  [#{section}]\n#{content}"
    end
  }
  changelog = changelog + "\n\n"
  return changelog
end

def extract_version_from_pom(pomDirectory)
  f = File.open(pomDirectory+"/pom.xml")
  pom = Nokogiri::HTML(f)
  version_tag = pom.css("project>version")
  version = nil
  if (version_tag) then
    version = version_tag.children.to_html
  end
  f.close
  return version
end

def ensure_git_sarl_repository(updateIfExists=false)
  sarl_git_url = CONFIG["sarl"]["url"]
  if(sarl_git_url.start_with?('http:', 'https:', 'ssh:', 'git:')) then
    sarl_copy = CONFIG["sarl"]["workdir"] + "/sarl_copy"

    if(!File.exists?(sarl_copy)) then
      puts "No working copy found. Cloning to #{sarl_copy}..."    
      execute("git clone #{sarl_git_url} #{sarl_copy}")
    elsif (updateIfExists) then
      puts "working copy found [#{sarl_copy}]. Updating..."
      execute("cd #{sarl_copy} && git pull --rebase")
    end

    if (updateIfExists) then
      puts "Checking branch [" + CONFIG["sarl"]["branch"] + "]"
      execute("cd #{sarl_copy} && git checkout "+ CONFIG["sarl"]["branch"])
    end
  else
    sarl_copy = sarl_git_url
  end
  return sarl_copy
end

# == Tasks =====================================================================

# rake post["Title"]
desc "Create a post in _posts"
task :post, :title do |t, args|
  title = args[:title]
  template = CONFIG["post"]["template"]
  extension = CONFIG["post"]["extension"]
  editor = open_command
  check_title(title)
  filename = "#{DATE}-#{transform_to_slug(title, extension)}"
  content = read_file(template)
  create_file(POSTS, filename, content, title, editor)
end

# rake draft["Title"]
desc "Create a post in _drafts"
task :draft, :title do |t, args|
  title = args[:title]
  template = CONFIG["post"]["template"]
  extension = CONFIG["post"]["extension"]
  editor = open_command
  check_title(title)
  filename = transform_to_slug(title, extension)
  content = read_file(template)
  create_file(DRAFTS, filename, content, title, editor)
end

# rake publish
desc "Move a post from _drafts to _posts"
task :publish do
  extension = CONFIG["post"]["extension"]
  files = Dir["#{DRAFTS}/*.#{extension}"]
  files.each_with_index do |file, index|
    puts "#{index + 1}: #{file}".sub("#{DRAFTS}/", "")
  end
  puts "> "
  number = $stdin.gets
  if number =~ /\D/
    filename = files[number.to_i - 1].sub("#{DRAFTS}/", "")
    FileUtils.mv("#{DRAFTS}/#{filename}", "#{POSTS}/#{DATE}-#{filename}")
    puts "#{filename} was moved to '#{POSTS}'."
  else
    puts "Please choose a draft by the assigned number."
  end
end

# rake page["Title"]
# rake page["Title","Path/to/folder"]
desc "Create a page (optional filepath)"
task :page, :title, :path do |t, args|
  title = args[:title]
  template = CONFIG["page"]["template"]
  extension = CONFIG["page"]["extension"]
  editor = open_command
  directory = args[:path]
  if directory.nil? or directory.empty?
    directory = "./"
  else
    FileUtils.mkdir_p("#{directory}")
  end
  check_title(title)
  filename = transform_to_slug(title, extension)
  content = read_file(template)
  create_file(directory, filename, content, title, editor)
end

# rake build
desc "Build the site"
task :build do
  execute("jekyll build")
  # Remove unecessary files
  output_dir = CONFIG["build"]["output_dir"]
  files_to_ignore = CONFIG["build"]["files_to_ignore"].strip.split(/\s*:\s*/)
  files_to_ignore.each do |fti|
    puts "       Undeploying: #{fti}"
    FileUtils.rm("#{output_dir}/#{fti}")
  end
end

# rake watch
# rake watch[number]
# rake watch["drafts"]
desc "Serve and watch the site (with post limit or drafts)"
task :watch, :option do |t, args|
  option = args[:option]
  if option.nil? or option.empty?
    execute("jekyll serve --watch")
  else
    if option == "drafts"
      execute("jekyll serve --watch --drafts")
    else
      execute("jekyll serve --watch --limit_posts #{option}")
    end
  end
end

# rake preview
desc "Launch a preview of the site in the browser"
task :preview do
  port = CONFIG["port"]
  if port.nil? or port.empty?
    port = 4000
  end
  Thread.new do
    puts "Launching browser for preview..."
    sleep 1
    execute("#{open_command} http://localhost:#{port}/")
  end
  Rake::Task[:watch].invoke
end

# rake deploy["Commit message"]
desc "Deploy the site to a remote git repo"
task :deploy, :message do |t, args|
  message = args[:message]
  branch = CONFIG["git"]["branch"]
  if message.nil? or message.empty?
    raise "Please add a commit message."
  end
  if branch.nil? or branch.empty?
    raise "Please add a branch."
  else
    Rake::Task[:build].invoke
    execute("git add .")
    execute("git commit -m \"#{message}\"")
    #execute("git push origin #{branch}")
  end
end

# rake transfer
desc "Transfer the site (remote server or a local git repo)"
task :transfer do
  command = CONFIG["transfer"]["command"]
  source = CONFIG["transfer"]["source"]
  destination = CONFIG["transfer"]["destination"]
  settings = CONFIG["transfer"]["settings"]
  if command.nil? or command.empty?
    raise "Please choose a file transfer command."
  elsif command == "robocopy"
    Rake::Task[:build].invoke
    execute("robocopy #{source} #{destination} #{settings}")
    puts "Your site was transfered."
  elsif command == "rsync"
    Rake::Task[:build].invoke
    execute("rsync #{settings} #{source} #{destination}")
    puts "Your site was transfered."
  else
    raise "#{command} isn't a valid file transfer command."
  end
end

#rake build_doc["clean"]
desc "Build sarl documentation using maven"
task :build_doc, :option do |t, args|
  option = args[:option]
  if (option.blank?) then
    option = "clean test install"
  end
  sarl_doc_suite = CONFIG["sarl"]["doc_suite"]
  jnario_generator = CONFIG["jnario"]["generator"]
  sarl_copy = ensure_git_sarl_repository(true)
  puts "Compiling documentation ..."
  execute("mvn -f #{sarl_copy}/#{sarl_doc_suite}/pom.xml #{option}")
  execute("mvn -f #{sarl_copy}/#{sarl_doc_suite}/pom.xml #{jnario_generator}")
  Dir.glob("./classes*") do |tmp_folder|
    FileUtils.rm_rf(tmp_folder)
  end
  puts "Documentation generated"
end

#rake build_javadoc
desc "Build Java documentation using maven"
task :build_javadoc do
  sarl_copy = ensure_git_sarl_repository(false)
  javadoc_source_path = CONFIG["sarl"]["apidoc_modules"]
  javadoc_cli_arguments = CONFIG["sarl"]["apidoc_cli_arguments"]
  puts "Compiling the javadoc ..."
  execute("mvn #{javadoc_cli_arguments} -f #{sarl_copy}/pom.xml -Dsourcepath=#{javadoc_source_path} -Dmaven.test.skip=true javadoc:aggregate")
  Dir.glob("./classes*") do |tmp_folder|
    FileUtils.rm_rf(tmp_folder)
  end
  puts "Javadoc generated"
end

#rake copy_sarl_doc
desc "Copies SARL Documentation created with build_doc"
task :copy_sarl_doc do
  sarl_generated_doc = CONFIG["sarl"]["doc_suite"] + "/" + CONFIG["sarl"]["generated_doc"]
  sarl_copy = ensure_git_sarl_repository(false) 
  puts "Copying documentation to #{FileUtils.pwd}"
  doc_base = "#{sarl_copy}/#{sarl_generated_doc}"
  site_docs_base = FileUtils.pwd + "/" + CONFIG["suitedoc_dir"]
  FileUtils.rm_rf(site_docs_base)
  puts "Scanning : #{doc_base}/io/*.html"
  Dir.glob("#{doc_base}/io/**/*.html") do |html_file|
    puts "Found #{html_file.to_s}"
    dest_path = html_file.to_s.gsub(doc_base, site_docs_base)
    puts "Copying to #{dest_path}"
    html_doc = fixing_documentation_page(html_file.to_s)
    write_with_path(dest_path, html_doc)
  end
  puts "Scanning : #{doc_base}/io/*.png"
  Dir.glob("#{doc_base}/io/**/*.png") do |image_file|
    puts "Found #{image_file.to_s}"
    dest_path = image_file.to_s.gsub(doc_base, site_docs_base)
    puts "Copying to #{dest_path}"
    FileUtils.copy(image_file, dest_path)
  end
  puts "Scanning : #{doc_base}/js/lang-*.js"
  Dir.glob("#{doc_base}/js/lang-*.js") do |js_file|
    puts "Found #{js_file.to_s}"
    dest_path = js_file.to_s.gsub(doc_base, FileUtils.pwd)
    puts "Copying to #{dest_path}"
    FileUtils.copy(js_file, dest_path)
  end
end

#rake copy_javadoc
desc "Copies Java Documentation created with build_javadoc"
task :copy_javadoc do
  sarl_generated_apidoc = CONFIG["sarl"]["generated_apidoc"]
  sarl_copy = ensure_git_sarl_repository(false) 
  site_javadoc_base = FileUtils.pwd + "/" + CONFIG["apidoc_dir"]
  puts "Copying Java documentation to #{site_javadoc_base}"
  javadoc_base = "#{sarl_copy}/#{sarl_generated_apidoc}"
  FileUtils.rm_rf(site_javadoc_base)
  Dir.glob("#{javadoc_base}/**/*") do |jdoc_file|
    if (not File.directory?(jdoc_file.to_s))
      puts "Found #{jdoc_file.to_s}"
      dest_path = jdoc_file.to_s.gsub(javadoc_base, site_javadoc_base)
      puts "Copying to #{dest_path}"
      FileUtils.mkdir_p(File.dirname(dest_path))
      FileUtils.copy(jdoc_file, dest_path)
    end
  end
end

#rake generate_changelog["version number","force generation flag"]
desc "Generate the changelog file for the current version"
task :generate_changelog, :version, :force do |t, args|
  sarl_copy = ensure_git_sarl_repository(false)
  template = CONFIG["page"]["template"]
  extension = CONFIG["page"]["extension"]
  editor = open_command
  changelog_dir = CONFIG["changelog_dir"]

  version = args[:version]

  if (version.blank?) then
    version = extract_version_from_pom(sarl_copy)
  end
  if (version.blank?) then
    raise "Cannot determine the version of SARL from the 'pom.xml' file."
  end

  if (args[:force].blank? and /\-SNAPSHOT$/ =~ version) then
    raise "You cannot generate the change log for a SNAPSHOT version."
  else
    version = version.sub(/\-SNAPSHOT$/, "")
  end

  file_version = version.gsub(/[^0-9a-zA-Z_.\-]+/, "_")

  title = "Changes in " + version
  filename = "changelog_#{file_version}.#{extension}"

  content = read_file(template) + "\n\n\# #{title}\n\n" + generate_changelog_markdown(sarl_copy, CONFIG["sarl"]["git_name"])

  FileUtils.mkdir_p(changelog_dir)
  if (args[:force]) then
  end
  create_file(changelog_dir, filename, content, title, editor, true)
end

desc "Full build of the Jnario part of the site : build_doc, copy_sarl_doc, build"
task :build_jnario_only do
    Rake::Task[:build_doc].invoke
    Rake::Task[:copy_sarl_doc].invoke
    Rake::Task[:build].invoke
end


desc "Full build of site : build_doc, build_javadoc, copy_sarl_doc, copy_javadoc, build"
task :build_full do
    Rake::Task[:build_doc].invoke
    Rake::Task[:build_javadoc].invoke
    Rake::Task[:copy_sarl_doc].invoke
    Rake::Task[:copy_javadoc].invoke
    Rake::Task[:build].invoke
end

