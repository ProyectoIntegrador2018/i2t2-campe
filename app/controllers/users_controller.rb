# frozen_string_literal: true

# Controlador de usuarios para tomar todos los becarios de la BD.
class UsersController < ApplicationController
  def index
    @users = User.all
  end
end
