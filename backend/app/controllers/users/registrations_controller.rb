class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  # Deviseのデフォルトの sign_up メソッドがセッションを使おうとするのを防ぐ
  def sign_up(resource_name, resource)
    # セッションへのログイン処理をスキップ
    true 
  end

  def respond_with(resource, _opts = {})
    if resource.persisted?
      render json: { message: 'サインアップに成功しました。', data: resource }, status: :ok
    else
      render json: { message: 'サインアップに失敗しました。', errors: resource.errors.full_messages }, status: :unprocessable_entity
    end
  end
end