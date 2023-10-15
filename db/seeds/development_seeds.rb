# Print a message indicating that the seed files are being loaded
puts 'Loading development seed files...'

# Get a list of seed files in the 'db/development_seeds' directory
seed_files = Dir[File.join(Rails.root, 'db', 'development_seeds', '*.rb')].sort

# Load and execute each seed file
seed_files.each do |seed|
  load seed
end
