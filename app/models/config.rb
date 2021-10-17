class Config < ApplicationRecord
  belongs_to :plant
  has_one :farm
  has_one :stat
end
