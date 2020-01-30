class TodosController < ApplicationController
    before_action :authenticate_user!

    def index
        @project = Project.find_by_id(params["id"])
        @todos = @project.todos

        render :'todos/todo_list'
    end

    def new
        @todo = Todo.new
        @project_id = params[:id]
        render :show_form
    end

    def create
        @todo = Todo.new(todo_params.merge(status: params[:status]))
        assign_todo_to_user unless params[:user_id].blank?
        save_todo
    end

    def edit
        @todo = Todo.find(params[:id])
        render :'todos/show_form'
    end

    def show
        @project = Project.find_by_id(params["id"])
        @todos = @project.try(:todos)
        render :'todos/show'
    end

    def update
        @todo = Todo.find(params[:id])
        @todo.assign_attributes(todo_params.merge(status: params[:status]))
        assign_todo_to_user unless params[:user_id].blank?
        save_todo
    end

    def destroy
        @todo = Todo.find(params[:id])
        authorize! :destroy, @todo
        @todo.destroy
        @todos = Todo.accessible_by(current_ability)
    end

    private

    def assign_todo_to_user
        user = User.find_by_id(params[:user_id])
        user.todos << @todo
        user.projects << @todo.project unless user.projects.include?(@todo.project)
        user.save!
    end

    def todo_params
        params.require(:todo).permit(:title, :note, :status, :project_id).reject { |_, v| v.blank? }
    end

    def save_todo
        if @todo.save
          @todos = Todo.accessible_by(current_ability)
          render :hide_form
        else
          render :show_form and return
        end
    end
end
