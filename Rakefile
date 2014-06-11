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

SARL_DOC_SUITE = "docs/io.sarl.docs.suite"
SARL_GENERATED_DOC = "#{SARL_DOC_SUITE}/target/jnario-doc"

# == Helpers ===================================================================

# Execute a system command
def execute(command)
  system "#{command}"
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

# Create the file with the slug and open the default editor
def create_file(directory, filename, content, title, editor)
  if File.exists?("#{directory}/#{filename}")
    raise "The file already exists."
  else
    write_file(content, title, directory, filename)
    if editor && !editor.nil?
      sleep 1
      execute("#{editor} #{directory}/#{filename}")
    end
  end
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


def add_navbar(source, navbar_file="_includes/navbar.html")
  navbar = read_file(navbar_file)
  f = File.open(source)
  html_doc = Nokogiri::HTML(f)
  html_doc.css("body").children.first.add_previous_sibling(navbar)
  html_doc
end
# == Tasks =====================================================================

# rake post["Title"]
desc "Create a post in _posts"
task :post, :title do |t, args|
  title = args[:title]
  template = CONFIG["post"]["template"]
  extension = CONFIG["post"]["extension"]
  editor = CONFIG["editor"]
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
  editor = CONFIG["editor"]
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
  print "> "
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
  editor = CONFIG["editor"]
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
  sarl_git_url = CONFIG["sarl"]["url"]
  sarl_copy = "#{CONFIG["sarl"]["workdir"]}/sarl_copy"
  
  if(!File.exists?(sarl_copy))
    puts "No working copy found. Cloninng to #{sarl_copy}..."    
    execute("git clone #{sarl_git_url} #{sarl_copy}")
  else
    puts "working copy found [#{sarl_copy}]. Updating..."
    execute("cd #{sarl_copy} && git pull --rebase")
  end

  
  puts "Checking branch [#{CONFIG["sarl"]["branch"]}]"
  execute("cd #{sarl_copy} && git checkout #{CONFIG["sarl"]["branch"]}")

  puts "Compling documentation ..."
  execute("mvn -f #{sarl_copy}/pom.xml #{option} test")
  execute("mvn -f #{sarl_copy}/#{SARL_DOC_SUITE}/pom.xml org.jnario:report:generate")

  puts "Documentation generated"
  
end

desc "Copies SARL Documentation created with build_doc for sarl-site."
task :copy_sarl_doc do
  sarl_copy = "#{CONFIG["sarl"]["workdir"]}/sarl_copy"
  puts "Copying documentation to #{FileUtils.pwd}"
  doc_base = "#{sarl_copy}/#{SARL_GENERATED_DOC}"
  puts "Scanning : #{doc_base}/io/*.html"
  Dir.glob("#{doc_base}/io/**/*.html") do |html_file|
    puts "Found #{html_file.to_s}"
    dest_path = html_file.to_s.gsub(doc_base, FileUtils.pwd)
    puts "Copying to #{dest_path}"
    html_doc = add_navbar(html_file.to_s)
    write_with_path(dest_path, html_doc.to_html)
  end
  puts "Scanning : #{doc_base}/io/*.png"
  Dir.glob("#{doc_base}/io/**/*.png") do |image_file|
    puts "Found #{image_file.to_s}"
    dest_path = image_file.to_s.gsub(doc_base, FileUtils.pwd)
    puts "Copying to #{dest_path}"
    FileUtils.copy(image_file, dest_path)
  end
end

desc "Full build of site : build_doc, copy_sarl_doc, build"
task :build_full do
    Rake::Task[:build_doc].invoke
    Rake::Task[:copy_sarl_doc].invoke
    Rake::Task[:build].invoke
end

def write_with_path(dst, content)
  FileUtils.mkdir_p(File.dirname(dst))
  # Not available on Ruby installed on Ubuntu LTS
  #File.write(dst,content)
  file = File.open(dst, "w")
  file.write(content) 
  file.close unless file == nil
end

