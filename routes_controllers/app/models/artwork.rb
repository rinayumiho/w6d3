# == Schema Information
#
# Table name: artworks
#
#  id        :bigint           not null, primary key
#  title     :string           not null
#  image_url :string           not null
#  artist_id :integer          not null
#
class Artwork < ApplicationRecord
    validates :title, uniqueness: {scope: :artist_id,
    message: "Can't have two pieces of the same name"
    }

    def self.get_artworks(user_id) 
        Artwork
            .select(:id, :title, :image_url, :artist_id)
            .left_outer_joins(:artworkshares)
            .where("(artworks.artist_id = #{user_id}) or (artwork_shares.viewer_id = #{user_id})")
    end

    belongs_to :artist, 
        primary_key: :id,
        foreign_key: :artist_id,
        class_name: :User 

    has_many :artworkshares,
        primary_key: :id,
        foreign_key: :artwork_id,
        class_name: :ArtworkShare

    has_many :shared_viewers,
        through: :artworkshares,
        source: :viewer

    has_many :comments,
        primary_key: :id,
        foreign_key: :artwork_id,
        class_name: :Comment,
        dependent: :destroy
end
