require 'chingu'


class Game < Chingu::Window

	# Constructor
	def initialize
		super 
		self.input = {esc: :exit}
		@background_image = Background.create
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
			holding_down: :down,
			holding_space: :fire
			}

		@speed = 10
		@angle = 0
	end

	def fire
		Laser.create(x: self.x, y: self.y, angle: self.angle)
	end

	def left
		unless @x - 20 <= 0
		@x -= @speed
		@angle -= 4.5
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

	def move
		@y = @y_vel
	end

end


class Background < Chingu::GameObject
	def setup
		@x = 800/2
		@y = 600/2
		@image = Gosu::Image["space.jpg"]
	end
end

class Laser < Chingu::GameObject
	has_traits :velocity
	def setup
		@image = Gosu::Image["shoot.png"]
		self.velocity_y = Gosu::offset_y(@angle, 10)
		self.velocity_x = Gosu::offset_x(@angle, 10)
	end
end

Game.new.show