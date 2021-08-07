# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)

Contribution.destroy_all
User.destroy_all
Directory.destroy_all


puts "Creating users..."
daniel = User.create(first_name: "Daniel", last_name: "Mekuriaw", username: "daniel", password: "123", bio: "I am Dani.", date_of_birth: Faker::Date.between(from: '2001-07-16', to: '2001-07-16'), nationality: "Ethiopian", education_status: "Undergraduate Student", address: "United States of America", email: "daniel.mekuriaw16@gmail.com", phone_number: "617-866-7928", organization: "Yale University", website: "www.danielmekuriaw.com", github: "www.github.com/danielmekuriaw", instagram:"danielmekuriaw", twitter: "danielmekuriaw", facebook: "Daniel Mekuriaw")

30.times{
    User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, username: Faker::Name.first_name, password: "123", bio: Faker::Quote.famous_last_words, date_of_birth: Faker::Date.between(from: '1980-12-23', to: '2003-12-25'), nationality: Faker::Address.country, education_status: "Graduate Student", address: Faker::Address.country, email: Faker::Internet.email, phone_number: Faker::PhoneNumber.cell_phone, organization: Faker::Company.name, website: Faker::Internet.url, github: "www.github.com/#{Faker::Internet.username}", instagram: Faker::Internet.username, twitter: Faker::Internet.username, facebook: Faker::Internet.username)
}

puts "Created users!"

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

puts "Creating contributions..."

words_array = ["ሰላም", "ጤና", "ይስጥልኝ",
 "እንደምን", "አደራችሁ", "ዋላችሁ", "አመሻችሁ", "ደህና", "እደሩ", "ቻው",
 "ሁኑ", "አዎ", "አይ", "እሺ", "አመሰግናለው", "ምንም", "አይደል", "ይቅርታ", "በጣም",
 "አዝናለው", "አለኝ", "የለኝም", "አለን", "የለንም", "አለ", "የለም", "እባላለው", "የመጣሁት", "ነው", "እድሜዬ", 
 "ባለትዳር", "ነኝ", "አይደለሁም", "አልገባኝም", "ይናገራሉ"]

sentences_array = [ "ብቻዬን ነው የምጓዘው።", "ብቻዬን አይደለም የምጓዘው።", 
     "አማርኛ አልናገርም።", "እባክዎትን ይጻፉልኝ።", "አንድ አፍታ ይቆዩኝ።", "ጤና ይስጥልኝ!",
     "አንደምን አመሸሽ?", "መልካም ቀን ይሁንልህ።", "መልካም ጉዞ ይሁንልሽ።", "እባካችሁ ያላችሁትን ድገሙልኝ።",
     "እባክዎ ያሉትን ይድገሙልኝ።", "ቁም!", "አንድ ቋንቋ ብቻ በቂ አይደለም።", "መልካም ልደት!", "መልካም ፋሲካ!"
]

puts "Creating directory..."
amharic_words_directory = Directory.create(last_updated: DateTime.now(), views: 0, language_name: "Amharic", language_description: "Amharic is a language that is widely spoken in Ethiopia.", database_description: "This is a directory to have digital records of the Amharic words.", directory_name: "Amharic Words", primarily_spoken_at: "Ethiopia")
amharic_words_directory.user = daniel
amharic_words_directory.save
amharic_sentences_directory = Directory.create(last_updated: DateTime.now(), views: 0, language_name: "Amharic", language_description: "Amharic is a language that is widely spoken in Ethiopia.", database_description: "This is a directory to have digital records of the Amharic sentences.", directory_name: "Amharic Sentences", primarily_spoken_at: "Ethiopia")
amharic_sentences_directory.user = daniel
amharic_sentences_directory.save
puts "Successfully created a directory!"


words_array.each{
    |word|
    contr = Contribution.create(word_input: word, definition: Faker::Quote.famous_last_words, sentence_example: Faker::Quote.famous_last_words)
    contr.user = User.all[rand(User.all.size)]
    contr.directory = amharic_words_directory
    amharic_words_directory.save
    contr.save
}

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

sentences_array.each{
    |sentence|
    contr = Contribution.create(sentence_example: sentence)
    contr.user = User.all[rand(User.all.size)]
    contr.directory = amharic_sentences_directory
    amharic_sentences_directory.save
    contr.save
}

puts "Successfully seeded contributions!"

puts "Creating expert..."
expert = Expert.create(education: "Linguistic Studies", linguistic_experience: "Student")
expert.user = daniel
puts "Successfully seeded expert!"

