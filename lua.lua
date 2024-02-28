local composer = require( "composer" )

local scene = composer.newScene()


local physics = require( "physics" )
physics.start()
physics.setGravity( 0, 0 )


display.setStatusBar( display.HiddenStatusBar )

local terra 
local lua
local sol
local luaC

-----Criar um grupo aqui para remover tudo quando voltar

lua=display.newImageRect('lua.png',350,350)
lua.x=display.contentCenterX
lua.y=display.contentCenterY-500
physics.addBody( lua,"dynamic", {radius=30, density=3.0, friction=0.5, bounce=0.3, isSensor =true } )
lua.myName = "lua"

sol=display.newImageRect('Sol.png',1000,1000)
sol.x = display.contentCenterX-550
sol.y = display.contentCenterY+380
physics.addBody( sol,"dynamic", {radius=30, density=3.0, friction=0.5, bounce=0.3, isSensor =true } )
sol.myName = "sol"

terra = display.newImageRect('terraCartoon.png',200,200)
terra.x = display.contentCenterX +80
terra.y = display.contentCenterY + 350
physics.addBody(terra,"dynamic",{radius=30, density=3.0, friction=0.5, bounce=0.3, isSensor =true})
terra.myName = 'terra'

luaC = display.newImageRect('luaC.png',50,50)
luaC.x=display.contentCenterX+250
luaC.y=display.contentCenterY+350
physics.addBody(luaC,'dynamic',{radius=30, density=3.0, friction=0.5, bounce=0.3, isSensor =true})

mascara = display.newImageRect('mascara.png',450,450)
mascara.x=display.contentCenterX
mascara.y=display.contentCenterY-500
physics.addBody(mascara,'dynamic',{radius=30, density=3.0, friction=0.5, bounce=0.3, isSensor =true})

local texto = display.newText( "Mova a lua menor em redor da terra\n e entenda com funciona as fases\n lunares.",400, -200, "Electrolize-Regular.ttf", 35 )

local button = display.newText( "Clique 2x aqui para voltar.",400, 1200, "Electrolize-Regular.ttf", 35 )






local function mudarDeCena()
    composer.gotoScene("planetario") 
end


button:addEventListener("tap", mudarDeCena)


local function piscar()
    transition.to(button, {time=1000, alpha=0, onComplete=function()
        transition.to(button, {time=1000, alpha=1})
    end})
end

-- Faz o texto piscar a cada 2 segundos
timer.performWithDelay(2000, piscar, 0)


local function atualizarFaseDaLua()
    local distancia = math.sqrt((luaC.x - sol.x)^2 + (luaC.y - sol.y)^2)
    local distanciaMaxima = 1000 -- Defina a distância máxima do sol para a luaC aqui
    local distanciaMinima = 500 -- Defina a distância mínima do sol para a luaC aqui
    local proporcao = (distanciaMaxima - distancia) / (distanciaMaxima - distanciaMinima)
    
    proporcao = math.max(0, math.min(1, proporcao))
    
    -- Atualiza a posição x da máscara para mover da direita para a esquerda
    mascara.x = display.contentWidth - proporcao * display.contentWidth
    
    local tamanhoMinimo = 000
    local tamanhoMaximo = 1000
  
    lua.x = lua.x
    lua.y = lua.y
end










local function toqueNaLuaC(event)
    local luaC = event.target
    if event.phase == "began" then
        display.getCurrentStage():setFocus(luaC)
        luaC.touchOffsetX = event.x - luaC.x
        luaC.touchOffsetY = event.y - luaC.y
    elseif event.phase == "moved" then
        local novaPosX = event.x - luaC.touchOffsetX
        local novaPosY = event.y - luaC.touchOffsetY
        
       
        local offsetX = novaPosX - terra.x
        local offsetY = novaPosY - terra.y
        local distancia = math.sqrt(offsetX^2 + offsetY^2)
        local angulo = math.atan2(offsetY, offsetX)
        
        
        local distanciaMaxima = 150
        if distancia > distanciaMaxima then
            novaPosX = terra.x + distanciaMaxima * math.cos(angulo)
            novaPosY = terra.y + distanciaMaxima * math.sin(angulo)
        end
        
        luaC.x = novaPosX
        luaC.y = novaPosY

        local distanciaSol = math.sqrt((novaPosX - sol.x)^2 + (novaPosY - sol.y)^2)
        local distanciaMaximaCor = 1000 
        local distanciaMinimaCor = 500 
        local proporcaoCor = (distanciaMaximaCor - distanciaSol) / (distanciaMaximaCor - distanciaMinimaCor)
        
     
        proporcaoCor = math.max(0, math.min(1, proporcaoCor))
        
        luaC:setFillColor(1000, 1000, 1500, proporcaoCor)
    elseif event.phase == "ended" or event.phase == "cancelled" then
        display.getCurrentStage():setFocus(nil)
    end
    return true
end

luaC:addEventListener("touch", toqueNaLuaC)


Runtime:addEventListener("enterFrame", atualizarFaseDaLua)





local clicks = 0
local lastClickTime = 0
local doubleClickThreshold = 300  -- Threshold em milissegundos para detecção de clique duplo

local function onLuaDoubleTap(event)
    local currentTime = system.getTimer()

    if currentTime - lastClickTime < doubleClickThreshold then
        -- Double tap detected
        -- Implemente o zoom aqui
        -- Abra uma nova tela aqui
        print("Double tap detected")
    end

    lastClickTime = currentTime
end

local function Lua(event)
    local lua = event.target
    local phase = event.phase

    if ("began" == phase) then
        display.currentStage:setFocus(lua)
        
        lua.touchOffsetX = event.x - lua.x
        lua.touchOffsetY = event.y - lua.y

    elseif ("moved" == phase) then
        lua.x = event.x - lua.touchOffsetX
        lua.y = event.y - lua.touchOffsetY

        -- Verifica se a Lua atingiu a posição y desejada para começar a ficar avermelhada
        local redPosY = display.contentCenterY-500 + lua.height / 2 -- Define a posição Y onde a Lua deve começar a ficar avermelhada
        if (lua.y >= redPosY) then
            -- Calcula a porcentagem da parte inferior da Lua que está abaixo da posição vermelha
            local percentBelowRed = math.min((lua.y - redPosY) / (lua.height / 2), 1)
            -- Define a intensidade da cor vermelha com base na porcentagem
            local redIntensity = 1 - percentBelowRed
            -- Aplica a cor vermelha na parte inferior da Lua
            lua:setFillColor(1, redIntensity, redIntensity)
        else
            -- Se a Lua estiver acima da posição vermelha, restaura sua cor original
            lua:setFillColor(1, 1, 1)
        end

    elseif ("ended" == phase or "cancelled" == phase) then
        display.currentStage:setFocus(nil)
    elseif ("doubletap" == phase) then
        onLuaDoubleTap(event)
    end

    return true
end











function scene:create( event )

	local sceneGroup = self.view
   
end



function scene:show( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		

	elseif ( phase == "did" ) then


	end
end


function scene:hide( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then


	elseif ( phase == "did" ) then


	end
end



function scene:destroy( event )

	local sceneGroup = self.view
	

end



scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )


return scene
