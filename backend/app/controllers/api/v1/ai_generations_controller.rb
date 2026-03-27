class Api::V1::AiGenerationsController < ApplicationController
  before_action :authenticate_user!

  def create
    # ❌ 間違い：Roadmap.new(roadmap_params) 
    # これだと「誰のロードマップか」が空っぽになります。

    # ⭕️ 正解：current_user（ログイン中の人）に紐付けて作成する
    @roadmap = current_user.roadmaps.build(roadmap_params)

    # あるいは、手動でIDを入れる方法もあります
    # @roadmap = Roadmap.new(roadmap_params)
    # @roadmap.user_id = current_user.id

    if @roadmap.valid?
      # ここでAI生成の処理などを行う
      render json: { message: "成功！#{current_user.username}さんのロードマップを作成します。", data: @roadmap }, status: :ok
    else
      # ここで「User must exist」などのエラーが返っているはずです
      render json: { errors: @roadmap.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def roadmap_params
    params.require(:roadmap).permit(:title, :description, :category, :target_level)
  end
end