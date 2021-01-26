# frozen_string_literal: true

module NoticeHelper
  def flash_message
    messages = ''
    %i[notice info warning error].each do |type|
      next unless flash[type]

      type_alert = type
      type_alert = :danger  if type == :error
      type_alert = :success if type == :notice
      messages += "<p class=\"alert alert-#{type_alert}\">#{flash[type]}</p>"
    end

    messages.html_safe
  end

  def toastr_flash
    flash_messages = []
    flash.each do |type, message|
      type = 'success' if type == 'notice'
      type = 'error'   if type == 'alert'
      text = "<script>toastr.#{type}('#{message}');</script>"
      flash_messages << text.html_safe if message
    end
    flash_messages.join("\n").html_safe
  end

  def pnotify_flash
    flash_messages = []
    flash.each do |type, message|
      type = 'success' if type == 'notice'
      type = 'error'   if type == 'alert'
      text = "<script>PNotify.#{type}('#{message}');</script>"
      flash_messages << text.html_safe if message
    end
    flash_messages.join("\n").html_safe
  end
end
