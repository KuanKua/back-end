# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)

# Contribution.destroy_all
User.destroy_all
# Directory.destroy_all


# puts "Creating users..."
daniel = User.create(first_name: "Daniel", last_name: "Mekuriaw", username: "daniel", password: "123", bio: "I am Dani.", date_of_birth: Faker::Date.between(from: '2001-07-16', to: '2001-07-16'), nationality: "Ethiopian", education_status: "Undergraduate Student", country_of_residence: "United States of America")

# 30.times{
#     User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, date_of_birth: Faker::Date.between(from: '1980-12-23', to: '2003-12-25'), nationality: Faker::Address.country, education_status: "Graduate Student", country_of_residence: Faker::Address.country)
# }

# puts "Created users!"

# User.all.each{
#     |user| 
#     puts "------------------------------------"
#     puts "First name: " + user.first_name
#     puts "Last name: " + user.last_name
#     puts "Date of birth: " + user.date_of_birth.to_s
#     puts "Nationality: " + user.nationality
#     puts "Country of residence: " + user.country_of_residence
#     puts "------------------------------------"
# }

# puts "Creating contributions..."

# words_array = ["ሰላም", "ጤና", "ይስጥልኝ",
# "እንደምን", "አደራችሁ", "ዋላችሁ", "አመሻችሁ", "ደህና", "እደሩ", "ቻው",
# "ሁኑ", "አዎ", "አይ", "እሺ", "አመሰግናለው", "ምንም", "አይደል", "ይቅርታ", "በጣም",
# "አዝናለው", "አለኝ", "የለኝም", "አለን", "የለንም", "አለ", "የለም", "እባላለው", "የመጣሁት", "ነው", "እድሜዬ", 
# "ባለትዳር", "ነኝ", "አይደለሁም", "አልገባኝም", "ይናገራሉ"]

# sentences_array = [ "ብቻዬን ነው የምጓዘው።", "ብቻዬን አይደለም የምጓዘው።", 
#     "አማርኛ አልናገርም።", "እባክዎትን ይጻፉልኝ።", "አንድ አፍታ ይቆዩኝ።", "ጤና ይስጥልኝ!",
#     "አንደምን አመሸሽ?", "መልካም ቀን ይሁንልህ።", "መልካም ጉዞ ይሁንልሽ።", "እባካችሁ ያላችሁትን ድገሙልኝ።",
#     "እባክዎ ያሉትን ይድገሙልኝ።", "ቁም!", "አንድ ቋንቋ ብቻ በቂ አይደለም።", "መልካም ልደት!", "መልካም ፋሲካ!"
# ]

# puts "Creating directory..."
# amharic_directory = Directory.create(last_updated: DateTime.now(), views: 0, language_name: "Amharic")
# puts "Successfully created a directory!"


# words_array.each{
#     |word|
#     contr = Contribution.create(word_input: word, definition: Faker::Quote.famous_last_words, sentence_example: Faker::Quote.famous_last_words)
#     contr.user = User.all[rand(User.all.size)]
#     contr.directory = amharic_directory
#     contr.save
# }

# Contribution.all.each{
#     |contribution|
#     puts "------------------------------------"
#     puts "Word: " + contribution.word_input
#     puts "Definition: " + contribution.definition
#     puts "Sentence Example: " + contribution.sentence_example
#     puts "By: " + contribution.user.first_name + " " + contribution.user.last_name
#     puts "Directory: " + contribution.directory.language_name
#     puts "------------------------------------"
# }

# sentences_array.each{
#     |sentence|
#     contr = Contribution.create(sentence_example: sentence)
#     contr.user = User.all[rand(User.all.size)]
#     contr.directory = amharic_directory
#     contr.save
# }

# puts "Successfully seeded contributions!"

# puts "Creating expert..."
# expert = Expert.create(education: "Linguistic Studies", linguistic_experience: "Student")
# expert.user = daniel
# puts expert
# puts "Successfully seeded expert!"

