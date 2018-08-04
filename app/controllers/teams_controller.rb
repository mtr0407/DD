class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def show
    @team = Team.find_by(id: params[:id])
    @univercity = Univercity.find_by(id: @team.univercity_id)
    @demos = Demo.where(team_id: @team.id)

  end
  
  def create
    @univercity = Univercity.find_by(id: params[:univercity_id])
    # @team = Team.new(name: params[:name], univercity_id: params[:id])
    @team = @univercity.teams.build(name: params[:name],
                                    univercity_id: @univercity.id)
    if @team.save
      flash[:notice] = "投稿に成功しました"
      redirect_to("/univercities/index")
    else
      flash[:notice] = "投稿に失敗しました"
    end
  end
end