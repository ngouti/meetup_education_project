class Interest < ApplicationRecord
    has_many :user_interests
    has_many :users, through: :user_interests
    has_many :event_interests
    has_many :events, through: :event_interests
end
