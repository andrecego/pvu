class Farm < ApplicationRecord
  belongs_to :config

  default_scope { order(le_rate: :desc) }
end
