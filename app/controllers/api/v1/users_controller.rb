class Api::V1::UsersController < ApplicationController

def getUser

    alluser =User.last
    render json:{
        data:alluser
    }
end

end

