# frozen_string_literal: true

class Article < Post
  ## ASSOCIATIONS
  belongs_to :editory

  ## VALIDATIONS
  validates :editory_id,
            :content,
            :image,
            presence: true

  validates :headline, length: { maximum: 30 }
  validates :title, length: { maximum: 100 }
end
