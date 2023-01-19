class Api::V1::UsersController < ApplicationController

def getUser

    alluser =User.last

    p "alluser",params,alluser
    render json:{
        alluser:"rachikt"
    }
end

def createUser

     p "test123",params
     message= ""
     @user = ActiveUser.find_by(email: params[:email]).try(:authenticate, params[:password])
     if @user
    #    session[:user_id] = @user.id
       message =  "Logged in successfully"
    #    redirect_to root_path, notice: "Logged in successfully"
     else
        message =  "Invalid email/password combinatio"
    #    flash.now[:alert] = "Invalid email/password combination"
    #    render :new
     end

     render json:{
        message: message
     }
end

end

