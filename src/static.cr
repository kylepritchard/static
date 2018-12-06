require "./static/*"
require "kemal"

blog = Static::Builder.new("files")

get "/" do
    blog.lookup_page("this-is-a-test")
end

Kemal.run