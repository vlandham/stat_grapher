PAGE_SUBS = [
  [/STR_ASR.*COMMAND/, "ASR"],
  [/STR_/,""],
 # [/(.*Keyboard|PageFind.*Spell|PageFindAdrsStrt|PageFindAdrsNmbr)/, "Keyboards"]
]

class PageSubstitutions
  def self.sub(page_name)
    PAGE_SUBS.each do |match, sub|
      page_name.gsub!(match, sub)
    end 
    page_name
  end
end