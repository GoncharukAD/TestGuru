module FlashHelper
  def flash_alert
    if flash[:type]
     content_tag :p, flash[:type], class: 'flash alert'
    end
  end
end  
