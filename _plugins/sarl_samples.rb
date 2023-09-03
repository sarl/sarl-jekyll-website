# Syntax: {% generate_sarl_sample_descriptions %}
#

require 'nokogiri'
require 'pathname'
require 'fileutils'

module GenerateSarlSampleDescriptionsUtils

	def read_document_descriptions(path)
		content = {}

		Dir.foreach(path) do |sampleFolder|
			next if sampleFolder == '.' or sampleFolder == '..'

			documentationFolder = File.join(path, sampleFolder)
			documentationFile = File.join(documentationFolder, 'documentation.xml')

			if File.file?(documentationFile) then
				xmldoc = File.open(documentationFile) { |f| Nokogiri::XML(f) }

				id = xattr(xmldoc, '//documentation', 'id')
				name = xattr(xmldoc, '//documentation', 'name')
				category = xattr(xmldoc, '//documentation', 'category')

				rawMainPage = xnode(xmldoc, 'documentation/mainPage')
				if rawMainPage.start_with?("http:") or rawMainPage.start_with?("https:") then
					isLocalMainPage = false
					inputMainPage = rawMainPage
					inputMainPageFolder = documentationFolder
				else
					isLocalMainPage = true
					inputMainPage = File.absolute_path(rawMainPage, documentationFolder)
					inputMainPageFolder = File.dirname(inputMainPage)
				end

				rawScreenshot = xnode(xmldoc, 'documentation/screenshot')
				inputScreenshot = make_relative_to_mainpage(
					rawScreenshot,  documentationFolder, inputMainPageFolder)

				inputResources = []
				if isLocalMainPage then
					resources = xmldoc.xpath("//documentation/resources")
					if not resources.nil? then
						for resource in resources.children do
							rvalue = resource.text.to_s.strip
							if not rvalue.empty? then
								inputResource = make_relative_to_mainpage(
									rvalue, documentationFolder,
									inputMainPageFolder)
								inputResources.push(inputResource)
							end
						end
					end
				end

				if content[category].nil? then
					content[category] = {}
				end
				if content[category][id].nil? then
					content[category][id] = {}
				end
				
				content[category][id][:id] = id
				content[category][id][:source] = documentationFolder
				content[category][id][:islocal] = isLocalMainPage
				content[category][id][:name] = name
				content[category][id][:mainPage] = inputMainPage
				content[category][id][:screenshot] = inputScreenshot
				content[category][id][:resources] = inputResources
				content[category][id][:description] = xnode!(xmldoc, '//documentation/description')

			end			
		end
		return content
	end
	
	def make_relative_to_mainpage(path, documentationFolder, mainPageFolder)
		input = File.absolute_path(File.join(documentationFolder, path))
		path0 = Pathname.new(mainPageFolder)
		path1 = Pathname.new(input)
		relPath = path1.relative_path_from(path0)
		relFile = relPath.to_s
		return relFile
	end

	def strip_or_self!(str)
		str.strip! || str
	end

	def xnode(xmldoc, name)
		node = xmldoc.at_xpath('//' + name)
		if node.nil? then
			raise("SARL code sample: no '" + name + "' in " + documentationFile)
		end
		return node.text
	end

	def xnode!(xmldoc, name)
		node = xmldoc.at_xpath('//' + name)
		if node.nil? then
			return ''
		end
		return node.text
	end

	def xattr(xmldoc, nodeName, attrName)
		node = xmldoc.xpath('//' + nodeName)
		if node.nil? then
			raise("SARL code sample: no '" + nodeName + "' in " + documentationFile)
		end
		value = node.attr(attrName)
		if value.nil? then
			raise("SARL code sample: no attribute '" + attrName + "' in " + documentationFile)
		end
		return value.text
	end

	def get_category_level(category)
		category.count('.') + 1
	end

	def get_category_label(category)
		label = Jekyll.configuration({})['sarl']['sample_categories'][category]
		if label.nil? or label.empty? then
			return ''
		end
		return label
	end

	def all_sequences(value, separator)
		seqs = []
		elements = value.to_s.split(separator)
		current = ''
		for element in elements do
			if not current.empty? then
				current = current + '.'
			end
			current = current + element
			seqs.push(current.to_s)
		end
		return seqs.sort
	end

	def update_section_numbers(sectionNumbers, level)
		if sectionNumbers[level].nil? then
			sectionNumbers[level] = 1
		else
			sectionNumbers[level] = sectionNumbers[level] + 1
		end
		i = level + 1
		while not sectionNumbers[i].nil? do
			sectionNumbers[i] = nil
		end
	end

	def make_jekyll_markdown(title, input, output)
		content = File.read(input)
		content = "---\nlayout: default\ntitle: " + title + "\n---\n\n" + content
		File.write(output, content)
	end

end

