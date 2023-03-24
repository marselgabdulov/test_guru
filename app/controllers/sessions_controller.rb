class SessionsController < Devise::SessionsController
  def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message(:notice, :signed_in, username: current_user.full_name) if is_navigational_format?
    sign_in(resource_name, resource)
    if session[:return_to].blank?
      respond_with resource, location: after_sign_in_path_for(resource)
    else
      redirect_to session[:return_to]
      session[:return_to] = nil
    end
  end
end
