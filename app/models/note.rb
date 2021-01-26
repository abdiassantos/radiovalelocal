# frozen_string_literal: true

class Note < Post
  ## ASSOCIATIONS
  belongs_to :blog

  ## VALIDATIONS
  validates :blog_id, presence: true
end
