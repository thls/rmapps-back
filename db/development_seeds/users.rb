# Print a message indicating that the users seed is running
puts 'Running users seed...'

# Default password for all users
password = '123456'

# Create 20 user records
(1..10).each do |i|
  # Define user parameters for creating a new user
  user_params = {
    email: "user#{i}@example.com",
    password: password,
    password_confirmation: password,
  }

  # Create a new user record with the defined parameters
  user = User.create!(user_params)
end
