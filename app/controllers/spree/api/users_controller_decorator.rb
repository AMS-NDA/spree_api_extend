# Override create to allow anyone to create
# This No Bueno ?
Spree::Api::UsersController.class_eval do
  def create
    authorize! :create, Spree.user_class
    @user = Spree.user_class.new(user_params)
    if @user.save
      @user.generate_spree_api_key!
      respond_with(@user, :status => 201, :default_template => :show)
    else
      invalid_resource!(@user)
    end
  end
end