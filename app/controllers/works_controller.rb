class WorksController < ApplicationController
  before_action :set_work, only: [:edit, :update, :show, :destroy]
  before_action :authenticate_user!
  def new
		@work = Work.new
	end

	def create
		@work = Work.create(work_params)
		respond_with @work
	end

	def update
		@work.update(work_params)
    	respond_with @work
	end

	def show
		respond_with @work
	end

  def index
    lists = List.where(user_id: current_user.id).pluck(:id) # Pegando os id's das listas do usuario logado!
    @works = Work.where(list_id: lists) # Pensar um pouco mais aqui!
                       .paginate(:page => params[:page], :per_page => 5)
                       .order(created_at: :asc)
  end

	def destroy
		@work.destroy
		redirect_to works_path, alert: "Tarefa Deletada"
	rescue
		redirect_to works_path, alert: "Não foi possivel deletar"
	end


	private
	def set_work
		@work = Work.find(params[:id])
	end

	def work_params
		params.require(:work).permit(:name, :status, :list_id)
	end
end
