class LikesController < ApplicationController
  before_action :set_picture
  
  def create
    @like = Like.create(user_id: current_user.id, picture_id: params[:picture_id])
    set_picture
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, picture_id: params[:picture_id])
    like.destroy
    set_picture
  end

  private
    # ストロングパラメーター
    def pictures_params
      params.require(:picture).permit(:picture_id, :user_id)
    end

  def set_picture
    @picture = Picture.find(params[:picture_id])
  end
end