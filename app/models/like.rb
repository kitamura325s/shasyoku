class Like < ActiveRecord::Base
    belongs_to :picture, counter_cache: :likes_count
    belongs_to :user
end
