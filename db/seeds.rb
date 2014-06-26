100.times do |article|
  Article.create(title: Faker::Lorem.characters(10), body:Faker::Lorem.paragraph(3), kategoria: ["UBUNTU", "NEWS", "RUBY ON RAILS", "HTML5", "ANDROID"].sample)
end
