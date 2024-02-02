class TaskController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
        @task=Task.all
        render "#index"
    end
    def createtask
        task = Task.new # Create new object for User model class
        task.name = params[:name]
        task.description = params[:description]
        task.status = false

        if task.save 
            @reponse={
                :message =>"save success",
                :task =>task
            }
            render plain: Task.all.map{|todo| todo.viewtodos}.join("\n")
            
        else
            render json: { errors: "unable to save" }, status: 400
        end
    end
    def viewalltasks
        task=Task.all
        @responce = {
            :status =>"200",
            
            :task =>task
        }
        render plain: Task.all.map{|todo| todo.viewtodos}.join("\n")
        # render json: @responce"
    end
     
    def specifictask
        task=Task.find(params[:id])
        render plain:task.viewtask
    end

    def notcompleted
        task=Task.where(status: false)
        render plain: task.map{|todo| todo.viewtask}.join("\n")
    end

    def completed
        task=Task.where(status: false)
        render plain: task.map{|todo| todo.viewtask}.join("\n")
    end
    def edittask
        task=Task.find(params[:id])
        task.name=params[:name]
        task.description=params[:description]
        task.status=params[:status]
        if task.save 
            render plain:task.viewtask
        else
            @responce={
                :status=>"400"
            }
        end

    end

    def deletetask
        task=Task.find(params[:id])
        task.destroy
        render plain: Task.all.map{|todo| todo.viewtodos}.join("\n")
    end
end
