class ProjectsController < ApplicationController
    before_action :authenticate_user!

    def new
        @project = Project.new
        render :show_form
    end

    def create
        @project = Project.new(project_params)
        assign_project if params[:user_id].present?
        authorize! :create, @project
        save_project
    end

    def edit
        @project = Project.find(params[:id])
        authorize! :edit, @project
        render :show_form
    end

    def update
        @project = Project.find(params[:id])
        @project.assign_attributes(project_params)
        assign_project if params[:user_id].present?
        authorize! :update, @project
        save_project
    end

    def destroy
        @project = Project.find(params[:id])
        authorize! :destroy, @project
        @project.destroy
        @projects = Project.accessible_by(current_ability)

        redirect_to root_path
    end

    def assign_project
        @project.users << User.find_by_id(params[:user_id])
    end

    private

    def project_params
        params.require(:project).permit!
    end

    def save_project
        if @project.save
          @projects = Project.accessible_by(current_ability)
          render :hide_form
        else
          render :show_form
        end
    end
end
