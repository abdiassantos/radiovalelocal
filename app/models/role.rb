# frozen_string_literal: true

class Role < ApplicationRecord
  ## ASSOCIATIONS
  has_and_belongs_to_many :users, join_table: :users_roles

  belongs_to :resource,
             polymorphic: true,
             optional: true

  ## VALIDATIONS
  validates :resource_type,
            inclusion: { in: Rolify.resource_types },
            allow_nil: true

  ## ROLIFY
  scopify
end
