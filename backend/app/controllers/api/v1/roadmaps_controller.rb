class Api::V1::RoadmapsController < ApplicationController
  def index
    # 全てのロードマップをタスクと一緒に取得してJSON形式で返す
    @roadmaps = Roadmap.all
    render json: @roadmaps.as_json(include: :tasks)
  end
end