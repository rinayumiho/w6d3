class CommentsController < ApplicationController
    def index
        if params[:artwork_id] 
            comments = Comment.where(artwork_id: params[:artwork_id])
            render json: comments
        elsif params[:user_id]
            comments = Comment.where(user_id: params[:user_id])
            render json: comments
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:body, :user_id, :artwork_id)
    end

end