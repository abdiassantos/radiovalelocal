# frozen_string_literal: true

class Contact < ApplicationRecord
  ## PARANOID
  acts_as_paranoid

  # VALIDATIONS
  validates :name, :email, :message, :phone, presence: true

  ## ENUMS
  enum status: { pendent: 0, answered: 1, discarted: 2 }, _prefix: :status
end
