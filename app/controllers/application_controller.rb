# frozen_string_literal: true

# This class allows the sign in path
class ApplicationController < ActionController::Base
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def after_sign_in_path_for(_resource)
    '/pages'
  end

  def user_not_authorized
    redirect_to root_path
  end
end
