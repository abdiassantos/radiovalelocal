# frozen_string_literal: true

class Editory < ApplicationRecord
  ## PARANOID
  acts_as_paranoid

  ## ASSOCIATIONS
  has_many :articles

  ## SCOPES
  scope :active, -> { where(status: 1) }
  scope :menu, -> { active.where(menu: true) }

  ## VALIDATIONS
  validates :name, presence: true

  ## ENUMERATIONS
  enum status: { enabled: 0, disabled: 1 }

  ## FRIENDLY_ID
  extend FriendlyId
  friendly_id :name, use: %i[slugged finders history]

  def should_generate_new_friendly_id?
    slug.blank? || name_changed?
  end
end
