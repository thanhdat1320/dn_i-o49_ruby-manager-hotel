class Room < ApplicationRecord
  enum level: {standard: 0, superior: 1, vip: 2, luxury: 3}
  enum status: {unavailable: 0, available: 1}
  validates :name, presence: true,
            length: {maximum: Settings.digit.length_255}
end
