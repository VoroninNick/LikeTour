class StaticPageController < ApplicationController
  def about
    @content = About.where(published: true).first
  end
  def custom_tour

  end
  def publication
    @future_publications = Publication.where(banner: true).order(position: :asc).limit(5)
  end
  def contacts

  end
  def one_publication
    @publication = Publication.where(slug: params[:url]).first
    @publications = Publication.where.not(id: @publication.id ).limit(4)
  end
  def test_page
    @categories = Category.where(published: true).order(index_sort: :asc)
  end
end
