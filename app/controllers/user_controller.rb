class UserController < ApplicationController
  before_action:authenticate_user, {only: [:show,:edit,:update]}
  before_action:forbid_login_user, {only: [:new, :create, :login, :login_form]}
  before_action:ensure_current_user, {only: [:edit, :update, :delete]}
  
  def ensure_current_user
    if @current_user.id != params[:id].to_i
      flash[:notice] = "権限がありません"
      redirect_to("/posts/index")
    end
  end
  
  def new
  # URLは"/user/signup"
    @user = User.new
  end
  
  def login
    @user = User.find_by(
      email: params[:email],
      password: params[:password])
    if @user
      session[:user_id] = @user.id
      flash[:notice] = "ログインに成功しました"
      redirect_to("/univercities")
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render("/user/login_form")
    end
  end
  
  def login_form
  end
  
  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/login")
  end
  
  
  def index
    @user = User.all
  end
  
  def show
    @user = User.find_by(id: params[:id])
  end
  
  def create
    @user = User.new(
      name: params[:name], 
      email: params[:email],
      image_name: params[:image_name],
      password: params[:password]
    )
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to("/univercities")
    else
      render("/user/new")
    end
  end
  
  def edit
    @user = User.find_by(id: params[:id])
  end
  
  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    if params[:image]
      @user.image_name = "#{@user.id}.jpg"
      image = params[:image]
      File.binwrite("public/user_images/#{@user.image_name}", image.read)
    end
    
    if @user.save
      session[:@user_id] = @user.id
      flash[:notice] = "ユーザー情報を編集しました"
      redirect_to("/user/index")
    else
      render("/user/edit")
    end
  end
  
  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
    redirect_to("/user/index")
  end
  
end

