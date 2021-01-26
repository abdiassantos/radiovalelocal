# frozen_string_literal: true

class Blog < ApplicationRecord
  ## PARANOID
  acts_as_paranoid

  ## ASSOCIATIONS
  belongs_to :user
  accepts_nested_attributes_for :user

  belongs_to :county, optional: true
  accepts_nested_attributes_for :county

  has_many :notes, dependent: :destroy

  ## VALIDATIONS
  validates :name, :user_id, presence: true
  validates :name, uniqueness: true

  ## ACTIVE STORAGE
  has_one_attached :photo
  has_one_attached :background

  ## SCOPES
  default_scope  -> { order(name: :asc) }
  scope :active, -> { where(status: 1) }
  scope :counties, -> { where(kind: 1) }

  ## ENUMS
  enum status: { disabled: 0, enabled: 1 }
  enum kind: { normal: 0, county: 1 }

  ## FRIENDLY_ID
  extend FriendlyId
  friendly_id :name, use: :slugged

  ## ATTRIBUTES
  attr_accessor :remove_photo
  attr_accessor :remove_background

  ## CALLBACKS
  after_save :purge_photo, if: -> { remove_photo == '1' }
  after_save :purge_background, if: -> { remove_background == '1' }

  def should_generate_new_friendly_id?
    slug.blank? || name_changed?
  end

  def purge_photo
    photo.purge_later
  end

  def purge_background
    background.purge_later
  end
end
