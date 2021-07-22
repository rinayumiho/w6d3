class ArtworksController < ApplicationController
    def index
        artworks = Artwork.get_artworks(params[:user_id])
        render json: artworks
    end

    def show
        render json: Artwork.find(params[:id])
    end

    def create
        artwork = Artwork.new(params.require(:artwork).permit(:title, :image_url, :artist_id))
        # replace the `user_attributes_here` with the actual attribute keys
        if artwork.save
            render json: artwork
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
    end
    
    def update
        artwork = Artwork.find_by(id: params[:id])
        if artwork.update(artwork_params)
            render json: artwork
        else
            render json: artwork.errors.full_messages, status: 999
        end
    end

    def destroy
        render json: Artwork.destroy(params[:id])
    end

    private

    def artwork_params
        params.require(:artwork).permit(:title, :image_url, :artist_id)
    end
end