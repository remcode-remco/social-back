require 'faker'

# Clear existing data
# Reply.destroy_all
# User.destroy_all
# Location.destroy_all
# Post.destroy_all

require 'csv'

# Path to your CSV file
# csv_file_path = Rails.root.join('db', 'us NY zips.csv')

# Read the CSV file
# CSV.foreach(csv_file_path, headers: true) do |row|
#   Location.create!(
#     postcode: row['zip'],
#     latitude: row['latitude'],
#     longitude: row['longitude'],
#     name: row['city'],
#     country: Country.first
#   )
# end



# Create Users
5.times do
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    location_id: Location.all.sample.id
  )
end

page_type=PageType.create!(name:"Sports Club")
5.times do
  Page.create!(
    name: Faker::Name.name,
    description: Faker::Lorem.sentence,
    contact: Faker::Lorem.sentence,
    location_id: Location.all.sample.id,
    user_id: User.all.sample.id,
    page_type_id: PageType.first.id
  )
end

# Create Posts and Replies
Location.all.each do |location|
  User.all.sample(3).each do |user|
    post = user.posts.create!(
      content: Faker::Lorem.sentence,
      location_id: location.id
    )

    3.times do
      post.replies.create!(
        content: Faker::Lorem.sentence,
        author: User.all.sample
      )
    end
  end
end
