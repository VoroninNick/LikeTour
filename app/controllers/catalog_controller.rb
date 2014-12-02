class CatalogController < ApplicationController
  def category
    category_collection = nil
    category_str = params[:url]
    category_arr = category_str.split('/')
    query_params = {}
    category_arr.count.times do |index|
      # query_params[]
    end
  end
  def one_tour
    category = Category.find_by_slug(params[:url])
    @event = Tour.where(slug: params[:event], category_id: category.id).first
    @events = Tour.where(category_id: category.id ).where.not(id: @event.id ).limit(3)
  end
end
