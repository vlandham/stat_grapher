
class Page
  attr_accessor :name
  
  def initialize(raw_new_name)
      @name = raw_new_name
      @total_clicks = 0
      @buttons = Hash.new { |hash, key| hash[key] = 0 }
  end
  
  def count
      @buttons.size
  end
  
  def add( button_name, click_time, page_name )
    button_name = clean_button_name(button_name, page_name)
    if( check_name(button_name))
      @buttons[button_name] += 1
      @total_clicks += 1
    end
  end
  
  def clean_button_name(button_name, page_name)
      ButtonNameSubstitutions.sub( button_name, page_name )
  end
  
  def check_name(button_name)
    button_name != "00000000" # don't know what this is
  end
  
  def total_clicks
    @total_clicks
      # @buttons.values.inject(0) { |result, element| result + element }
  end
  
  def total_buttons
      @buttons.size
  end
  
  def button_counts
      @buttons
  end
  
  def button_percentages
    percentages = {}
    clicks = total_clicks.to_f
    @buttons.each do |button, count|
      percentages[button] = (( (count.to_f / clicks) * 100.0 ) * 100 ).round.to_f / 100
    end
    percentages.sort {|a,b| b[1] <=> a[1]}
  end
  
 # def eql?(o)
 #     o.is_a?(Page) && name == o.name
 # end
  
  #def hash
  #    @name.hash
  #end
end 