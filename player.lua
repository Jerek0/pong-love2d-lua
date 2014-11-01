player = {}

function player.load()
	player.x = 50
	player.y = 50
	player.width = 20
	player.height = 100
	player.health = 100
	player.velx = 0
	player.vely = 0
	player.friction = 0.1
end

function player.draw() 
	love.graphics.rectangle("fill", player.x, player.y, player.width,player.height)
end

function player.move()
	if love.keyboard.isDown('up') then
		player.vely = player.vely - 2
	end
	if love.keyboard.isDown('down') then
		player.vely = player.vely + 2
	end
end

function player.physics() 
	player.x = player.x + player.velx 
	player.velx = player.velx - (player.velx * player.friction)
	player.y = player.y + player.vely
	player.vely = player.vely - (player.vely * player.friction)
end

function player.boundaries() 
	if player.y < 0 then
		player.y = 0
		player.vely = - player.vely
	end
	if player.y+player.height > game.height  then
		player.y = game.height - player.height
		player.vely = - player.vely
	end
end

-- GLOBAL FUNCTIONS
function UPDATE_PLAYER()
	player.move()
	player.boundaries()
	player.physics()
end

function DRAW_PLAYER()
	player.draw()
end