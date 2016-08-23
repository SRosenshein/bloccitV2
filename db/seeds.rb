require 'random_data'

#Unique post
p = Post.find_or_create_by(title: "Unique Post", body: "This is a unique post")


# Create Posts
50.times do
    Post.create!(
        title: RandomData.random_sentence,
        body: RandomData.random_paragraph
    )
end
posts = Post.all

# Create Comments
100.times do
    Comment.create!(
        post: posts.sample,
        body: RandomData.random_paragraph
    )
end

#Unique comment
Comment.find_or_create_by(post: p, body: "Unique Comment")

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"

