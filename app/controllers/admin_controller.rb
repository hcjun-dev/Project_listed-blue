class AdminController < ApplicationController
    
    def create
        if :password == 1234
            redirect_to controlpanel_path
        end
    end

end
