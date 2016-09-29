class UsersController < ApplicationController
    
    def new
    end
    
    def user_params
        params.require(:user).permit(:user_id, :email, :session_token)
    end
    
    def create
        #@user = params[:user_id]
       if (User.exists?(:user_id => user_params[:user_id]))
           flash[:notice] = "user already created"
           redirect_to users_path
       else
        @user = User.create_user!(user_params)
        flash[:notice] = "Welcome #{user_params[:user_id]}!"

        redirect_to login_path
       end
 
    end

end
