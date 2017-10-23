class CafeteriasController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cafeteria, only: [:show, :edit, :update, :destroy]
  
  def index
    #@cafeterias = Cafeteria.all
    @q        = Cafeteria.ransack(params[:q])
    @cafeterias = @q.result(distinct: true).includes(:user)
  end

  def show
  end
  
  def new
    if params[:back]
      @cafeteria = Cafeteria.new(cafeterias_params)
    else
      @cafeteria = Cafeteria.new
    end
  end

  def create
    @cafeteria = Cafeteria.new(cafeterias_params)
    @cafeteria.user_id = current_user.id
    if @cafeteria.save
      redirect_to cafeterias_path, notice: "投稿しました！"
      #NoticeMailer.sendmail_cafeteria(@cafeteria).deliver
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @cafeteria.update(cafeterias_params)
      redirect_to cafeterias_path, notice: "投稿を編集しました！"
    else
      render 'edit'
    end
  end
  
  def destroy
    @cafeteria.destroy
    redirect_to cafeterias_path, notice: "投稿を削除しました！"
  end
  
  private
    def cafeterias_params
      params.require(:cafeteria).permit(:company_name, :address, :company_profile, :public_release)
    end
    
    def set_cafeteria
      @cafeteria = Cafeteria.find(params[:id])
    end    
end
