module Api
  class UsersController < ApplicationController
    before_action :doorkeeper_authorize!
    before_action :authorize_admin, except: [:me]
    before_action :set_user, only: [:show, :update, :destroy]

    def me
      json_response current_resource_owner
    end

    def index
      json_response User.all
    end

    def show
      json_response @user
    end

    def create
      user = User.new(user_params)
      if user.save
        json_response user
      else
        json_response({ errors: user.errors }, :bad_request)
      end
    end

    def update
      if @user.update(user_params)
        json_response @user
      else
        json_response({ errors: user.errors }, :bad_request)
      end
    end

    def destroy
      json_response @user.destroy
    end

    private

    def set_user
      @user = User.find(params[:id])
    end
  end
end
