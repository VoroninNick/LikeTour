class StaticPageController < ApplicationController
  def about

  end
  def custom_tour

  end
  def publication

  end
  def contacts

  end
  def one_publication
    @publication = Publication.where(slug: params[:url]).first
    @publications = Publication.where.not(id: @publication.id ).limit(4)
  end
end
