class TodoListsController < ApplicationController
  # GET /todo_lists
  # GET /todo_lists.json
  def index
    @todo_lists = TodoList.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @todo_lists }
    end
  end

  # GET /todo_lists/1
  # GET /todo_lists/1.json
  def show
    @todo_list = TodoList.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @todo_list }
    end
  end

  # GET /todo_lists/new
  # GET /todo_lists/new.json
  def new
    @todo_list = TodoList.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @todo_list }
    end
  end

  # GET /todo_lists/1/edit
  def edit
    @todo_list = TodoList.find(params[:id])
  end

  # POST /todo_lists
  # POST /todo_lists.json
  def create
    @project = Project.find(params[:project_id])
    @todo_list = @project.todo_lists.build(params[:todo_list])
    @new_item = TodoItem.new
    respond_to do |format|
      if @todo_list.save
        @todo_lists = @project.todo_lists
        format.js
        format.html { redirect_to @todo_list, notice: 'Todo list was successfully created.' }
        format.json { render json: @todo_list, status: :created, location: @todo_list }
      else
        format.html { render action: "new" }
        format.json { render json: @todo_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /todo_lists/1
  # PUT /todo_lists/1.json
  def update

    @todo_list = TodoList.find(params[:id])

    respond_to do |format|
      if @todo_list.update_attributes(params[:todo_list])
        format.js
        format.html { redirect_to @todo_list.project, notice: 'Todo list was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @todo_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todo_lists/1
  # DELETE /todo_lists/1.json
  def destroy
    @project = Project.find(params[:project_id])
    @todo_list = TodoList.find(params[:id])
    @todo_list.destroy
    @todo_lists = @project.todo_lists
    respond_to do |format|
      format.js
      format.html { redirect_to project_todo_lists_url }
      format.json { head :no_content }
    end
  end
end
