class HomeController < ApplicationController
  def index
    current_user ? @user = current_user.name : @user = "Visitante"
  end
end
