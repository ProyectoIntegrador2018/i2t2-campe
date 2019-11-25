# frozen_string_literal: true

class Admins::RegistrationsController < Devise::RegistrationsController
  # disable default no_authentication action
  skip_before_action :require_no_authentication, only: [:new, :create, :cancel]
  
  def create
    super #Nothing special here.
  end

  protected

  def sign_up(resource_name, resource)
    true
  end
end
