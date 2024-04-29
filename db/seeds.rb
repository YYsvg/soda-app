# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



  IncomeCategory.create(name: "おこづかい")
  IncomeCategory.create(name: "おてつだい")
  IncomeCategory.create(name: "お年玉")



  OutcomeCategory.create(name: "食費")
  OutcomeCategory.create(name: "文房具")
  OutcomeCategory.create(name: "書籍")
  OutcomeCategory.create(name: "交際費")
  OutcomeCategory.create(name: "おでかけ")
  OutcomeCategory.create(name: "衣服")
