class PagesController < ApplicationController
  def index
    if logged_in?
      # ユーザーがログインしている場合の処理
      redirect_to user_path(@current_user)


    else
      # ユーザーがログインしていない場合は、/loginパスにリダイレクト
      redirect_to login_url
    end
  end
end
