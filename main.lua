
math.randomseed(os.time()) -- random initialize
math.random(); math.random(); math.random() -- warming up
iaPlayer = true

-- Funções do jogo
-- Carrega imagens

function randomFirstPlayer()
    currentPlayer = math.random(0,1)
end

function buildTableGame()
    tableGame = {}
    for i = 1,9 do
     
             newP = {
                player = "", 
                isMark = false,
                position = i
            }
        table.insert(tableGame, newP)
    end
end

function mark(position)
    if currentPlayer == 1 then
        tableGame[position].player = "x"
    else
        tableGame[position].player = "o"
    end
end

function getImg(player)
    if player == "x" then
        return xImg
    else
        return oImg
    end 
end

function nextPlayer()
    if iaPlayer then 
        
    else 
        if currentPlayer == 1 then
            currentPlayer = 0
        else
            currentPlayer = 1
        end
    end
end

function globalParameter()
    love.window.setMode(300, 450, {resizable = false})
    love.window.setTitle("Hash Game")
end

function loadImages()
    
    xImg = love.graphics.newImage("images/x.png")
    oImg = love.graphics.newImage("images/o.png")

    tableBack = love.graphics.newImage("images/table.png")

end 

function drawObjects()
    love.graphics.draw(tableBack, 0,0);
    if tableGame[1].isMark then    
        love.graphics.draw(getImg(tableGame[1].player), 15,15);
    end
    if tableGame[2].isMark then
        love.graphics.draw( getImg(tableGame[2].player), 115, 15)
    end
    if tableGame[3].isMark then
        love.graphics.draw(getImg(tableGame[3].player), 215, 15)
    end
end

function logic() 
    if love.mouse.isDown(1) then
        if love.mouse.getX() <= 100 and love.mouse.getY() <= 100 then 
            if tableGame[1].isMark == false then
                tableGame[1].isMark = true
                tableGame[1].position = "P1"
                mark(1)
            end
        end
        if love.mouse.getX() > 100 and love.mouse.getX() <= 200 and love.mouse.getY() <= 100 then
            if tableGame[2].isMark == false then
                tableGame[2].isMark = true
                tableGame[2].position = "P2"
                mark(2)
            end
        end
        if love.mouse.getX() > 200 and love.mouse.getX() <= 300 and love.mouse.getY() <= 100 then
            if tableGame[3].isMark == false then
                tableGame[3].isMark = true
                tableGame[3].position = "P3"
                mark(3)
            end
        end
        nextPlayer()
	end	
end

-- Roda na primeira execução
function love.load()
    globalParameter()
    loadImages()
    buildTableGame()
    randomFirstPlayer()
end

-- Roda frame a frame
function love.update(dt)
    logic()
end

-- Desenha depois da atualização
function love.draw()
    drawObjects()
end

