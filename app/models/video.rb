# frozen_string_literal: true

class Video < ApplicationRecord
  ## PARANOID
  acts_as_paranoid

  ## ASSOCIATIONS
  has_one_attached :image
end
