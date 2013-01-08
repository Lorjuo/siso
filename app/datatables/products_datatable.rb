class ProductsDatatable# < ApplicationController # Inherit from ApplicationController to enable paths and urls
  delegate :params, :h, :link_to, :number_to_currency, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Product.count,
      iTotalDisplayRecords: products.total_entries,
      aaData: data
    }
  end

private

  def data
    products.map do |product|
      [
        # To be customized
        link_to(product.name, product),
        number_to_currency(product.price),
        product.category.nil? ? "" : product.category.name,
        link_to('Show', product),
        link_to('Edit', Rails.application.routes.url_helpers.edit_product_path(product)),
        link_to('Destroy', product, confirm: 'Are you sure?', method: :delete)
        #h(product.category),
        #h(product.released_on.strftime("%B %e, %Y"))
      ]
    end
  end

  def products
    @products ||= fetch_products
  end

  def fetch_products
    products = Product.joins(:category)
    products = products.order("#{sort_column} #{sort_direction}")
    products = products.page(page).per_page(per_page)
    if params[:sSearch].present?
      products = products.where("products.name like :search or price like :search or categories.name like :search", search: "%#{params[:sSearch]}%")
    end
    products
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[products.name price categories.name]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end