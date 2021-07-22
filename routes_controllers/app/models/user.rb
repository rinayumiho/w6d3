# == Schema Information
#
# Table name: users
#
#  id    :bigint           not null, primary key
#  name  :string           not null
#  email :string           not null
#
class User < ApplicationRecord
    validates :username, presence: true
    validates :username, uniqueness: true

    has_many :artworks,
        primary_key: :id,
        foreign_key: :artist_id,
        class_name: :Artwork,
        dependent: :destroy

    has_many :artworkshares,
        primary_key: :id,
        foreign_key: :viewer_id,
        class_name: :ArtworkShare,
        dependent: :destroy

    has_many :shared_artworks,
        through: :artworks,
        source: :artworkshares

    has_many :comments,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :Comment,
        dependent: :destroy

end
