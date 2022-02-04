module Api
  module V1
      class UsersController < ApplicationController

            def index
              render json: User.all
            end

            def create
              user = User.new(user_params)
              if user.save
                render json: UserRepresenter.new(user).as_json, status: :created
              else
                render json: user.errors, status: :unprocessable_entity
              end
            end

            def destroy
              User.find(params[:id]).destroy!

              head :no_content

            end

            private

            def user_params
              params.require(:user).permit(:username, :email)
            end
      end
    end
  end
