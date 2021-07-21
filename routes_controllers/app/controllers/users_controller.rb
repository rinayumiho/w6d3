class UsersController < ApplicationController
    def index
        users = User.all
        render json: users
    end

    # def create
    #     render json: params
    # end

    def show
        render json: User.find(params[:id])
    end

    def create
        user = User.new(params.require(:user).permit(:name, :email))
        # replace the `user_attributes_here` with the actual attribute keys
        if user.save
            render json: user
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end
    
    def update
        user = User.find_by(id: params[:id])
        if user.update(user_params)
            render json: user
        else
            render json: user.errors.full_messages, status: 999
        end
    end

    def destroy
        render json: User.destroy(params[:id])
    end

    private

    def user_params
        params.require(:user).permit(:name, :email)
    end
end