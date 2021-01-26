# frozen_string_literal: true

class Medium < ApplicationRecord
  ## ENUMERATIONS
  enum kind: { radio: 0, youtube: 1 }
end
