require("colli")

local bullets = {}
local p = {}

function love.load()
	p.x = 400
	p.y = 300

	for i = 1, 10 do
		createBullet(math.random(1, 800), math.random(1, 600))
	end

end

function createBullet(x, y)
	local b = {}
	b.x = x
	b.y = y
	b.radius = 15
	b.s = 1
	table.insert(bullets, b)
end

function love.update(dt)
	p.x = love.mouse.getX()
	p.y = love.mouse.getY()
	for i = 1, #bullets do
		check(bullets[i], p, bullets, i)
	end
end

function love.draw()
	for i = 1, #bullets do
		love.graphics.circle("line", bullets[i].x, bullets[i].y, bullets[i].radius)
	end
end