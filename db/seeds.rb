# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create!(first_name: 'Dawn', last_name: 'Fernandez', department: 'CE', rank: 'Professor', contact_number: '9142469837', email: 'researcher1@up.edu.ph', password: 'password')
user.researcher.activated = true
user.researcher.save!
researcher = user.researcher



user = User.create!(first_name: 'Isabel', last_name: 'Lawrence', department: 'CS', rank: 'Professor', contact_number: '9333867460', email: 'researcher2@up.edu.ph', password: "password")
user.researcher.save!
researcher = user.researcher


user = User.create!(first_name: 'Emmett', last_name: 'Alvarez', department: 'CE', rank: 'Professor', contact_number: '9835583620', email: 'admin@up.edu.ph', password: 'password')
user.admin.activated = true
user.admin.save!

user = User.create!(first_name: 'Penny', last_name: 'Sims', department: 'ECE', rank: 'Professor', contact_number: '9653778294', email: 'committee_head@up.edu.ph', password: "password")
user.committee_head.activated = true
user.committee_head.save!
committee_head = user.committee_head

user = User.create!(first_name: 'Beverly', last_name: 'Schmidt', department: 'CS', rank: '5', contact_number: '9768465839', email: 'committee_member1@up.edu.ph', password: "password")
user.committee_member.activated = true
user.committee_member.save!
committee_member = user.committee_member

user = User.create!(first_name: 'Tracy', last_name: 'Ruiz', department: 'ME', rank: 'Professor', contact_number: '9768465838', email: 'committee_member2@up.edu.ph', password: "password")
user.committee_member.activated = true
user.committee_member.save!
committee_member = user.committee_member

user = User.create!(first_name: 'Guadalupe', last_name: 'Leonard', department: 'CoE', rank: 'Professor', contact_number: '9768465839', email: 'dean@up.edu.ph', password: "password")
user.dean.activated = true
user.dean.save!

Announcement.create!(title: 'Submission Period has now begun!', body: 'Submit all necessary requirements to proceed.')
Announcement.create!(title: 'Approved proposals are now available!', body: 'Check the status of your proposal using your FRIA account.')

