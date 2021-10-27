class User < ApplicationRecord
  belongs_to :contact

  enum role: {admin: 0, staff: 1, customer: 2}
end
