require "./static/*"
require "kemal"

blog = Static::Builder.new("files")

get "/:post" do |env|
    post = env.params.url["post"]
    blog.lookup_page(post)
end
  
get "/" do
    blog.lookup_page("index")
end

Kemal.run