require "conf"
require "player"
require "pallet"

function love.load()
   game = {}
   game.height = love.window.getHeight()
   game.width = love.window.getWidth()
   game.scale = love.window.getPixelScale()
   game.font = love.graphics.newFont("font.ttf", 72*game.scale);
   game.fontSmall = love.graphics.newFont("font.ttf", 12*game.scale);
   game.score = 0
   game.highscore = 0

   love.graphics.setColor(0,0,0)
   love.graphics.setBackgroundColor(255,255,255)

   player.load()
   pallet.load()
end

function love.update(dt)
   UPDATE_PLAYER()
   UPDATE_PALLET()
end

function love.draw()
	love.graphics.push()
	love.graphics.scale(game.scale,game.scale)
	love.graphics.setColor(0,0,0)
	love.graphics.setFont(game.font)
    DRAW_PLAYER()
    DRAW_PALLET()
    love.graphics.pop()

	love.graphics.push()
    love.graphics.scale(1, 1)
    love.graphics.printf(game.score, 0, 50*game.scale, game.width*game.scale, "center")
    love.graphics.setColor(200,200,200)
    love.graphics.setFont(game.fontSmall)
    love.graphics.printf("HIGH SCORE : "..game.highscore, 0, 150*game.scale, game.width*game.scale, "center")
    love.graphics.pop()
end

-- USEFULL
function BoundingBox(box, tx, ty)
    return  (box[2].x >= tx and box[2].y >= ty)
        and (box[1].x <= tx and box[1].y <= ty)
        or  (box[1].x >= tx and box[2].y >= ty)
        and (box[2].x <= tx and box[1].y <= ty)
end