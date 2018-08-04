class DemosController < ApplicationController
  def index
    @demos = Demo.all
  end
  
  def new
    @demo = Demo.new
  end
  
  def create
    params[:url] = params[:url].gsub(/https:\/\/youtu.be/, "https:\/\/www.youtube.com/embed")
    @univercity = Univercity.find_by(id: params[:univercity_id])
    @team = Team.find_by(id: params[:team_id])
    @demo = @team.demos.build(name: params[:name], 
                     content_with_frame: params[:url], 
                     comment: params[:comment],
                     univercity_id: @univercity.id,
                     team_id: @team.id)
    if @demo.save
      flash[:notice] = "投稿を作成しました"
      redirect_to("/teams/#{@team.id}")
    else
      flash[:notice] = "投稿に失敗しました"
      render("/demos/new")
      
    end
  end

  def show
    @demo = Demo.find_by(id: params[:id])
  end
end
