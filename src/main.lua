-- main.lua
local AI = require("ai")

local player = { x = 400, y = 300, speed = 200 }
local enemy

function love.load()
    enemy = AI.new(100, 100, "follow")  -- Create an enemy with follow behavior
    enemy:setTarget(player)             -- Set the player as the target
end

function love.update(dt)
    -- Update player position based on input
    if love.keyboard.isDown("up") then player.y = player.y - player.speed * dt end
    if love.keyboard.isDown("down") then player.y = player.y + player.speed * dt end
    if love.keyboard.isDown("left") then player.x = player.x - player.speed * dt end
    if love.keyboard.isDown("right") then player.x = player.x + player.speed * dt end

    -- Update enemy
    enemy:update(dt)
end

function love.draw()
    -- Draw player
    love.graphics.setColor(0, 0, 1)
    love.graphics.circle("fill", player.x, player.y, 10)

    -- Draw enemy
    enemy:draw()
end
