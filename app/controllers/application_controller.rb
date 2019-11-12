# frozen_string_literal: true

# This class allows the sign in path
class ApplicationController < ActionController::Base
  def after_sign_in_path_for(_resource)
    '/pages'
  end
end
