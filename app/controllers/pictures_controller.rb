class PicturesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_picture, only: [:edit, :update, :destroy]
  
  def index
    #@pictures = Picture.all
    @q        = Picture.ransack(params[:q])
    @pictures = @q.result(distinct: true).includes(:cafeteria, :user)
  end

  def new
    if params[:back]
      @picture = Picture.new(pictures_params)
    else
      @picture = Picture.new
      @picture.cafeteria_id = params[:cafeteria_id]
    end
  end

  def create
    @picture = Picture.new(pictures_params)
    @picture.user_id = current_user.id
    
    if @picture.save
      redirect_to pictures_path, notice: "投稿しました！"
      #NoticeMailer.sendmail_picture(@picture).deliver
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @picture.update(pictures_params)
      redirect_to pictures_path, notice: "投稿を編集しました！"
    else
      render 'edit'
    end
  end
  
  def destroy
    @picture.destroy
    redirect_to pictures_path, notice: "投稿を削除しました！"
  end
  
  private
    def pictures_params
      params.require(:picture).permit(:title, :menu, :content, :price, :cafeteria_id, :image, :image_cache, :remove_image)
    end
    
    def set_picture
      @picture = Picture.find(params[:id])
    end    
end