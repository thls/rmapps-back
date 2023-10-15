# Print a message indicating that the production seed files are being loaded
puts 'Loading production seed files...'

# Get a list of seed files in the 'db/production_seeds' directory
seed_files = Dir[File.join(Rails.root, 'db', 'production_seeds', '*.rb')].sort

# Load and execute each production seed file
seed_files.each do |seed|
  load seed
end
