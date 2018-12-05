require "./static/*"

blog = Static::Builder.new("files")
blog.process_files
# blog.print_data