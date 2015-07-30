class RegistrationsController < Devise::RegistrationsController
  before_action :check, only:[:create, :update]

  def new
    build_resource({})
    self.resource.user_restaurants.build
    set_minimum_password_length
    yield resource if block_given?
    respond_with self.resource
  end

  def check
    raise("check it")
  end





  private

  def sign_up_params
    params.require(:user).permit(:fname, :lname, :email, :password, :password_confirmation, :restaurant_ids => [])
  end

  def account_update_params
    params.require(:user).permit(:fname, :lname, :email, :password, :password_confirmation, :current_password, :role, :restaurant_ids => [])
  end
end