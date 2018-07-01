class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def show
    @team = Team.find_by(id: params[:id])
    @demos = Demo.where(team_id: @team.id)
  end
end