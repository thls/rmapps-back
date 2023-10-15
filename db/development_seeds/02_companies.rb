# Method to generate a random CNPJ-like string with formatting
def generate_random_cnpj
  cnpj = ''

  # Generate 14 random digits
  14.times { cnpj += rand(10).to_s }

  # Format the CNPJ-like string as "XX.XXX.XXX/XXXX-XX"
  formatted_cnpj = "#{cnpj[0..1]}.#{cnpj[2..4]}.#{cnpj[5..7]}/#{cnpj[8..11]}-#{cnpj[12..13]}"

  # Return the formatted CNPJ-like string
  formatted_cnpj
end

# Create 3 company records with random CNPJs and business names
(1..3).each do |i|
  # Define common user parameters for creating a new common user
  company_params = {
    cnpj: generate_random_cnpj,                # Generate a random CNPJ
    business_name: Faker::Company.name         # Generate a random business name
  }

  # Create a new company record with the specified parameters
  Company.create!(company_params)
end
