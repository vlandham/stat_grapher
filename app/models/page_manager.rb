class PageManager
    attr_accessor :pages

    def initialize
        @pages =  {}
    end
    
    def add( page_name, button_name, click_time )
        return if !page_name
        page_name = clean_page_name(page_name) 
        page = @pages[page_name]
        if !page       
         page = Page.new( page_name )
        end
        page.add( button_name, click_time, page_name )
        @pages[page_name] = page
    end
    
    def clean_page_name(page_name)
      page_name = page_name.gsub(/^.*GUI\d*/,"")
      page_name.chop! if page_name[-1] == "E"[0]
      
      PageSubstitutions.sub(page_name)
    end
    
    def sorted_pages
        @pages.values.sort {|a,b| b.total_clicks <=> a.total_clicks }
    end
end