# frozen_string_literal: true

class Post < ApplicationRecord
  ## PARANOID
  acts_as_paranoid

  ## ActsAsTaggableOn
  # acts_as_taggable # Alias for acts_as_taggable_on :tags
  # acts_as_taggable_on :skills, :interests
  #  acts_as_taggable_on :tags

  ## ACTIVE STORAGE
  has_one_attached :image

  ## ASSOCIATION
  belongs_to :user

  ## ENUMERATIONS
  enum status: { enabled: 0, disabled: 1 }
  enum position: { normal: 0, main: 1 }

  ## FRIENDLY_ID
  extend FriendlyId
  friendly_id :title, use: %i[slugged finders history]

  ## VALIDATIONS
  validates :title,
            :content,
            :published_at,
            presence: true

  ## ATTRIBUTES
  attr_accessor :remove_image

  default_scope -> { order(created_at: :desc) }

  scope :active, -> { where(status: "enabled") }

  ## CALLBACKS
  after_save :purge_image, if: -> { remove_image == '1' }

  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end

  private

  def purge_image
    image.purge_later
  end
end
