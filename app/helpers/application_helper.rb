# frozen_string_literal: true

module ApplicationHelper
  def show_errors_for(object)
    return unless object.try(:errors).try(:any?)

    content_tag(:div, class: 'block block-rounded block-themed') do
      concat(content_tag(:div, class: 'block-header bg-danger') do
        concat(content_tag(:h3, class: 'block-title') do
          if object.errors.count == 1
            concat '1 erro foi encontrado:'
          else
            concat "#{pluralize(object.errors.count, 'erros')} foram encontrados:"
          end
        end)
      end)
      concat(content_tag(:div, class: 'block-content') do
        concat(content_tag(:ul) do
          object.errors.full_messages.each do |msg|
            concat content_tag(:li, msg)
          end
        end)
      end)
    end
  end
end
