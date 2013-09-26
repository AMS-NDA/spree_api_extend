module Spree
  module Api
    class CartsController < Spree::Api::BaseController
      def index
        if current_api_user
          @order = Spree::Order.where(user_id: current_api_user.id, :state => 'cart').first
          render :template => 'spree/api/orders/show'
        else
          unauthorized
        end
      end
    end
  end
end