User.create!(first_name: 'Nelson', last_name: 'Dixon', department: 'ME', rank: 'Professor', contact_number: '9123656523', email: 'ndixon@up.edu.ph', password: 'password')
User.create!(first_name: 'Earl', last_name: 'Cross', department: 'Che', rank: 'Professor', contact_number: '9123656523', email: 'ecross@up.edu.ph', password: 'password')
User.create!(first_name: 'Derrick', last_name: 'Brooks', department: 'EE', rank: 'Professor', contact_number: '9123656523', email: 'dbrooks@up.edu.ph', password: 'password')
User.create!(first_name: 'Jodi', last_name: 'Bailey', department: 'CoE', rank: 'Professor', contact_number: '9123656523', email: 'jbailey@up.edu.ph', password: 'password')
User.create!(first_name: 'Bessie', last_name: 'Munoz', department: 'IE', rank: 'Professor', contact_number: '9123656523', email: 'bmunoz@up.edu.ph', password: 'password')
User.create!(first_name: 'Lydia', last_name: 'Hammond', department: 'IE', rank: 'Professor', contact_number: '9123656523', email: 'lhammond@up.edu.ph', password: 'password')
User.create!(first_name: 'Elizabeth', last_name: 'Cadwell', department: 'CE', rank: 'Professor', contact_number: '9123656523', email: 'ecadwell@up.edu.ph', password: 'password')
User.create!(first_name: 'Emma', last_name: 'Martinez', department: 'ME', rank: 'Professor', contact_number: '9123656523', email: 'emartinez@up.edu.ph', password: 'password')
User.create!(first_name: 'Erik', last_name: 'Curry', department: 'GE', rank: 'Professor', contact_number: '9123656523', email: 'ecurry@up.edu.ph', password: 'password')
User.create!(first_name: 'Anthony', last_name: 'Clayton', department: 'GE', rank: 'Professor', contact_number: '9123656523', email: 'aclayton@up.edu.ph', password: 'password')
User.create!(first_name: 'Roberta', last_name: 'Allison', department: 'ME', rank: 'Professor', contact_number: '9123656523', email: 'rallison@up.edu.ph', password: 'password')
User.create!(first_name: 'Karla', last_name: 'Figueroa', department: 'CS', rank: 'Professor', contact_number: '9123656523', email: 'kfigueroa@up.edu.ph', password: 'password')
User.create!(first_name: 'Yvette', last_name: 'Sanchez', department: 'CS', rank: 'Professor', contact_number: '9123656523', email: 'ysanchez@up.edu.ph', password: 'password')
User.create!(first_name: 'Benjamin', last_name: 'Becker', department: 'ME', rank: 'Professor', contact_number: '9123656523', email: 'bbecker@up.edu.ph', password: 'passwordpassword')
User.create!(first_name: 'Vincent', last_name: 'Mccoy', department: 'ME', rank: 'Professor', contact_number: '9123656523', email: 'vmccoy@up.edu.ph', password: 'password')
User.create!(first_name: 'Wesley', last_name: 'Ford', department: 'GE', rank: 'Professor', contact_number: '9123656523', email: 'wford@up.edu.ph', password: 'password')
User.create!(first_name: 'Ricardo', last_name: 'Sutton', department: 'IE', rank: 'Professor', contact_number: '9123656523', email: 'rsutton@up.edu.ph', password: 'password')
User.create!(first_name: 'Jeanne', last_name: 'Morrison', department: 'CE', rank: 'Professor', contact_number: '9123656523', email: 'jmorrison@up.edu.ph', password: 'password')
User.create!(first_name: 'Tonya', last_name: 'Underwood', department: 'MMM', rank: 'Professor', contact_number: '9123656523', email: 'tunderwood@up.edu.ph', password: 'password')
User.create!(first_name: 'Florence', last_name: 'Ingram', department: 'ME', rank: 'Professor', contact_number: '9123656523', email: 'fingram@up.edu.ph', password: 'password')
User.create!(first_name: 'Malcolm', last_name: 'Hines', department: 'MMM', rank: 'Professor', contact_number: '9123656523', email: 'mhines@up.edu.ph', password: 'password')
User.create!(first_name: 'Josefina', last_name: 'Olson', department: 'CE', rank: 'Professor', contact_number: '9123656523', email: 'jolson@up.edu.ph', password: 'password')
User.create!(first_name: 'Alfredo', last_name: 'Wolfe', department: 'EE', rank: 'Professor', contact_number: '9123656523', email: 'awolfe@up.edu.ph', password: 'password')
User.create!(first_name: 'Alejandro', last_name: 'Hunt', department: 'CE', rank: 'Professor', contact_number: '9123656523', email: 'ahunt@up.edu.ph', password: 'password')
User.create!(first_name: 'Lynn', last_name: 'Ross', department: 'CoE', rank: 'Professor', contact_number: '9123656523', email: 'lross@up.edu.ph', password: 'password')
User.create!(first_name: 'Andy', last_name: 'Adkins', department: 'CS', rank: 'Professor', contact_number: '9123656523', email: 'aadkins@up.edu.ph', password: 'password')
User.create!(first_name: 'Adrienne', last_name: 'Saunders', department: 'MMM', rank: 'Professor', contact_number: '9123656523', email: 'asaunders@up.edu.ph', password: 'password')
User.create!(first_name: 'Stewart', last_name: 'Lamb', department: 'MMM', rank: 'Professor', contact_number: '9123656523', email: 'slamb@up.edu.ph', password: 'password')
User.create!(first_name: 'Gloria ', last_name: 'Castro', department: 'BE', rank: 'Professor', contact_number: '9123656523', email: 'gcastro@up.edu.ph', password: 'password')
