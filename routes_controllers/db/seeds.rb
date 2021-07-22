# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#  id        :bigint           not null, primary key
#  title     :string           not null
#  image_url :string           not null
#  artist_id :integer          not null

# ActiveRecord::Base.transaction do
#   User.delete_all
#   Artwork.delete_all
#   ArtworkShare.delete_all

users = User.create([{username: 'Jay'}, {username: 'Long'}, {username: 'King'}, {username: 'Mary'}, {username: 'Eliza'}])

artworks = Artwork.create([{title: 'Mona Lisa', image_url: 'google.com/21321', artist_id: 1},
                        {title: 'Starry Night', image_url: 'google.com/21651', artist_id: 1},
                        {title: 'Mona Lisa', image_url: 'google.com/27651', artist_id: 3},
                        {title: 'Night', image_url: 'google.com/23451', artist_id: 4},
                        {title: 'Day', image_url: 'google.com/28761', artist_id: 4},
                        {title: 'Star', image_url: 'google.com/21321', artist_id: 2}
                        ])

artworks_shares = ArtworkShare.create([{artwork_id: 1, viewer_id: 3},
                                        {artwork_id: 4, viewer_id: 2},
                                        {artwork_id: 3, viewer_id: 5},
                                        {artwork_id: 2, viewer_id: 1}
                                        ])

comments = Comment.create([{body: "comment_1", user_id: 4, artwork_id: 5},
                            {body: "comment_2", user_id: 1, artwork_id: 1},
                            {body: "comment_3", user_id: 5, artwork_id: 3},
                            {body: "comment_4", user_id: 1, artwork_id: 2},
                            {body: "comment_5", user_id: 2, artwork_id: 2},
                            {body: "comment_6", user_id: 3, artwork_id: 4},
                            {body: "comment_7", user_id: 5, artwork_id: 3},
                            {body: "comment_8", user_id: 1, artwork_id: 1},
                            ])
