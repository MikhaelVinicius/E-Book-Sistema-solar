
local composer = require( "composer" )

local scene = composer.newScene()


local physics = require( "physics" )
physics.start()
physics.setGravity( 0, 0 )


display.setStatusBar( display.HiddenStatusBar )


local stage1
local stage2
local stage3

local playButton
local backGroup = display.newGroup()  
local mainGroup = display.newGroup() 
local uiGroup = display.newGroup()




 



local function gameLoop()

    
    angle = stage1.rotation

    if stage1.angularVelocity == 0 and angle ~= startingAngle then

        local wedge = math.floor(((angle + 45) % 360) /45) + 1

       

        startingAngle = angle

        if movementEnded then timer.performWithDelay(1000,playRound); end

    end

end


local function spinObject(event)

    local t = event.target

    local phase = event.phase
    transition.to( stage1, { rotation=70000, time=7000000 } )

    
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


local function tapListenerStage2( event )
 
    if ( event.numTaps == 2 ) then
        
        uiGroup:removeSelf()
       

        stage2 = display.newImageRect(backGroup,"introductionStage2.png",2000,2000)
        stage2.x = display.contentCenterX
        stage2.y = display.contentCenterY
        
        transition.to( stage1, { time=8500, alpha=1.0, delay=0, transition=easing.inOutExpo } )
        transition.from( stage2, { time=8500, alpha=0.0, delay=0, transition=easing.inOutExpo } )
     --   stage3 =display.newImageRect( "introductionFinal.png",2000,2000 )
      --  transition.to( stage2, { time=8500, alpha=1.0, delay=0, transition=easing.inOutExpo } )
      --  transition.from( stage3, { time=8500, alpha=0.0, delay=0, transition=easing.inOutExpo } )
        local info2 = display.newText("Assim nasceu a nossa estrela... o Sol.",400, 1100, "Electrolize-Regular.ttf", 40)
        transition.to( info2, { time=12000, alpha=1.0, delay=0, transition=easing.inOutExpo } )
        transition.from( info2, { time=1200, alpha=0.0, delay=0, transition=easing.inOutExpo } )
        stage2:addEventListener("touch", spinObject)
        transition.to( stage2, { rotation=10000, time=7000000 } )
        
        local play2 = display.newText("Vire a página",400, 1200, "Electrolize-Regular.ttf", 30)

        
    else
        return true
    end
    
end














function scene:create( event )

	local sceneGroup = self.view

    physics.pause()  
     backGroup = display.newGroup()  
     mainGroup = display.newGroup() 
     uiGroup = display.newGroup()
 stage1=display.newImageRect(backGroup,'introductionStage1.png',2000,2000)
stage1.x = display.contentCenterX
stage1.y = display.contentCenterY
local info =  display.newText( uiGroup, "99.98% de toda essa matéria se juntou\n em um único grande aglomerado no\n meio do sistema solar.",400, 1100, "Electrolize-Regular.ttf", 40 )
    transition.to( info, { time=5500, alpha=1.0, delay=0, transition=easing.inOutExpo } )
    transition.from( info, { time=5500, alpha=0.0, delay=0, transition=easing.inOutExpo } )
    
    stage1:addEventListener("touch", spinObject)
    local nextButton =  display.newText( uiGroup, "Pressione a tela 2x",400, 1300, "Electrolize-Regular.ttf", 30 )
    transition.to( nextButton, { time=9500, alpha=1.0, delay=0, transition=easing.inOutExpo } )
    transition.from( nextButton, { time=9500, alpha=0.0, delay=0, transition=easing.inOutExpo } )

Runtime:addEventListener("enterFrame", gameLoop)
nextButton:addEventListener("tap",tapListenerStage2)	

end



function scene:show( event )

	local sceneGroup = self.view
	local phase = event.phase
    transition.to( stage1, { rotation=10000, time=7000000 } )
    
  


	if ( phase == "will" ) then


	elseif ( phase == "did" ) then
        physics.start()
        physics.addBody( stage1, "dynamic", {bounce=0, friction=0.2, radius=1} )
       
        
       
   
	

	end
end



function scene:hide( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		

	elseif ( phase == "did" ) then
	

	end
end


-- destroy()
function scene:destroy( event )

	local sceneGroup = self.view


end


scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )


return scene
