# frozen_string_literal: true

module FlashHelper
  def flash_alert
    content_tag :p, flash[:type], class: 'flash alert' if flash[:type]
  end
end
