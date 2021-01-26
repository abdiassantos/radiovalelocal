# frozen_string_literal: true

class User < ApplicationRecord
  acts_as_paranoid

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  ## ACTIVE STORAGE
  has_one_attached :avatar

  ## ATTRIBUTES
  attr_accessor :remove_avatar

  ## CALLBACKS
  after_save :purge_avatar, if: -> { remove_avatar == '1' }

  def purge_avatar
    avatar.purge_later
  end
end
