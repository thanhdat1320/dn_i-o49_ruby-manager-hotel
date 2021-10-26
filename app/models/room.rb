class Room < ApplicationRecord
  has_many :room_attribute_groups, dependent: :destroy
  has_many :room_attributes, through: :room_attribute_groups

  enum level: {normal: 0, superior: 1, vip: 2, luxury: 3}
  enum status: {unavailable: 0, available: 1}

  validates :name, presence: true,
            length: {maximum: Settings.digit.length_255}

  scope :room_sort, ->(sort){order(price: sort || :asc)}
  scope :room_search,
        ->(keyword){where("rooms.name LIKE ?", "%#{keyword}%")}
  scope :room_has_attribute,
        ->(ids){where(room_attributes: {id: ids})}

  def self.room_filter prs
    rooms = Room.all
    rooms = rooms.room_search(prs[:keyword]) if prs[:keyword]
    if prs[:attributes] && prs[:attributes].length > 1
      # collection_select got by default [""]
      rooms = rooms.joins(:room_attributes)
                   .room_has_attribute(prs[:attributes])
    end
    rooms = rooms.room_sort(prs[:sort]) if prs
    rooms.page(prs[:page]).per(Settings.digit.length_4)
  end
end
