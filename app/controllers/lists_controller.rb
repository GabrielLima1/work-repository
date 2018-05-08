class ListsController < ApplicationController
  before_action :set_list, only: [:edit, :update, :show, :destroy]
  before_action :authenticate_user!

  def new
    @list = List.new
    3.times {@list.works.build}
  end

  def create
    @list = List.create(list_params)
    redirect_to @list, notice: "Lista Criada!"
  end

  def update
    @list.update(list_params)
    respond_with @list
  end

  def show
    respond_with @list
  end

  def index
    @lists = List.where("visibility = 'Pública' or user_id = '#{current_user.id}'")
  end


  def status
    case params[:status]
    when 'enable'
      @work = Work.find(@_params[:id])
      enable
    when 'disable'
      @work = Work.find(@_params[:id])
      disable
    when 'add_fav'
      add_fav
    when 'remove_fav'
      remove_fav
    when 'remove_favo'
      remove_favo
    else
      redirect_back fallback_location: root_path
    end

  end

  def destroy
    work = Work.where(list_id: @_params[:id])
    favorite = Favorite.where(list_id: @_params[:id])
    work.each do |w|
      w.destroy
    end
    favorite.each do |f|
      f.destroy
    end
    @list.destroy
    redirect_to lists_path, notice: "Lista Excluída!"
  end
  private

  def enable
    # @list_params
    @work.status = true
    @work.save
    redirect_back fallback_location: root_path, notice: "Tarefa: #{@work.name} Concluída!"
  end

  def add_fav
    @fav = Favorite.create(list_id: @_params[:id], user_id: current_user.id)
    redirect_back fallback_location: root_path, notice: "Lista adicionada aos Favoritos!"
  end

  def remove_fav
    @fav = Favorite.find_by(list_id: @_params[:id], user_id: current_user.id)
    @fav.destroy
    redirect_back fallback_location: root_path, notice: "Lista removida dos Favoritos!"
  end

  def remove_favo
    @fav = Favorite.find(@_params[:id])
    @fav.destroy
    redirect_back fallback_location: root_path, notice: "Lista removida dos Favoritos!"
  end

  def disable
    @work.status = false
    @work.save
    redirect_back fallback_location: root_path
  end

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :visibility, :user_id,
      works_attributes: [:id, :name, :status, :_destroy, sub_works_attributes: [:id, :name, :status, :_destroy]])
    end
  end
