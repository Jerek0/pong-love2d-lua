pallet = {}

function pallet.load() 
	pallet.x = player.x+player.width+5
	pallet.y = player.y+(player.height/2)
	pallet.velx = 0
	pallet.vely = 0
	pallet.radius = 10
	pallet.launched = false
	pallet.speed = 10
	game.score = 0
end

function pallet.draw() 
	love.graphics.circle('fill', pallet.x, pallet.y, pallet.radius, 20)
end

function pallet.move() 
	pallet.x = player.x+player.width+5
	pallet.y = player.y+(player.height/2)
end

function pallet.physics()
	pallet.x = pallet.x + pallet.velx 
	pallet.y = pallet.y + pallet.vely 
end

function pallet.boundaries()
	if pallet.x < 0 then
		pallet.load()
	end
	if pallet.y < 0 then
		pallet.y = 0
		pallet.vely = -pallet.vely
	end

	if pallet.x > game.width then
		pallet.x = game.width
		pallet.velx = -pallet.velx

		game.score = game.score + 1
		if game.score > game.highscore then
			game.highscore = game.score
		end
	end
	if pallet.y > game.height then
		pallet.y = game.height
		pallet.vely = -pallet.vely
	end
end

function pallet.collisions() 
	box = {} 
	box[1] = { x = player.x , y = player.y} 
	box[2] = { x = player.x + player.width , y = player.y + player.height }

	if BoundingBox(box, pallet.x, pallet.y+5 ) then
		pallet.velx = -pallet.velx
	end
end

function pallet.launch()
	if love.keyboard.isDown(' ') then 
		rand = math.random()*2-1
		pallet.velx = pallet.speed
		pallet.vely = pallet.speed * (rand)
		print(rand)
		pallet.launched = true
	end
end

-- GLOBAL FUNCTIONS
function UPDATE_PALLET()
	if pallet.launched == false then 
		pallet.launch()
		pallet.move()
	else
		pallet.physics()
		pallet.collisions()
		pallet.boundaries()
	end
end

function DRAW_PALLET()
	pallet.draw()
end