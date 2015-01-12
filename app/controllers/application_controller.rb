class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_categories

  helper_method :can_edit

  private
    def can_edit
      if current_user
        current_user.is_admin
      else
        false
      end
    end
    def set_categories
      @categories = Category.all
    end
end
