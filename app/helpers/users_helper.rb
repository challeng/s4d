require 'open-uri'

module UsersHelper

  def sorted_game_count
  	users = User.all
  	sorted_game_count = {}

  	users.each do |user|
  		sorted_game_count[user.name] = user.total_games
  	end

  	sorted_games = sorted_game_count.sort_by {|k,v| v.to_i}
  	sorted_games.reverse



  end



end
