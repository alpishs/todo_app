# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

UsersTodo.destroy_all
Todo.destroy_all
Project.destroy_all
User.destroy_all

User.create! do |u|
  u.email     = 'test_projectmanager@test.com'
  u.password  = 'password'
  u.projectmanager_role = true
end

['Vikas', 'Hajel', 'Ravi', 'alpish', 'Nilu'].each{ |name| User.create!({ email: "#{name.downcase}@promobitech.com", password: "test1234", password_confirmation: "test1234"}) }

['Gen-X', 'Zuora', 'BitBucket', 'Shopify', 'Marketo', 'Asd', 'Aws', 'Digital Ocean'].each { |name| Project.create!({name: name}) }

project_ids = Project.all.map(&:id)
status = ['DONE', 'NEW', 'IN_PROGRESS']
(1..(rand(20..40))).each do |num|
  todo = Todo.create!({title: "Task #{num}", note: "Notes for Todo #{num}", status: status.sample, project_id: project_ids.sample})
  user = User.where.not('email = "test_projectmanager@test.com"')
  user.todos << todo
  user.projects << todo.project unless user.projects.include?(todo.project)
  user.save!
end