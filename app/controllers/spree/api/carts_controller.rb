module Spree
  module Api
    class CartsController < Spree::Api::BaseController
      def index
        if current_api_user
          @order = Spree::Order.where(user_id: current_api_user.id, :state => 'cart').first
          unless @order
            @order = Order.build_from_api(current_api_user, {})
          end

          render :template => 'spree/api/orders/show'
        else
          unauthorized
        end
      end
    end
  end
end