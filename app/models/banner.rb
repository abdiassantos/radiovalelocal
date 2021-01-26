# frozen_string_literal: true

class Banner < ApplicationRecord
  ## PARANOID
  acts_as_paranoid

  # ASSOCIATIONS
  belongs_to :bannerable, polymorphic: true
  belongs_to :banner_category, optional: true

  ## ACTIVE STORAGE
  has_one_attached :file

  ## ENUMERATIONS
  enum status: { disabled: 0, enabled: 1 }
  enum kind: { super: 0, side: 1, alert: 2, middle: 3, main: 4 }

  # VALIDATIONS
  validates :link, presence: true


  ## VALIDATIONS
  validates :link,
            presence: true
  
  validates :file, presence: true, if: -> { kind != 'main' }, on: %i[create update]

  # SCOPES
  default_scope -> { order(status: :desc) }

  scope :active, -> { where(status: true).where('? BETWEEN start_at AND finish_at', Time.now) }

  ## ATTRIBUTES
  attr_accessor :remove_file

  ## CALLBACKS
  after_save :purge_file, if: -> { remove_file == '1' }

  def purge_file
    file.purge_later
  end
end
