module Api
  class UsersController < ApplicationController
    before_action :doorkeeper_authorize!

    def me
      json_response current_resource_owner
    end
  end
end
