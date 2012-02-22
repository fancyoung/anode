# -*- coding: utf-8 -*-
class NodesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index]

  def index
    if current_user
      @nodes = Node.latest(current_user)
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
        format.html { redirect_to nodes_path, notice: '发布成功:)' }
        format.json { render json: @node, status: :created, location: @node }
      else
        format.html { render action: "index" }
        format.json { render json: @node.errors, status: :unprocessable_entity }
      end
    end
  end
end
