class ArtworkSharesController < ApplicationController

    def create
        artwork_shares = ArtworkShare.new(params.require(:artwork_share).permit(:artwork_id, :viewer_id))
        # replace the `user_attributes_here` with the actual attribute keys
        if artwork_shares.save
            render json: artwork_shares
        else
            render json: artwork_shares.errors.full_messages, status: :unprocessable_entity
        end
    end
    
    def destroy
        render json: ArtworkShare.destroy(params[:id])
    end

    private

    def artwork_share_params
        params.require(:artwork_share).permit(:artwork_id, :viewer_id)
    end
end