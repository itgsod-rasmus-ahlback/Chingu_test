require 'chingu'


class Game < Chingu::Window

	# Constructor
	def initialize
		super
		@caption = "lol"
		self.input = {esc: :exit}
		@player = Player.create
	end
end

class Player < Chingu::GameObject

	# meta/constructor
	def setup
		@x, @y = 350, 400
		@image = Gosu::Image["./final_ship.png"]
	end
end

Game.new.show