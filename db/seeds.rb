# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create!(first_name: 'Dawn', last_name: 'Fernandez', department: 'CE', rank: 'Professor', contact_number: '9142469837', email: 'dfernandez@up.edu.ph', password: '178026')
user.researcher.activated = true
user.researcher.save!
researcher = user.researcher

proposal = researcher.proposals.create!(title: 'A Comparative Study of Steel and Wooden Armrests Ergonimically', researcher_name: 'Dawn Fernandez', coresearchers: 'Maureen Adkins', objectives: 'To compare wood and steel armrests in terms ergonomically speaking', descriptions: 'This paper aims to compare which material is better for use in the production of armrests.', is_assigned_reviewers: false, is_vetoed: false, is_decided: false)
proposal.submission_period = SubmissionPeriod.create!(start_draft: DateTime.parse("8th Dec 2017 8:00:00 PM"), end_draft: DateTime.parse("15th Dec 2017 8:00:00 PM"), start_votation: DateTime.parse("22th Jan 2018 8:00:00 PM"), end_votation: DateTime.parse("20th Feb 2017 8:00:00 PM"), is_set: true, is_active_draft: false, is_active_votation: true)
proposal = researcher.proposals.create!(title: 'Hypertext Transfer Protocol 10-way handshake',researcher_name: 'Dawn Fernandez', coresearchers: 'Monique Tucker', objectives: 'To produce a secure way of exchanging information in HTTP.', descriptions: 'The 10-way handshake includes a handshake between all layers from Physical to Application.', is_assigned_reviewers: false, is_vetoed: false, is_decided: false)
proposal.submission_period = SubmissionPeriod.create!(start_draft: DateTime.parse("9th Dec 2017 8:00:00 PM"), end_draft: DateTime.parse("16th Dec 2017 8:00:00 PM"), start_votation: DateTime.parse("22th Jan 2018 8:00:00 PM"), end_votation: DateTime.parse("20th Feb 2017 8:00:00 PM"), is_set: true, is_active_draft: false, is_active_votation: true)
proposal = researcher.proposals.create!(title: 'Dijkstra\'s Algorithm Refinements', researcher_name: 'Dawn Fernandez', coresearchers: 'Tyler Ortiz', objectives: 'To improve Uniform-Cost searches', descriptions: 'This algorithm is the same as Dijkstra\'s algorithm with the inclusion of pruning states which are already \'expired\'', is_assigned_reviewers: false, is_vetoed: false, is_decided: false)

user = User.create!(first_name: 'Isabel', last_name: 'Lawrence', department: 'CS', rank: 'Professor', contact_number: '9333867460', email: 'ilawrence@up.edu.ph', password: "260720")
user.researcher.save!
researcher = user.researcher

