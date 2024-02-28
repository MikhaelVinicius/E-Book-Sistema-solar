
local composer = require( "composer" )
local scene = composer.newScene()

local physics = require( "physics" )
physics.start()
physics.setGravity( 0, 0 )


display.setStatusBar( display.HiddenStatusBar )
local buttonAnimation
local background

local playButton
local backGroup = display.newGroup()  
local mainGroup = display.newGroup() 
local uiGroup = display.newGroup()
local background, pageText, continueText, pageTween, fadeTween1, fadeTween2, sunObj, moonObj, coronaIcon





local function tapListener( event )
 
    if ( event.numTaps == 2 ) then
        
        uiGroup:removeSelf()
        local info = display.newText( "4,5 bilhões de anos atrás...",display.contentCenterX-30, -130,"Electrolize-Regular.ttf" , 50 )
        local info2 = display.newText( " No nosso caótico sistema solar \n primitivo, partículas e moléculas\n começarama se chocar umas\n com as outras formando\n amontoados maiores.",display.contentCenterX+70, 1200,"Electrolize-Regular.ttf" , 40 )
        
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

 



local function gameLoop()

    
    angle = background.rotation

    if background.angularVelocity == 0 and angle ~= startingAngle then

        local wedge = math.floor(((angle + 45) % 360) /45) + 1

       

        startingAngle = angle

        if movementEnded then timer.performWithDelay(1000,playRound); end

    end

end


local function spinObject(event)

    local t = event.target

    local phase = event.phase
    transition.to( background, { rotation=70000, time=7000000 } )

    
    if (phase == "began") then
       

            display.getCurrentStage():setFocus( t )

            t.isFocus = true

       

            t.x1 = event.x

            t.y1 = event.y

    elseif t.isFocus then

            if (phase == "moved") then

                    t.x2 = event.x

                    t.y2 = event.y

                    local angle1 = 180/math.pi * math.atan2(t.y1 - t.y , t.x1 - t.x)

                    local angle2 = 180/math.pi * math.atan2(t.y2 - t.y , t.x2 - t.x)

                    local rotationAmt = angle1 - angle2

                    t.rotation = t.rotation - rotationAmt

                    t.x1 = t.x2

                    t.y1 = t.y2

                    

            elseif (phase == "ended") or (phase == "cancelled") then

                display.getCurrentStage():setFocus( nil )

                t.isFocus = false

            end

    end

    

   

    return true

end


local function nextPage(event)
    local testando = display.newText( "Toque 2x para iniciar", display.contentCenterX, 1000,"Electrolize-Regular.ttf" , 40 )
   -- physics.pause()
   -- composer.removeScene("capa")

   local function nextPage( event )
 
    local page = event.target
    local phase = event.phase
 
    if ( "began" == phase ) then
        -- Set touch focus on the ship
        display.currentStage:setFocus( page )
        -- Store initial offset position
        page.touchOffsetX = event.x - page.x
 
    elseif ( "moved" == phase ) then
        -- Move the ship to the new touch position
        page.x = event.x - page.touchOffsetX
    elseif(page.x <100) then
        composer.gotoScene("introduction"); 
 
    elseif ( "ended" == phase or "cancelled" == phase ) then
        -- Release touch focus on the ship
        display.currentStage:setFocus( nil )
    end
 
    return true  -- Prevents touch propagation to underlying objects
end
end








function scene:create( event )

	local sceneGroup = self.view
	physics.pause()  
     backGroup = display.newGroup()  
     mainGroup = display.newGroup() 
     uiGroup = display.newGroup()
 background=display.newImageRect(backGroup,'capaBackGround.png',2000,2000)
background.x = display.contentCenterX
background.y = display.contentCenterY
local title =  display.newText( uiGroup, "A origem do nosso lar",400, 900, "Electrolize-Regular.ttf", 60 )

    local autoria = display.newText(uiGroup,"Mikhael Vincius", 500,1200,"Electrolize-Regular.ttf",40);   
    local ano =  display.newText(uiGroup,"2024", 580,1250,"Electrolize-Regular.ttf",40);
    
     playButton = display.newText( uiGroup, "Toque 2x para iniciar", display.contentCenterX, 1000,"Electrolize-Regular.ttf" , 40 )
    
    background:addEventListener("touch", spinObject)
   


Runtime:addEventListener("enterFrame", gameLoop)



end



function scene:show( event )

	local sceneGroup = self.view
	local phase = event.phase
    transition.to( background, { rotation=10000, time=7000000 } )
  
transition.blink( playButton,{delay=1000,time=3000} )
   

	if ( phase == "will" ) then
		

	elseif ( phase == "did" ) then
        physics.start()
        physics.addBody( background, "dynamic", {bounce=0, friction=0.2, radius=1} )
       
        playButton:addEventListener("tap",tapListener)
        
        
       

		
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




-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------

return scene
