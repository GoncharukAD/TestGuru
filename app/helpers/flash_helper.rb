# frozen_string_literal: true

module FlashHelper
  def flash_type
    if flash[:alert]
      content_tag :p, flash[:alert], class: 'flash_alert'
    else flash[:notice]
      content_tag :p, flash[:notice], class: 'flash_notice'
    end
  end
end
