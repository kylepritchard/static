# This is the data builder and will process the files in 'files' folder and extract the front matter and markdown content

require "front_matter"
# require "markd"
require "yaml"
require "markdown"
require "./front-matter.cr"
# require "./*"

module Static

  class Builder

    @directory: String
    @@data = [] of Post
    @html: HTML_Table

    def initialize(directory)
      @directory = directory
      process_files
      @html = HTML_Table.new
    end

    private def process_files
      # dir = Dir.open(@directory)
      Dir.glob("#{@directory}/*.md").each { |file|

        print "File found! -- #{file} -- "
        elapsed = Time.measure do
          process_file(file)
        end
        print "File processed :) -- #{elapsed.microseconds}uS \n"
      }
    end

    private def process_file(file)
      File.open(file, "r") { |file|
        FrontMatter.parse(file) { |front_matter, content|
          md = content.gets_to_end
          post = Post.new(parse_yaml(front_matter), parse_markdown(md))
          @@data << post
        }
      }
    end
    
    # Function to convert the md content to html which can be further added into the rendered template
    private def parse_markdown(md)
      # html = Markd.to_html(md)
      Markdown.to_html(md)
    end
    
    # Method to convert the frot-matter from the file into a hash object which can be used during rendering
    private def parse_yaml(yml)
        # header = YAML.parse(yml)
      Front_Matter.from_yaml(yml)
      
    end

    # Return the class variable @@data - to make visible for checkings
    def self.data
      @@data
    end

    def lookup_page(key)
      @html.lookup_table(key)
    end

    class Post
      @info: Front_Matter
      
      def initialize(post_info, content = "")
        @info = post_info
        @content = content
      end

      def info
        @info
      end

      def content
        @content
      end
    end

    # Start next stage - Convert data to a hash table containing html pages (rendered complete)

    class HTML_Table
      @pages : Hash(String, String)

      def initialize
        @pages = Hash(String, String).new
        render_pages
      end

      private def render_pages
        Static::Builder.data.each { |post|
          info = post.info
          key = form_key(post.@info.title)
          value = render_page(post)
          @pages[key] = value
        }
      end

      private def form_key(title)
        title.tr(" ", "-").downcase
      end

      private def render_page(post)
        arguments = Hash(String, String | Nil).new 
        arguments["content"] = post.@content
        arguments["title"] = post.@info.title
        unless post.@info.tags.nil?
          arguments["tags"] = post.@info.tags 
        end
        unless post.@info.date.nil?
          arguments["date"] = post.@info.date
        end
        unless post.@info.image.nil?
          arguments["image"] = post.@info.image
        end
        
        Static::Renderer.render_crinja("index.tpl", arguments)
      end

      private def print_hash
        puts @pages
      end

      def lookup_table(key)
        @pages[key]
      end

    end
  end
end