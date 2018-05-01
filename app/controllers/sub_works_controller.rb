class SubSubWorksController < ApplicationController
  before_action :set_sub_work, only: [:edit, :update, :show, :destroy]
  before_action :authenticate_user!
  def new
		@sub_work = SubWork.new
	end

	def create
		@sub_work = SubWork.create(sub_work_params)
		respond_with @sub_work
	end

	def update
		@sub_work.update(sub_work_params)
    	respond_with @sub_work
	end

	def show
		respond_with @sub_work
	end

  def index
    lists = List.where(user_id: current_user.id).pluck(:id) # Pegando os id's das listas do usuario logado!
    works = Work.where(list_id: lists).pluck(:id)
    @sub_works = SubWork.where(work_id: works).paginate(:page => params[:page], :per_page => 5)
                                              .order(created_at: :asc)
  end

	def destroy
		@sub_work.destroy
		redirect_to sub_works_path, alert: "Tarefa Deletada"
	rescue
		redirect_to sub_works_path, alert: "Não foi possivel deletar"
	end


	private
	def set_sub_work
		@sub_work = SubWork.find(params[:id])
	end

	def sub_work_params
		params.require(:sub_work).permit(:name, :status, :work_id)
	end
end
