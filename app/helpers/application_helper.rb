module ApplicationHelper

	API_KEY = "5EBA969F19C3C5B7EE13A38341C4D738"

	def gather_data
		player_name = ""
		all_player_data = {}

		users = User.all

		users.each do |user|
			player_name = user.name

			site_url = "http://api.steampowered.com/IDOTA2Match_570/GetMatchHistory/V001/?key=#{API_KEY}&player_name=#{player_name}&matches_requested=1"
			content = open(site_url).read

			player_data = JSON.parse(content)
			all_player_data[player_name] = player_data
		end

		save_to_db(all_player_data)
		
	end

	def save_to_db (all_player_data)

		all_player_data.each do |player_name, player_data|
			total_games = player_data["result"]["total_results"]
			player = User.find_by_name(player_name)
			player.total_games = total_games
			player.save
		end

	end
end
