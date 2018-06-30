class UserController < ApplicationController
  def new
  # URLは"/user/signup"
    @user = User.new
  end
  
  def login
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
      image_name: "IMG_8143.PNG"
    )
    if @user.save
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to("/user/index")
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

