class StepsController < ApplicationController
  def new
  end

  def show
  end

  def index
    @deals = Steps::Deal.all
  end

  def create
  end
end
