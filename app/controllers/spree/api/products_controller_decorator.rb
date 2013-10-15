
Spree::Api::ProductsController.class_eval do
  def index
    if params[:ids]
      @products = product_scope.where(:id => params[:ids])
    elsif params[:show_in_taxon] && params[:q].present? && params[:q][:taxon_id].present?
      @products = product_scope.in_taxon(Spree::Taxon.find(params[:q][:taxon_id])).ransack(params[:q]).result
    else
      @products = product_scope.ransack(params[:q]).result.distinct
    end

    @products = @products.page(params[:page]).per(params[:per_page])
  end
end