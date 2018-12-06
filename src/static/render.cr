require "crinja"

# CRINJA = Crinja.new(loader: Crinja::Loader::FileSystemLoader.new(["src/views/layouts", "src/views/pages", "src/views/components"]))
CRINJA = Crinja.new
# CRINJA.cache = Crinja::TemplateCache::NoCache.new
CRINJA.cache = Crinja::TemplateCache::InMemory.new
CRINJA.loader = Crinja::Loader::FileSystemLoader.new(["templates/layouts", "templates/pages", "templates/components"])

# module Static
    
    class Static::Renderer

        def self.render_crinja(template, arguments)
            render_crinja(template, arguments)
        end

        macro render_crinja(template, arguments)
            ret = ""
            elapsed = Time.measure do
                tpl = CRINJA.get_template("#{ {{template}} }")
                if {{arguments}}
                    ret = tpl.render({{arguments}})
                else
                    ret = tpl.render()
                end
            end
            puts "Page rendered in: #{elapsed.microseconds}µs"
            ret
        end
    end

# end