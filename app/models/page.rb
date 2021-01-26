# frozen_string_literal: true

class Page < ApplicationRecord
  ## PARANOID
  acts_as_paranoid

  ## ENUMS
  enum status: { disabled: 0, enabled: 1 }
  enum kind: { about_radio: 0, about_group: 1 }

  ## VALIDATIONS
  validates :title, :content, presence: true

  ## FRIENDLY_ID
  extend FriendlyId
  friendly_id :title, use: :slugged
end
