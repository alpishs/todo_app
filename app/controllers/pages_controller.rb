class PagesController < ApplicationController
    def home
        if current_user.projectmanager_role?
            @projects = Project.all
        else
            @todos = current_user.todos
        end
    end
end
