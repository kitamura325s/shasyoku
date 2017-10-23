class Users::RegistrationsController < Devise::RegistrationsController
  def build_resource(hash=nil)
    hash[:uid] = User.create_unique_string
    super
  end
  
  def edit
    @cafeterias = Cafeteria.where(user_id: current_user.id)
    @pictures = Picture.where(user_id: current_user.id)
    super
  end
end