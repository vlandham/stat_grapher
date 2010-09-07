STD_BUTTON_REGEX = /(EXIT|BACK|PAGE_DOWN|PAGE_UP|CANCEL|MENU)/
KEYBOARD_PAGE_NAMES = /(PageKeyboard|PageFind.*Spell|PageFindAdrsStrt|PageFindAdrsNmbr|PageAsrSettingsWakeupPhraseKeyboard)/

BUTTON_SUBS_LAMBDAS = [
  lambda {|button_name, page_name| 
    if(page_name =~ KEYBOARD_PAGE_NAMES )      
      button_name = button_name.size == 1 ? "Alpha/Numeric Keys" : button_name 
    end
    button_name
  },
  lambda {|button_name, page_name| 
    if(page_name =~ /ASR$/)
      unless( button_name =~ STD_BUTTON_REGEX || button_name =~ /ASR_/ )
        button_name = "Search Term"
      end      
    end
    button_name
    },
  lambda {|button_name, page_name| 
    if(page_name =~ /PageFindList/)
      unless( button_name =~ STD_BUTTON_REGEX || button_name =~ /^Home$/)
        button_name = "Search Term"
      end      
    end
    button_name
    }    
]

BUTTON_SUBS = [
  [/_PORT$/, ""],
  [/^STR_/, ""],
  [/^STOCK_/,""],
  [/^03bc.*/, "Map"]
]

class ButtonNameSubstitutions
  def self.sub(button_name, page_name)
    BUTTON_SUBS.each do |match,sub|
      button_name.gsub!(match,sub)
    end
    BUTTON_SUBS_LAMBDAS.each do |lam|
      button_name = lam.call(button_name, page_name)
    end
    button_name
  end
end
