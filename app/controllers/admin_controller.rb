class AdminController < ApplicationController
    
    def create
        if :password == 1234
            redirect_to create_path
        end
    end

end
