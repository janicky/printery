module Api
  class OrdersController < ApplicationController
    before_action :doorkeeper_authorize!
    before_action :authorize_admin, only: [:destroy]
    before_action :set_order, only: [:show, :update, :destroy]

    def index
      json_response Order.all.as_json(include: { company: {} }, methods: [:status])
    end

    def show
      json_response @order
    end

    def create
      order = Order.new(order_params)
      if order.save
        json_response order
      else
        json_response({ errors: order.errors }, :bad_request)
      end
    end

    def update
      if @order.update(order_params)
        json_response @order
      else
        json_response({ errors: order.errors }, :bad_request)
      end
    end

    def destroy
      json_response @order.destroy
    end

    private

    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.permit(:company, :price, :count, :deadline, :description, :paper_size, :paper, :color_palette)
    end
  end
end
