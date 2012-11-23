require 'chingu'


class Game < Chingu::Window

	# Constructor
	def initialize
		super
		self.input = {esc: :exit}

		@player = Player.create

	end
end

class Player < Chingu::GameObject

	# meta/constructor
	def setup
		@x, @y = 350, 400
		@image = Gosu::Image["./final_ship.png"]
		self.input = {
			holding_left: :left,
			holding_right: :right,
			holding_up: :up,
			holding_down: :down
			}

		@speed = 10
	end

	def left
		unless @x - 20 <= 0
		@x -= @speed
		end
	end

	def right
		unless @x + 20 >= 800
		@x += @speed
		end
	end

	def up
		unless @y <= 0
			@y -= @speed
		end
	end

	def down
		unless @y >= 600
		@y += @speed
		end	
	end

end

Game.new.show