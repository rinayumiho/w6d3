class CommentsControlller < ApplicationController
    def index
        comments = params[:]
    end

    private

    def comment_params
        params.require(:comment).permit(:body, :user_id, :artwork_id)
    end

end