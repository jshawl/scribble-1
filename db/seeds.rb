<<<<<<< HEAD
require_relative './comment_data.rb'
require_relative './post_data.rb'

Comment.destroy_all
Post.destroy_all


comment_data = get_comment_data()
post_data = get_post_data()

comment_data.each_pair do |post_title, comments|
  info = post_data[post_title]
  current_post = Post.create!({
    title:            info[:title],
    author:           info[:author],
    body:             info[:body],
    photo_url:        info[:photo_url]
    })

  comments.each do |comment|
    Comment.create!({
      author:           comment[:author],
      body:             comment[:body],
      post:             current_post
      })
  end
end
=======
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
>>>>>>> c1b8113e3bbcdae83c207bb9162b22ee6cf04c17
