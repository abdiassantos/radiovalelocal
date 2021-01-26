# frozen_string_literal: true

class Gallery < ApplicationRecord
  ## PARANOID
  acts_as_paranoid

  ## ASSOCIATIONS
  has_many :images, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  ## ENUMERATIONS
  enum status: { disabled: 0, enabled: 1 }

  ## FRIENDLY_ID
  extend FriendlyId
  friendly_id :name, use: :slugged
end