module Jekyll

	class GenerateSarlSampleDescriptionsTag < Liquid::Tag
		include GenerateSarlSampleDescriptionsUtils
		
		def render(context)
			rootFolder = Jekyll.configuration({})['sarl']['url']
			documentationFolder = Jekyll.configuration({})['sarl']['samples_folder']
			path = File.join(rootFolder, documentationFolder)

			if not File.directory?(path) then
				raise("SARL code sample reference must be a folder into the configuration. See sarl/samples_folder in configuration.")
			end
			
			path = File.absolute_path(path)			
			
			content = read_document_descriptions(path)

			categories = generate_category_tree(content)

			return generate_output(content, categories)
		end

		def generate_output(content, categories)
			output = ''
			sectionNumbers = {}
			categories.each do |category, categoryLabel|
				level = get_category_level(category)
				update_section_numbers(sectionNumbers, level)
				lcontent = content[category]
				if not lcontent.nil? then
					output = output + "<h" + level.to_s + ">" + sectionNumbers[level].to_s + ". " + categoryLabel + "</h" + level.to_s + ">\n<table class=\"sarlSamples\">\n"
					lcontent = content[category].sort { |a,b|
						a[1][:name] <=>b[1][:name]
					}
					lcontent.each do |sampleId, sample|
						sampleDesc = generate_sample(sampleId, sample)
						output = output + sampleDesc
					end
					output = output + "</table>\n"
				else
					output = output + "<h" + level.to_s + ">" + sectionNumbers[level].to_s + ". " + categoryLabel + "</h" + level.to_s + ">\n"

				end
			end
			if output.empty? then
				return "<p>No SARL sample available.</p>"
			end
			return output
		end

		def generate_sample(id, description)
			urlScreenshot = description[:id] + '/' + File.basename(description[:screenshot])

			if description[:islocal] then
				moreInfo = description[:id] + '/index.html'
			else
				moreInfo = description[:mainPage]
			end

			value = "<tr class=\"sarlSamples\"><td rowspan=\"2\" class=\"sarlSamplesScreenshot\"><a href=\"" + moreInfo + "\"><img class=\"sarlSamples\" src=\"" + urlScreenshot + "\"></a></td><td><strong>" + description[:name] + "</strong></td></tr>\n<tr><td>" + description[:description] + "<br><a href=\"" + moreInfo + "\">More info.</a></td></tr>\n"
			return value
		end
		
		def generate_category_tree(content)
			cats = {}
			content.each do |id, value0|
				elts = all_sequences(id, /\./)
				for elt in elts do
					value = get_category_label(elt)
					if not value.empty? then
						cats[elt] = value
					end
				end
			end
			h = cats.sort_by { |id, label| cat_sort_key(id, label) }
			h = h.to_h
			return h
		end

		def cat_sort_key(id, label)
			@a = id.split(/\./)
			@b = []
			cur = ''
			for e in @a do
				if not cur.empty? then
					cur = cur + '.'
				end
				cur = cur + e
				lbl = get_category_label(cur)
				if lbl.empty? then
					lbl = e
				end
				@b.push(lbl)
			end
			@b
		end

	end

	class GenerateSarlSampleDescriptionsGenerator < Jekyll::Generator
		include GenerateSarlSampleDescriptionsUtils

		def generate(site)
			rootFolder = Jekyll.configuration({})['sarl']['url']
			documentationFolder = Jekyll.configuration({})['sarl']['samples_folder']
			path = File.join(rootFolder, documentationFolder)

			if not File.directory?(path) then
				raise("SARL code sample reference must be a folder into the configuration. See sarl/samples_folder in configuration")
			end
			
			path = File.absolute_path(path)			
			rootDir = File.absolute_path('.')
			pagePath = Jekyll.configuration({})['sarl']['sample_folder']
			relOutFolder = File.join('.', pagePath)
			outFolder = File.join(rootDir, pagePath)
			
			content = read_document_descriptions(path)

			clean_folder(outFolder)
			pages = copy_sample_documentation(content, outFolder, relOutFolder)
			
			for page in pages do
				site.pages << Jekyll::Page.new(
					site,
					rootDir,
					File.dirname(page),
					File.basename(page))
			end
		end

		def copy_sample_documentation(samples, outFolder, relOutFolder)
			pages = []
			samples.each_value do |samples0|
				samples0.each do |id, sample|
					puts "      SARL Samples: copying files for " + id + "\n"
					sampleOutFolder = File.join(outFolder, id)
					sampleRelOutFolder = File.join(relOutFolder, id)
					# Resources
					if sample[:islocal] then
						for resource in sample[:resources] do
							outputResource = File.join(sampleOutFolder, resource)
							inputResource = File.join(File.dirname(sample[:mainPage]), resource)
							puts "      SARL Samples: > " + resource + "\n"
							FileUtils.mkpath(File.dirname(outputResource))
							fext = File.extname(outputResource).to_s
							if fext == '.html' or fext == '.md' or fext == '.htm' then
								make_jekyll_markdown(sample[:name], inputResource, outputResource)
								pages.push(File.join(sampleRelOutFolder, resource))
							else
								FileUtils.cp(inputResource, outputResource)
							end
						end
					end
					# Screenshot
					puts "      SARL Samples: > " + sample[:screenshot] + "\n"
					outputScreenshot = File.join(sampleOutFolder, File.basename(sample[:screenshot]))
					if sample[:islocal] then
						inputScreenshot = File.join(File.dirname(sample[:mainPage]), sample[:screenshot])
					else
						inputScreenshot = File.join(sample[:source], sample[:screenshot])
					end
					FileUtils.mkpath(File.dirname(outputScreenshot))
					FileUtils.cp(inputScreenshot, outputScreenshot)
					# Main Page
					if sample[:islocal] then
						outputMainPage = File.join(sampleOutFolder, 'index.md')
						inputMainPage = sample[:mainPage]
						puts "      SARL Samples: > " + File.basename(sample[:mainPage]) + "\n"
						FileUtils.mkpath(File.dirname(outputMainPage))
						make_jekyll_markdown(sample[:name], inputMainPage, outputMainPage)
						pages.push(File.join(sampleRelOutFolder, 'index.md'))
					end
				end
			end
			return pages
		end

		def clean_folder(path)
			Dir.foreach(path) do |sampleFolder|
				if sampleFolder != '.' and sampleFolder != '..' then
					rfolder = File.join(path, sampleFolder)
					if File.directory?(rfolder) then
						puts "      SARL Samples: deleting files for " + sampleFolder + "\n"
						FileUtils.rmtree(rfolder)
					end
				end
			end
		end
	end

end

Liquid::Template.register_tag('generate_sarl_sample_descriptions', Jekyll::GenerateSarlSampleDescriptionsTag)
