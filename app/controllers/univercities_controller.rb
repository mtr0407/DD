class UnivercitiesController < ApplicationController
  def index
    @univercities = Univercity.all
  end

  def show
    @univercity = Univercity.find_by(id: params[:id])
    @teams = Team.where(univercity_id: @univercity.id)
  end
end