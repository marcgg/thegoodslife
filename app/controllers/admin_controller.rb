class AdminController < ApplicationController
  def index

  end

  def change
    step = Step.find(params[:id])
    Step.column_names.each do |attr|
      step.update_attribute(attr, params[attr])
    end
    redirect_to admin_path(id: step.id)
  end

  def show

  end
end
