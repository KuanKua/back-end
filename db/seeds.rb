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
daniel = User.create(first_name: "Daniel", last_name: "Mekuriaw", username: "anonymous", password: "123", bio: "I am Dani.", date_of_birth: Faker::Date.between(from: '2001-07-16', to: '2001-07-16'), nationality: "Ethiopian", education_status: "Undergraduate Student", address: "United States of America", email: "daniel.mekuriaw16@gmail.com", phone_number: "617-866-7928", organization: "Yale University", website: "www.danielmekuriaw.com", github: "www.github.com/danielmekuriaw", instagram:"danielmekuriaw", twitter: "danielmekuriaw", facebook: "Daniel Mekuriaw", avatar_address: "https://source.boringavatars.com/marble/120/Maria%20Mitchell?colors=264653,2a9d8f,e9c46a,f4a261,e76f51")

generator = ColorGenerator.new saturation: 0.3, value: 1.0

30.times{
    daniel.followers << User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, username: Faker::Name.first_name, password: "123", bio: Faker::Quote.famous_last_words, date_of_birth: Faker::Date.between(from: '1980-12-23', to: '2003-12-25'), nationality: Faker::Address.country, education_status: "Graduate Student", address: Faker::Address.country, email: Faker::Internet.email, phone_number: Faker::PhoneNumber.cell_phone, organization: Faker::Company.name, website: Faker::Internet.url, github: "www.github.com/#{Faker::Internet.username}", instagram: Faker::Internet.username, twitter: Faker::Internet.username, facebook: Faker::Internet.username, avatar_address: "https://source.boringavatars.com/marble/120/Maria%20Mitchell?colors=#{generator.create_hex},#{generator.create_hex},#{generator.create_hex},#{generator.create_hex},#{generator.create_hex}")
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
amharic_words_directory = Directory.create!(views: 0, language_name: "Amharic", language_description: "Amharic is a language that is widely spoken in Ethiopia.", database_description: "This is a directory to have digital records of the Amharic words.", directory_name: "Amharic Words", primarily_spoken_at: "Ethiopia", directory_type: "Word", user_id: daniel.id, goal: 100)
amharic_words_directory.user = daniel
amharic_words_directory.save
amharic_sentences_directory = Directory.create!(views: 0, language_name: "Amharic", language_description: "Amharic is a language that is widely spoken in Ethiopia.", database_description: "This is a directory to have digital records of the Amharic sentences.", directory_name: "Amharic Sentences", primarily_spoken_at: "Ethiopia", directory_type: "Sentence", user_id: daniel.id, goal: 1000)
amharic_sentences_directory.user = daniel
amharic_sentences_directory.save
amharic_phrases_directory = Directory.create!(views: 0, language_name: "Amharic", language_description: "Amharic is a language that is widely spoken in Ethiopia.", database_description: "This is a directory to have digital records of the Amharic phrases.", directory_name: "Amharic Phrases", primarily_spoken_at: "Ethiopia", directory_type: "Phrase", user_id: daniel.id, goal: 1000)
amharic_phrases_directory.user = daniel
amharic_phrases_directory.save
amharic_characters_directory = Directory.create!(views: 0, language_name: "Amharic", language_description: "Amharic is a language that is widely spoken in Ethiopia.", database_description: "This is a directory to have digital records of the Amharic characters.", directory_name: "Amharic Characters", primarily_spoken_at: "Ethiopia", directory_type: "Character", user_id: daniel.id, goal: 100)
amharic_characters_directory.user = daniel
amharic_characters_directory.save
amharic_longtexts_directory = Directory.create!(views: 0, language_name: "Amharic", language_description: "Amharic is a language that is widely spoken in Ethiopia.", database_description: "This is a directory to have digital records of the Amharic long texts.", directory_name: "Amharic Long Texts", primarily_spoken_at: "Ethiopia", directory_type: "Long Text", user_id: daniel.id, goal: 10)
amharic_longtexts_directory.user = daniel
amharic_longtexts_directory.save

swahili_words_directory = Directory.create!(views: 0, language_name: "Swahili", language_description: "Swahili is a language that is widely spoken in East Africa.", database_description: "This is a directory to have digital records of Swahili words.", directory_name: "Swahili Words", primarily_spoken_at: "Kenya, Tanzania", directory_type: "Word", user_id: daniel.id, goal: 1000)
swahili_words_directory.user = daniel
swahili_words_directory.save
swahili_phrases_directory = Directory.create!(views: 0, language_name: "Swahili", language_description: "Swahili is a language that is widely spoken in East Africa.", database_description: "This is a directory to have digital records of Swahili phrases.", directory_name: "Swahili Phrases", primarily_spoken_at: "Kenya, Tanzania", directory_type: "Phrase", user_id: daniel.id, goal: 100)
swahili_phrases_directory.user = daniel
swahili_phrases_directory.save
swahili_sentences_directory = Directory.create!(views: 0, language_name: "Swahili", language_description: "Swahili is a language that is widely spoken in East Africa.", database_description: "This is a directory to have digital records of Swahili sentences.", directory_name: "Swahili Sentences", primarily_spoken_at: "Kenya, Tanzania", directory_type: "Sentence", user_id: daniel.id, goal: 100)
swahili_sentences_directory.user = daniel
swahili_sentences_directory.save
swahili_longtexts_directory = Directory.create!(views: 0, language_name: "Swahili", language_description: "Swahili is a language that is widely spoken in East Africa.", database_description: "This is a directory to have digital records of Swahili long texts.", directory_name: "Swahili Long Texts", primarily_spoken_at: "Kenya, Tanzania", directory_type: "Long Texts", user_id: daniel.id, goal: 10)
swahili_longtexts_directory.user = daniel
swahili_longtexts_directory.save

swahili_characters_directory = Directory.create!(views: 0, language_name: "Swahili", language_description: "Swahili is a language that is widely spoken in East Africa.", database_description: "This is a directory to have digital records of the Swahili characters.", directory_name: "Swahili Characters", primarily_spoken_at: "Kenya, Tanzania", directory_type: "Character", user_id: daniel.id, goal: 100)
swahili_characters_directory.user = daniel
swahili_characters_directory.save


puts "Successfully created a directory!"


# words_array.each{
#     |word|
#     contr = Contribution.create(word_input: word, definition: Faker::Quote.famous_last_words, sentence_example: Faker::Quote.famous_last_words)
#     contr.user = User.all[rand(User.all.size)]
#     contr.directory = amharic_words_directory
#     amharic_words_directory.save
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
#     contr.directory = amharic_sentences_directory
#     amharic_sentences_directory.save
#     contr.save
# }

# puts "Successfully seeded contributions!"

# puts "Creating expert..."
# expert = Expert.create(education: "Linguistic Studies", linguistic_experience: "Student")
# expert.user = daniel
# puts "Successfully seeded expert!"

