class ApplicationController < ActionController::Base
  include Pundit

  protect_from_forgery with: :exception

  def access_denied(param)
    render plain: "Access denied"
  end
end
