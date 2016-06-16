# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create([{username: "jerrybi", password: "password", email: "jerrybi0522@gmail.com", admin: true}])

categories = Category.create([{mood: "Cute"}, {mood: "Joyful"}, {mood: "Melancholic"}, {mood: "Psyched"}, {mood: "Serene"}])

Song.create([
	{
		user_id: users[0].id,
		category_id: categories[0].id,
		name: "Renai Circulation",
		artist: "Nana Mizuki",
		description: "Opening 4 from Bakemonogatari.",
		youtube_url: "https://www.youtube.com/watch?v=bdSAWBUpbIM"
	},
	{
		user_id: users[0].id,
		category_id: categories[1].id,
		name: "Sobakasu",
		artist: "Lon",
		description: "Fanmade cover of Rurouni Kenshin opening. Original by Judy and Mary.",
		youtube_url: "https://www.youtube.com/watch?v=ZGtBKChPmkM"
	},
	{
		user_id: users[0].id,
		category_id: categories[2].id,
		name: "Patchwork Staccato",
		artist: "Toa ft. Miku Hatsune",
		description: "Vocaloid song by Toa.",
		youtube_url: "https://www.youtube.com/watch?v=fJlnpOqeIQI"
	},
	{
		user_id: users[0].id,
		category_id: categories[3].id,
		name: "Kane wo Narashite",
		artist: "BONNIE PINK",
		description: "Opening to Tales of Vesperia.",
		youtube_url: "https://www.youtube.com/watch?v=65DtPZLeBzs"
	},
	{
		user_id: users[0].id,
		category_id: categories[4].id,
		name: "Mousou Katharsis",
		artist: "Rie Tanaka and Honda Mariko",
		description: "Song from Megadimension Neptunia VII.",
		youtube_url: "https://www.youtube.com/watch?v=Y3GrHLOgF3c"
	},

	])