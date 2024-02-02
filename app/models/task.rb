class Task < ApplicationRecord
    def viewtodos
        is_completed= status ? "[👍🏻]" : "[👎]"
        "Task id #{id} || TaskName #{name}\n "
    end
    def viewtask
        is_completed= status ? "[👍🏻]" : "[👎]"
        
    end

end
