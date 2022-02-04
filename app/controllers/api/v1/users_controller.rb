

module Api
  module V1
      class UsersController < ApplicationController
            MAX_PAGINATION_LIMIT = 100
            def index
              users = User.limit(limit).offset(params[:offset])

              render json: UsersRepresenter.new(users).as_json
            end

            def create
              user = User.create!(user_params)

              # UpdateSkuJob.perform_later(params[:username])

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

            def limit
              [params.fetch(:limit, MAX_PAGINATION_LIMIT).to_i, MAX_PAGINATION_LIMIT].min
            end

            def user_params
              params.require(:user).permit(:username, :email)
            end
      end
    end
  end
