class CatalogController < ApplicationController
  def category
    # category_collection = nil
    category_url = params[:category_name]
    @category = Category.find_by_slug(category_url)
    # category_arr = category_str.split('/')
    # query_params = {}
    # category_arr.count.times do |index|
    #   # query_params[]
    # end

  end
  def tour
    category = Category.find_by_slug(params[:category_name])
    @event = Tour.where(slug: params[:tour_name], category_id: category.id).first

    # @cities = City.where("id in (?)", CityJoin.select(:city_id).where(tour_id: @event.id).to_a.uniq)
    # @cities = City.where("id in (?)", CityJoin.where(tour_id: @event.id).pluck(:city_id).uniq)

    # @cities = City.where("id in (?)", CityJoin.joins(:tours).joins(:cities).where("tour_id = ? and tours.category_id = ? and cities.name = ?", id, category_id, city_name).pluck(:city_id).uniq)
    # @cities = City.where('id in (?)', CityJoin.joins(:tours).joins(:cities).where('tours.category_id = ? and cities.name != ? ', category.id, @event.cities[0].name).pluck(:city_id).uniq)

    @cities = City.where('id in (?)', CityJoin.joins(:tour).joins(:city).where(tours: { category_id: category.id }).pluck(:city_id).uniq)

    # @cities = CityJoin.joins(:tour).joins(:city).where(tours: { category_id: category.id }).pluck(:city_id).uniq

    # @cities = CityJoin.joins(:tour).joins(:city).where(tours: { category_id: category.id }).where(“cities.name not like ‘%Львів%’”).pluck(:city_id).uniq

    @events = Tour.where(category_id: category.id ).where.not(id: @event.id ).limit(3)
  end
  def category_with_city

  end
end
