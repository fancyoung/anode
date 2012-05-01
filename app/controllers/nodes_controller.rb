# -*- coding: utf-8 -*-
require 'open-uri'

class NodesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]

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
    @node = Node.build_node params[:node]

    respond_to do |format|
      if @node.save
        # flash[:success] = '发布成功:)'
        format.html { render partial: 'nodes/node', object: @node }
        format.json { render json: @node, status: :created, location: @node }
      else
        # flash[:error] = @node.errors.values.first.first
        format.html { render partial: 'nodes/node', object: @node } #bug: fix it later
        format.json { render json: @node.errors.first.first, status: 'error' }
      end
    end
  end

  def show
    @node = Node.find(params[:id])
    respond_to do |format|
      format.html { render 'show', layout: false }
      format.json { render json: @node }
    end
  end
end
