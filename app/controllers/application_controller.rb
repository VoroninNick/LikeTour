class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  skip_before_filter  :verify_authenticity_token
  
  before_filter :set_locale

  private
  def set_locale

    if params[:controller].index('devise').nil? && params[:controller].index('rails_admin').nil?
      locale = params[:locale]
      if !locale
        locale = http_accept_language.compatible_language_from(I18n.available_locales)
      end

      if !locale
        locale = I18n.default_locale
      end

      if params[:locale] != locale
        redirect_to locale: locale
      else
        I18n.locale = locale
      end
    end
  end

  def filters
    filter_form = params[:filter_form] == 'true'
    if filter_form
      params_type = params[:type]
      params_city = params[:city]
      params_flags = (params[:check] || '').split('&')
      params_flags_string = params_flags.join('&')

      redirect_to category_with_city_path(category_name: params_type, city_name: params_city, flags: params_flags_string)
      return
    end
  end
end
