class ListsController < ApplicationController
  before_action :set_list, only: [:edit, :update, :show, :destroy]
  before_action :authenticate_user!

  def new
		@list = List.new
    3.times do
      work = @list.works.build
      4.times {work.sub_works.build}
    end
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
    lista_publica = List.where(visibility: "Pública")
    lista_do_usuario_logado = List.where(user_id: 1)
    @lists = (lista_publica + lista_do_usuario_logado).uniq

    # @lists = List.where(visibility: "Pública")
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
		params.require(:list).permit(:name, :visibility, :user_id,
                          works_attributes: [:id, :name, :status, :_destroy, sub_works_attributes: [:id, :name, :status, :_destroy]])
	end
end
