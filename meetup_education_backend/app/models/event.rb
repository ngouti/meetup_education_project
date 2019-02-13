class Event < ApplicationRecord
    has_many :user_events
    has_many :users, through: :user_events
    has_many :user_arrangements
    has_many :users, through: :user_arrangements
end
