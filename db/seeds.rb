20.times do 
	p = Project.create(
		name: Faker::Company.name,
		description: Faker::Hacker.say_something_smart
	)
	20.times do
		p.entries.create(
			hours: Faker::Number.number(2),
			minutes: Faker::Number.number(2),
			comments: Faker::Hipster.paragraph,
			date: Faker::Date.backward(120)
			)
	end
end
