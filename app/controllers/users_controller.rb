class UsersController < ApplicationController
    
    before_action :find_user, only: [:showUser, :updateUser, :deleteUser]

    def allUsers
        render json: User.all
    end
    

    def newUser
        @user = User.new(user_params)

        if @user.save
            render json: User.all
        else
            render json: { errors: @user.errors.full_messages }
        end
    end


    def showUser
        render json: @user
    end


    def updateUser
        @user.update(user_params)

        if @user.save
            render json: @user
        else
            render json: { errors: @user.errors.full_messages }
        end
    end


    def deleteUser
        if @user.delete
            render json: User.all
        else
            render json: { errors: @user.errors.full_messages }
        end
    end

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :username, :password)
    end

    def find_user
        @user = User.find(params[:id])
    end

end