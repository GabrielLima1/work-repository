class ListsController < ApplicationController
  before_action :set_list, only: [:edit, :update, :show, :destroy]
  before_action :authenticate_user!
  def new
		@list = List.new
    @list.works.build
	end

	def create
		@list = List.create(list_params)
		respond_with @list
	end

	def update
		@list.update(list_params)
    	respond_with @list
	end

	def show
		respond_with @list
	end

  def index
    @lists = List.where(user_id: current_user.id).paginate(:page => params[:page], :per_page => 5)
                                                 .order(created_at: :asc)
    # .and(List.where(list_visibility: "Public"))
    #                      .paginate(:page => params[:page], :per_page => 5)
    #                      .order(created_at: :asc)
  end

	def destroy
		@list.destroy
		redirect_to lists_path, alert: "Lista Deletada"
	rescue
		redirect_to lists_path, alert: "Não foi possivel deletar"
	end


	private
	def set_list
		@list = List.find(params[:id])
	end

	def list_params
		params.require(:list).permit(:name, :visibility, :user_id, works_attributes: [:id, :name])
	end
end
