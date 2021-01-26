# frozen_string_literal: true

class SocialNetwork < ApplicationRecord
  acts_as_paranoid

  # VALIDATIONS
  validates :name, :description, presence: true

  ## ACTIVE STORAGE
  has_one_attached :image

  ## ATTRIBUTES
  attr_accessor :remove_image

  ## CALLBACKS
  after_save :purge_image, if: -> { remove_image == '1' }

  def purge_image
    image.purge_later
  end
end
