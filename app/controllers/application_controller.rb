# frozen_string_literal: true
class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  def access_denied(_param)
    render plain: 'Access denied'
  end
end
