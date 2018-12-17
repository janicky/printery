class Api::CompaniesController < ApplicationController
  # before_action :doorkeeper_authorize!
  before_action :set_company, only: [:show]

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

  private

  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.permit(:name, :tax_number, :address)
  end
end
