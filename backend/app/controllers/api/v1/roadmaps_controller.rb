class Api::V1::RoadmapsController < ApplicationController
  before_action :authenticate_user!
  def index
    # すべてのロードマップを、関連するタスクと一緒に取得（includesで高速化）
    @roadmaps = Roadmap.includes(:tasks).all
    
    # JSONにタスク情報を含めて返す
    render json: @roadmaps, include: :tasks
  end

  def show
    @roadmap = Roadmap.find(params[:id])

    render json: @roadmap, include: :tasks
  end

  def create
    @roadmap = Roadmap.new(roadmap_params)

    if @roadmap.save
      render json: @roadmap, include: :tasks , status: :created
    else
      render json: @roadmap.errors, status:  :unprocessable_entity
    end
  end

  def update
    @roadmap = Roadmap.find(params[:id])
    
    if @roadmap.update(roadmap_params)
      render json: @roadmap
    else
      rendar json: @roadmap.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @roadmap = Roadmap.find(params[:id])
    @roadmap.destroy

    head :no_content
  end


  private
  def roadmap_params
    params.require(:roadmap).permit(:title, :duration, :target_date, :status , :user_id , tasks_attributes: [:id, :content,:is_completed, :_destroy])
  end
end