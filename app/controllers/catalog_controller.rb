class CatalogController < ApplicationController
  before_filter :filters, only: :category
  skip_before_filter :set_locale, only: [:get_cities, :get_filter_words]

  def category
    category_url = params[:category_name]
    @category = Category.find_by_slug(category_url)
  end

  def tour
    category = Category.find_by_slug(params[:category_name])
    @event = Tour.where(slug: params[:tour_name], category_id: category.id).first
    @cities = City.where('id in (?)', CityJoin.joins(:tour).joins(:city).where(tours: { category_id: category.id }).pluck(:city_id).uniq).where.not(id: @event.cities[0])
    @events = Tour.where(category_id: category.id ).where.not(id: @event.id ).limit(3)
  end

  def category_with_city
    @category = Category.find_by_slug(params[:category_name])
    @categories = Category.order(created_at: :asc)
    @city = City.find_by_slug(params[:city_name])
    @cities = City.where('id in (?)', CityJoin.joins(:tour).joins(:city).where(tours: { category_id: @category.id }).pluck(:city_id).uniq)
    params_flags = (params[:flags] || '').split('&')
  end

#   ajax requests
  def get_cities
    category_slug = params[:category]
    category = Category.find_by_slug(category_slug)
    cities = City.where('id in (?)', CityJoin.joins(:tour).joins(:city).where(tours: { category_id: category.id }).pluck(:city_id).uniq)
    city_name = []
    cities.each do |c|
      city_name.push( {name: c.name, slug: c.slug} )
    end
    render(inline: city_name.to_json)
  end


  def get_filter_words
    category_slug = params[:category]
    category = Category.find_by_slug(category_slug)
    words = FilterWord.where('id in (?)', FilterJoin.joins(:tour).joins(:filter_word).where(tours: { category_id: category.id }).pluck(:filter_word_id).uniq)
    words_name = []
    words.each do |c|
      words_name.push(c.name)
    end
    s = words_name.join(',')
    render(inline: s)
  end

end
