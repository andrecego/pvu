class Stat < ApplicationRecord
  belongs_to :config

  enum element: {
    dark: 0,
    electro: 1,
    fire: 2,
    ice: 3,
    light: 4,
    parasite: 5,
    metal: 6,
    water: 7,
    wind: 8
  }
end
