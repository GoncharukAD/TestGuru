# frozen_string_literal: true

module FlashHelper

  def flash_class(key)
    mapping = {
      'alert' => 'alert-warning',
      'notice' => 'alert-info',
    }
    "alert #{mapping[key]} alert-dismissable"
  end
end
