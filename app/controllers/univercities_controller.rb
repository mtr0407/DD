class UnivercitiesController < ApplicationController
  
  def index
    @univercities = Univercity.all
    @univercity = Univercity.new
  end

  def show
    @univercity = Univercity.find_by(id: params[:id])
    @teams = Team.where(univercity_id: @univercity.id)
    
  end
  
  def create
    @univercity = Univercity.new(name: params[:name],
                             circle_name: params[:circle_name],
                             image_name: "1.jpg",
                             )
    if @univercity.save
      flash[:notice] = "投稿に成功しました"
      redirect_to("/univercities")

    end
  end
  
end