# frozen_string_literal: true

class County < ApplicationRecord
  ## PARANOID
  acts_as_paranoid

  ## ASSOCIATIONS
  has_many :news
  has_many :blogs

  ## VALIDATIONS
  validates :name, presence: true

  ## ENUMERATIONS
  enum status: { disabled: 0, enabled: 1 }

  ## FRIENDLY_ID
  extend FriendlyId
  friendly_id :name, use: %i[slugged finders history]

  def should_generate_new_friendly_id?
    slug.blank? || name_changed?
  end
end
