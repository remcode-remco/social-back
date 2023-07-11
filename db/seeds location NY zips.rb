require 'csv'

# Clear existing data
Location.destroy_all

# Path to your CSV file
csv_file_path = Rails.root.join('db', 'us NY zips.csv')

# Read the CSV file
CSV.foreach(csv_file_path, headers: true) do |row|
  Location.create!(
    postcode: row['zip'],
    latitude: row['latitude'],
    longitude: row['longitude'],
    name: row['city'],
    country: Country.first
  )
end
