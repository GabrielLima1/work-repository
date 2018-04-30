class HomeController < ApplicationController
  def index
    if current.user
      @user = current.user.name

    end

  end
end
