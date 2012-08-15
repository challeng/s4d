include UsersHelper

class PagesController < ApplicationController
	def home
		@sorted_game_count = UsersHelper.sorted_game_count
	end
end
