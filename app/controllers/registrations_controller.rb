class RegistrationsController < Devise::RegistrationsController
  
  def new
    # Override Devise default behaviour and create a profile as well
    build_resource({})
    resource.build_profile
    respond_with self.resource
  end
  def sign_up_params
    params.require(:user).permit( :name, :useridentifier, :email, :gender,:birthday, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit( :name, :useridentifier, :email, :gender,:birthday, :password, :password_confirmation, :current_password)
  end
  
  protected
  def configure_permitted_parameters
    parameter_santizer.for(:sign_up){ |u| u.permit(:name, :useridentifier, :email, :gender,:birthday)}
    devise_parameter_santizer.for(:sign_in){ |u| u.permit(:name, :useridentifier, :email, :gender,:birthday)}
    devise_parameter_santizer.for(:account_update){ |u| u.permit(:name, :useridentifier, :email, :gender,:birthday)}
  end

end
