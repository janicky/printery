class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :update_activity

  respond_to :json

  def doorkeeper_unauthorized_render_options(*)
    { json: { error: "Not authorized" } }
  end

  protected

  def configure_permitted_parameters
    added_attrs = [:email, :first_name, :last_name]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  def authorize_admin
    if !current_resource_owner || !current_resource_owner[:admin]
      json_response({ error: "Not authorized (require admin privileges)" }, :unauthorized)
    end
  end

  private

  def current_resource_owner
    User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end

  def update_activity
    current_resource_owner&.update_attribute("last_activity", Time.current)
  end
end
