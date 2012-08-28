class TodosController < ApplicationController
  respond_to :json

  def index
    respond_with Todo.all
  end

  def show
    respond_with Todo.find(params[:id])
  end

  def create
    params[:todo][:creater_id] = current_user.id
    params[:todo][:updater_id] = current_user.id
    respond_with Todo.create(params[:todo])
  end

  def update
    @todo = Todo.find(params[:id])
    params[:todo][:updater_id] = current_user.id
    respond_with @todo.update_attributes(params[:todo])
  end
  
  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end
end
