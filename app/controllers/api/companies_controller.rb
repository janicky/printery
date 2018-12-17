class Api::CompaniesController < ApplicationController
  # before_action :doorkeeper_authorize!
  before_action :set_company, only: [:show, :update, :destroy]

  def index
    json_response Company.all
  end

  def show
    json_response @company
  end

  def create
    company = Company.new(company_params)
    if company.save
      json_response company
    else
      json_response({ errors: company.errors }, :bad_request)
    end
  end

  def update
    if @company.update(company_params)
      json_response @company
    else
      json_response({ errors: company.errors }, :bad_request)
    end
  end

  def destroy
    json_response @company.destroy
  end

  private

  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.permit(:name, :tax_number, :address)
  end
end
