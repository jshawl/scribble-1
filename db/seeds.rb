require_relative './comment_data.rb'
require_relative './post_data.rb'
# excellent seed data!!

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
