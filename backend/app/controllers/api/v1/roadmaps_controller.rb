class Api::V1::RoadmapsController < ApplicationController
  def index
    # すべてのロードマップを、関連するタスクと一緒に取得（includesで高速化）
    @roadmaps = Roadmap.includes(:tasks).all
    
    # JSONにタスク情報を含めて返す
    render json: @roadmaps, include: :tasks
  end
end