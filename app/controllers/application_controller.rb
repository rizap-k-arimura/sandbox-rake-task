class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  # allow_browser versions: :modern

  protect_from_forgery with: :exception
  def set_csrf_token_header
    response.set_header('X-CSRF-Token', form_authenticity_token)
  end
end
