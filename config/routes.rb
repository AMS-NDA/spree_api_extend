Spree::Core::Engine.routes.append do
  namespace :api, :defaults => { :format => 'json' } do


    get "carts" => "carts#index"

  end
end