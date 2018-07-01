class DemosController < ApplicationController
  def index
    @demos = Demo.all
  end

  def show
  end
end
