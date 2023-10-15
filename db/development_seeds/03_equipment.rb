(0..20).each do |i|
  equipment_params = {
    acquisition_date: Faker::Date.in_date_period(month: 2),
    name: Faker::Construction.heavy_equipment,
    serial_number: "#{i}-Faker::Company.duns_number",
    responsible_user: User.all.sample,
    company: Company.all.sample
  }

  Equipment.create!(equipment_params)
end
