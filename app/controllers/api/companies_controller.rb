class Api::CompaniesController < ApplicationController
  # before_action :doorkeeper_authorize!
  before_action :set_company, only: [:show]

  def index
    json_response Company.all
  end

  def show
    json_response @company
  end

  private

  def set_company
    @company = Company.find(params[:id])
  end
end
