Rails.application.routes.draw do
  use_doorkeeper scope: "api/oauth" do
    skip_controllers :applications, :authorized_applications
  end
  scope module: :api, defaults: { format: :json }, path: "api" do
    devise_for :users, controllers: {
      registrations: "api/users/registrations",
    }, skip: [:sessions, :password, :registrations]
  end
end
