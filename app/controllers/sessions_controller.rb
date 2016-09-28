class SessionsController < ApplicationController
    
   def new
   end
   
   def user_params
        params.require(:user).permit(:user_id, :email, :session_token)
   end
    
   def create
       
       if (User.exists?(:user_id => user_params[:user_id]) && User.exists?(:email => user_params[:email]))
            @user = User.find_by(user_params)
            @email = User.find_by(user_params) 
           session[:session_token] = @user.session_token
           
           redirect_to root_url
       else
        User.create_user!(user_params)
        flash[:notice] = "Incorrect User/Email Combination"
        redirect_to login_path
       end
       
   end
   
   def destroy
       session[:session_token] = nil
       redirect_to root_url
   end
end