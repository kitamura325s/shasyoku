class Picture < ActiveRecord::Base
    belongs_to :user
    belongs_to :cafeteria
    mount_uploader :image, AvatarUploader
end
