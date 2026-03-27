class ApplicationController < ActionController::API
  include ActionController::MimeResponds

  # Deviseのコントローラーが動く前に、パラメータ許可の処理を実行する
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # サインアップ時（sign_up）に username を許可する
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    
    # プロフィール更新時（account_update）にも必要なら追加
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])

  end
end