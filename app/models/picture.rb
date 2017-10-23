class Picture < ActiveRecord::Base
    belongs_to :user
    belongs_to :cafeteria
    mount_uploader :image, AvatarUploader

    # 指定したカラム以外での検索を防ぐ
    def self.ransackable_attributes(auth_object = nil)
        %w(title cafeteria.company_name cafeteria.address user.name price)
    end

    # いいね機能
    has_many :likes, dependent: :destroy
    def like_user(user_id)
     likes.find_by(user_id: user_id)
    end
end
