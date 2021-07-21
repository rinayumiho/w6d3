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
end
