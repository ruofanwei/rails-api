class Api::V1::UsersController < ApplicationController
    # GET /users
    def def index
        @users = User.all
        render json: @users
    end

    # GET /users/:id
    def show
        @user = User.find(params[:id])
        render json: @user
    end

    #POST /users
    def create
        @user = User.new(user_params)
        if @user.save
            render json: @user
       else
            render json:{error: 'Unable to create User'}, status: 400
       end
    end

    # PUT /users/:id
    def update
        @user = User.find(params[:id])
        if @user
            @user.update(user_params)
            render json: {message: 'user successfully updated'}, status: 200
        else
            render json:{error: 'Unable to update User'}, status: 400
        end
    end

    # DELETE /users/:id
    def destory
        @user = User.find(params[:id])
        if @user
            @user.destory
            render json: {message: 'user successfully deleted'}, status: 200
        else
            render json:{error: 'Unable to delete User'}, status: 400
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :email)
    end

    end


end
