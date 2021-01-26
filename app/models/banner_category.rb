# frozen_string_literal: true

class BannerCategory < ApplicationRecord
  ## PARANOID
  acts_as_paranoid

  ## ASSOCIATIONS
  has_many :banners

  ## SCOPES
  default_scope -> { order('id ASC') }
end
