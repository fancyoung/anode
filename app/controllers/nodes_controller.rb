# -*- coding: utf-8 -*-
class NodesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index]

  def index
    if current_user
      @nodes = Node.latest(current_user)
    else
      @nodes = Node.latest_all
    end
    respond_to do |format|
      format.html
      format.json { render json: @nodes }
    end
  end

  def create
    params[:node][:creater_id] = current_user.id
    params[:node][:updater_id] = current_user.id
    @node = Node.new(params[:node])

    respond_to do |format|
      if @node.save
        flash[:success] = '发布成功:)'
        format.html { redirect_to nodes_path}
        format.json { render json: @node, status: :created, location: @node }
      else
        flash[:error] = @node.errors.values.first.first
        format.html { redirect_to nodes_path}
        format.json { render json: @node.errors.first.first, status: 'error' }
      end
    end
  end
end
