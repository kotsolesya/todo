class ListsController < ApplicationController

  before_action :authorize

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = current_user.lists.build(list_params)
    render(:new) unless @list.save
  end

  def update
    @list = current_user.lists.find(params[:id])
    @list.update(list_params)
  end

  def edit
    @list = current_user.lists.find(params[:id])
  end

  def destroy
    @list = current_user.lists.find(params[:id])
    @list.destroy
  end

  private

  def list_params
    params.fetch(:list).permit(:title, :id_user)
  end

  def lists
    @lists ||= current_user.lists.all
  end

  helper_method :lists

end
