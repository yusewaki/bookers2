class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resources)
    user_path(@user.id)
  end

  protected # 呼び出された他のコントローラからも参照可能

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  # ユーザ登録(sign_up)の際に、ユーザ名(name)のデータ操作が許可される
end
