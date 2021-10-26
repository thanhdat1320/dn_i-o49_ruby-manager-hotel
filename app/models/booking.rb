class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :contact

  enum status: {cancel: 0, wait: 1, accept: 2, reject: 3}
end
