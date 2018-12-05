# This is the data builder and will process the files in 'files' folder and extract the front matter and markdown content

require "front_matter"
require "markd"
require "yaml"

module Static
  class Builder

      @directory: String
      @@data = [] of Post

      def initialize(directory)
          @directory = directory
      end

      def process_files
          # dir = Dir.open(@directory)
          Dir.glob("#{@directory}/*.md").each { |file|
              print "File found! -- #{file} -- "
              process_file(file)
              print "File processed :) \n"
          }
      end

      def process_file(file)
          File.open(file, "r") { |fd|
              FrontMatter.parse(fd) { |front_matter, content|
              
                  md = content.gets_to_end
      
                  post = Post.new(parse_yaml(front_matter), parse_markdown(md))
                  
                  # print_markdown(md)
                  @@data << post
              }
          }
      end

      def print_data
          puts @@data
      end

      # Function to convert the md content to html which can be further added into the rendered template
      def parse_markdown(md)
          html = Markd.to_html(md)
      end

      # Method to convert the frot-matter from the file into a hash object which can be used during rendering
      def parse_yaml(yml)
          # header = YAML.parse(yml)
          Front_Matter.from_yaml(yml)

      end

      class Front_Matter
      YAML.mapping(
          title: String,
          tags: String,
          author: String
      )
      end

      class Post
          @post_info: Front_Matter
          def initialize(post_info, content = "")
              @post_info = post_info
              @content = content
          end

      end
  end
end




