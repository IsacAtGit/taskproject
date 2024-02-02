class TaskController < ApplicationController
   
    def index
        @task=Task.all
        # @responce = {
        #     :status =>"200",
            
        #     :task =>task
        # }

        render "index"
    end
    def createtask
        @task = Task.new # Create new object for User model class
        @task.name = params[:todo_name]
        
        @task.status = false

        if @task.save 
            @reponse={
                :message =>"save success",
                :task =>@task
            }
            redirect_to root_path
            
        else
            render json: { errors: "unable to save" }, status: 400
        end
    end

    def handle_selection
        selected_option = params[:selected_value]
        print "#{selected_option}"
        puts "------------------------------------"
        if selected_option=="completed"
            @task=Task.where(status: true)
            render "index"
        elsif selected_option="uncompleted"
            @task=Task.where(status: false)
            render "index"
        else
            @task=Task.all
            render "index"
        end
    end

    def editstatus
        task=Task.find(params[:id])
        
        
        task.status=params[:status]
        if task.save 
            redirect_to root_path
        else
            @responce={
                :status=>"400"
            }
        end

    end

    def deletetask
        task=Task.find(params[:id])
        task.destroy
        redirect_to root_path
    end
end
