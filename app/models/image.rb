# frozen_string_literal: true

class Image < ApplicationRecord
  acts_as_paranoid
  belongs_to :imageable, polymorphic: true

  ## ACTIVE STORAGE
  has_one_attached :file

  ## ATTRIBUTES
  attr_accessor :remove_file

  ## CALLBACKS
  after_save :purge_file, if: -> { remove_file == '1' }

  def purge_file
    file.purge_later
  end
end
