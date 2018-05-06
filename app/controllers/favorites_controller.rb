class FavoritesController < ApplicationController
  before_action :set_favorite, only: [:edit, :update, :show, :destroy]
  before_action :authenticate_user!

  def new
		@favorite = Favorite.new
    3.times {@favorite.works.build}
	end

	def create
		@favorite = Favorite.create(favorite_params)
		redirect_to favorites_path
	end

  def index
    @favorites = Favorite.where(user_id: current_user.id)
  end


  private

	def destroy
		@favorite.destroy
		redirect_to favorites_path, alert: "Favoritea Deletada"
	rescue
		redirect_to favorites_path, alert: "Não foi possivel deletar"
	end

	private
	def set_favorite
		@favorite = Favorite.find(params[:id])
	end
end
