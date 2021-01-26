# frozen_string_literal: true

class News < Post
  ## ASSOCIATIONS
  belongs_to :county

  ## VALIDATIONS
  validates :county_id,
            :content,
            :image,
            presence: true

  validates :headline, length: { maximum: 30 }
  validates :title, length: { maximum: 100 }
end
