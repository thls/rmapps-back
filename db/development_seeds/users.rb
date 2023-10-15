# Print a message indicating that the users seed is running
puts 'Running users seed...'

# Define a method to create a user
def create_user(user_params)
  User.create!(user_params)
end

# Set a default password for all users
password = '123456'

# Define user parameters for the administrator user
admin_user_params = {
  email: "administrator@example.com",
  password: password,
  password_confirmation: password,
}

# Create the administrator user
administrator = create_user(admin_user_params)

# Create an Administrator record associated with the administrator user
Administrator.create!(user: administrator)

# Create 10 common user records with similar parameters
(1..10).each do |i|
  # Define common user parameters for creating a new common user
  common_user_params = {
    email: "user#{i}@example.com",
    password: password,
    password_confirmation: password,
  }

  # Create a new common user
  create_user(common_user_params)
end