proposal3 = researcher.proposals.create!(title: 'Faculty Research Incentive Award', researcher_name: 'Isabel Lawrence', coresearchers: 'Claire Reid', objectives: 'To effectively design a system wherin the College of Engineering can handle research proposal grants.', descriptions: 'This project is developed intentionally for the College of Engineering faculty and administration.', is_assigned_reviewers: false, is_vetoed: false, is_decided: false)
# proposal3.submission_period = SubmissionPeriod.create!(start_draft: DateTime.parse("10th Dec 2017 8:00:00 PM"), end_draft: DateTime.parse("17th Dec 2017 8:00:00 PM"), start_votation: DateTime.parse("22th Jan 2018 8:00:00 PM"), end_votation: DateTime.parse("20th Feb 2017 8:00:00 PM"), is_set: true, is_active_draft: false, is_active_votation: true)
proposal = researcher.proposals.create!(title: 'Transformation of Simple Inorganic Materials to Aldehydes through Oxidation with Carbon Catalysts', researcher_name: 'Isabel Lawrence', coresearchers: 'Owen Perry', objectives: 'This study aims to convert simple inorganic materials like oxygen to aldehydes to produce simple building blocks of life.', descriptions: 'Through continuous oxidation simple inorganic materials can be transformed to simple organic materials by introducng carbon catalysts.', is_assigned_reviewers: false, is_vetoed: false, is_decided: false)
proposal.submission_period = SubmissionPeriod.create!(start_draft: DateTime.parse("11th Dec 2017 8:00:00 PM"), end_draft: DateTime.parse("18th Dec 2017 8:00:00 PM"), start_votation: DateTime.parse("22th Jan 2018 8:00:00 PM"), end_votation: DateTime.parse("20th Feb 2017 8:00:00 PM"), is_set: true, is_active_draft: false, is_active_votation: true)
proposal2 = researcher.proposals.create!(title: 'Proof of NP-Completeness of RSA decryption', researcher_name: 'Isabel Lawrence', coresearchers: 'Leroy Mann', objectives: 'Addition of an NP-Complete problem to aid in proving/disproving P = NP problem', descriptions: 'This paper discusses how RSA decryption is NP-Complete through reduction from 3-SAT Problem', is_assigned_reviewers: true, is_vetoed: false, is_decided: false)
proposal2.submission_period = SubmissionPeriod.create!(start_draft: DateTime.parse("12th Dec 2017 8:00:00 PM"), end_draft: DateTime.parse("19th Dec 2017 8:00:00 PM"), start_votation: DateTime.parse("22th Jan 2018 8:00:00 PM"), end_votation: DateTime.parse("20th Feb 2017 8:00:00 PM"), is_set: true, is_active_draft: false, is_active_votation: true)
proposal = researcher.proposals.create!(title: 'Oil leakage sensors installation in the West Philippine Sea', researcher_name: 'Isabel Lawrence', coresearchers: 'Spencer Brown', objectives: 'To immediately alarm the crew and coast guards of potential oil leakages.', descriptions: 'The sensor is built using radio waves which can sense large amounts of interference because of the density of the oil as compared to sea water.', is_assigned_reviewers: true, is_vetoed: false, is_decided: false)
proposal.submission_period = SubmissionPeriod.create!(start_draft: DateTime.parse("13th Dec 2017 8:00:00 PM"), end_draft: DateTime.parse("20th Dec 2017 8:00:00 PM"), start_votation: DateTime.parse("22th Jan 2018 8:00:00 PM"), end_votation: DateTime.parse("20th Feb 2017 8:00:00 PM"), is_set: true, is_active_draft: false, is_active_votation: true)

user = User.create!(first_name: 'Emmett', last_name: 'Alvarez', department: 'CE', rank: 'Professor', contact_number: '9835583620', email: 'ealvarez@up.edu.ph', password: '332027')
user.admin.activated = true
user.admin.save!

user = User.create!(first_name: 'Penny', last_name: 'Sims', department: 'ECE', rank: 'Professor', contact_number: '9653778294', email: 'psims@up.edu.ph', password: "461825")
user.committee_head.activated = true
user.committee_head.save!
committee_head = user.committee_head
review = committee_head.reviews.create!(comment: "This needs more citation", proposal_id: proposal.id, is_decided: false)
review = committee_head.reviews.create!(comment: "Can you please indicate in the methodology how you plan to implement this large scale project.", proposal_id: proposal2.id, vote: 1, is_decided: true)
review = committee_head.reviews.create!(proposal_id: proposal3.id)

user = User.create!(first_name: 'Beverly', last_name: 'Schmidt', department: 'CS', rank: '5', contact_number: '9768465839', email: 'bschmidt@up.edu.ph', password: "544814")
user.committee_member.activated = true
user.committee_member.save!
committee_member = user.committee_member
review = committee_member.reviews.create!(comment: "Please elaborate on your paper more. It seems too vague for me.", proposal_id: proposal.id, vote: 0, is_decided: true)

user = User.create!(first_name: 'Tracy', last_name: 'Ruiz', department: 'ME', rank: 'Professor', contact_number: '9768465838', email: 'truiz@up.edu.ph', password: "640601")
user.committee_member.activated = true
user.committee_member.save!
committee_member = user.committee_member
review = committee_member.reviews.create!(comment: 'I do not like the topic you\'ve chosen. It doesn\'t seem too engaging.', proposal_id: proposal.id, vote: -1, is_decided: true)

user = User.create!(first_name: 'Guadalupe', last_name: 'Leonard', department: 'CoE', rank: 'Professor', contact_number: '9768465839', email: 'gleonard@up.edu.ph', password: "787779")
user.dean.activated = true
user.dean.save!

Announcement.create!(title: 'Submission Period has now begun!', body: 'Submit all necessary requirements to proceed.')
Announcement.create!(title: 'Approved proposals are now available!', body: 'Check the status of your proposal using your FRIA account.')