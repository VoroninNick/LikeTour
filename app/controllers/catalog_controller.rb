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
end
