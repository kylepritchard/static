# Comment
# I think we now have some syncing

require "front_matter"


File.open("files/test.md", "r") { |fd|
    FrontMatter.parse(fd) { |front_matter, content_io|
    
        puts front_matter
        puts content_io

		# Do something with the front matter and content.
		# Parse the front matter as YAML, JSON or something else?

	}
}

FrontMatter.open("files/test.md") { |front_matter, content_io|

	# Do something with the front matter and content.
	# Parse the front matter as YAML, JSON or something else?

    puts front_matter
    puts content_io.gets_to_end

    
}