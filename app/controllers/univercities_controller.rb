class UnivercitiesController < ApplicationController
  
  def index
    @univercities = Univercity.all
  end

  def show
    @univercity = Univercity.find_by(id: params[:id])
    @teams = Team.where(univercity_id: @univercity.id)
    
  end
  
  def create
    @univercity = Univercity.new(name: params[:name],
                             circle_name: params[:circle_name],
                             )
    if @univercity.save
      flash[:notice] = "投稿に成功しました"
      redirect_to("/univercities")
    end
  end
  
  def edit
    @univercity = Univercity.find_by(id: params[:id])
  end
  
  def update
    @univercity = Univercity.find_by(id: params[:id])
    @univercity.name = params[:name]
    @univercity.circle_name = params[:circle_name]
    if params[:image]
      @univercity.image_name = "#{@univercity.id}.jpg"
      image = params[:image]
      File.binwrite("public/univercity_images/#{@univercity.image_name}", image.read)
    end
    
    if @univercity.save
      # session[:@univercity_id] = @univercity.id
      flash[:notice] = "ユーザー情報を編集しました"
      redirect_to("/univercity/index")
    else
      render("/univercity/edit")
    end
  end
  
  def destroy
    @univercity = Univercity.find_by(id: params[:id])
    @univercity.destroy
    redirect_to("/univercities")
  end
  
end
