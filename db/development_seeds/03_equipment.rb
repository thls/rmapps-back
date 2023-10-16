# Print a message indicating that the equipment seed is running
puts 'Running equipment seed...'

# Create 20 equipment records with random parameters
(1..20).each do |i|
  # Generate random equipment parameters
  equipment_params = {
    acquisition_date: Faker::Date.in_date_period(month: 2),
    name: Faker::Construction.heavy_equipment,
    serial_number: "#{i}-#{Faker::Company.duns_number}",  # Include 'i' in the serial number
    responsible_user: User.all.sample,                   # Randomly select a user as the responsible user
    company: Company.all.sample                          # Randomly select a company
  }

  # Create a new Equipment record with the generated parameters and save it to the database
  Equipment.create!(equipment_params)
end
