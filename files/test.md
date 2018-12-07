---
title: This is a test
tags: One, Two, Three
author: kyle
---

# this is main title

uhububybubub

huhiin

## jnkjknknkn

```ruby
hb = ghghhh
```



hjnjbjhbjbjbjbhjbjbj

jbjbjbjbjb

hbjbjbjbjbjbjbjbjbjbjhbjbjbjb

1. hnjjbn
2. bjbjb
3. hbjhbjbj
4. hbjbjbjh

njnkn

```ruby
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
```





This is typing normally or as markdown??

This is a big long section of text, i am curious what the output will look like...

```Ruby
var e = "Hello"
def hello 
    puts "Hello"
end
```

![](\images\0CFAAA9D-DBF1-4EB7-8353-A0FCA6768F14.jpg "Optional images replacement")





This is next part





T**his is strange**