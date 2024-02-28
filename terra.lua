
local composer = require( "composer" )

local scene = composer.newScene()


local physics = require( "physics" )
physics.start()
physics.setGravity( 0, 0 )


display.setStatusBar( display.HiddenStatusBar )

local terra 
local lua
local playButton
local buttonAnimation
local playButton

terra=display.newImageRect('terra.jpg',2000,2000)
terra.x = display.contentCenterX
terra.y = display.contentCenterY
physics.addBody( terra,"dynamic", {radius=30, density=3.0, friction=0.5, bounce=0.3, isSensor =true } )
terra.myName = "terra"

lua=display.newImageRect('lua.png',500,500)
lua.x=display.contentCenterX
lua.y=display.contentCenterY-500
physics.addBody( lua,"dynamic", {radius=30, density=3.0, friction=0.5, bounce=0.3, isSensor =true } )
lua.myName = "lua"

playButton = display.newText( "Clique na Terra ou na Lua", display.contentCenterX, 1000,"Electrolize-Regular.ttf" , 50 )
transition.blink( playButton,{delay=1000,time=3000} )



local function tapListener( event )
 
    if ( event.numTaps == 2 ) then
        
        
        
        buttonAnimation = display.newText( "Vire a página para prosseguir",display.contentCenterX, display.contentCenterY+200,"Electrolize-Regular.ttf" , 40 )
        transition.blink( playButton,{delay=1000,time=3000} )

       
        transition.to( info, { time=3500, alpha=1.0, delay=0, transition=easing.inOutExpo } )
        transition.from( info, { time=3500, alpha=0.0, delay=0, transition=easing.inOutExpo } )

        transition.to( info2, { time=5500, alpha=1.0, delay=0, transition=easing.inOutExpo } )
        transition.from( info2, { time=5500, alpha=0.0, delay=0, transition=easing.inOutExpo } )

        transition.to( buttonAnimation, { time=9500, alpha=1.0, delay=0, transition=easing.inOutExpo } )
        transition.from( buttonAnimation, { time=7500, alpha=0.0, delay=0, transition=easing.inOutExpo } )
        
        
        
    else
        return true
    end
    
end




local clicks = 0
local lastClickTime = 0
local doubleClickThreshold = 300  -- Threshold em milissegundos para detecção de clique duplo

local function onLuaDoubleTap(event)
    local currentTime = system.getTimer()

    if currentTime - lastClickTime < doubleClickThreshold then
        transition.scaleTo(event.target, { xScale = 1.5, yScale = 1.5, time = 200 }) 
        transition.scaleTo(terra,{xScale = 2.0,yScale = 2.0,time=200})
       
        
       
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









playButton:addEventListener("tap",tapListener)
lua:addEventListener("tap",onLuaDoubleTap)


lua:addEventListener("touch",Lua)

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
