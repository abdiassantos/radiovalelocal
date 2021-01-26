# frozen_string_literal: true

module ToastrHelper
  def toastr_bootstrap_flash
    flash_messages = []
    flash.each do |type, message|
      type = 'success' if type == 'notice'
      type = 'error'   if type == 'alert'
      text = "<script>
      toastr.options.positionClass = 'toast-bottom-full-width';
      toastr.#{type}('#{message}');
      </script>"
      flash_messages << text.html_safe if message
    end
    flash_messages.join("\n").html_safe
  end

  def toastr_bootstrap_desktop_flash
    flash_messages = []
    flash.each do |type, message|
      type = 'success' if type == 'notice'
      type = 'error'   if type == 'alert'
      text = "<script>
      toastr.options.positionClass = 'toast-top-right';
      toastr.#{type}('#{message}');
      </script>"
      flash_messages << text.html_safe if message
    end
    flash_messages.join("\n").html_safe
  end
end
