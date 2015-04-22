Person.delete_all
Organization.delete_all
Employment.delete_all

people = 34.times.map{Person.create!(name: Faker::Name.name)}
organizations = 27.times.map{Organization.create!(name: Faker::Company.name)}

people.each do |person|
  organizations.sample(rand(5)).each do |organization|
    Employment.create!(
      person_id: person.id,
      organization_id: organization.id
    )
  end
end
