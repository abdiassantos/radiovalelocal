# frozen_string_literal: true

module MenuHelper
  def menu_state?(controller)
    controller == controller_name
  end

  def menu_group_state?(controller_group)
    controller_group.include?(controller_name)
  end
end
