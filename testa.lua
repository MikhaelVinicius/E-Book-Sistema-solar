
local composer = require( "composer" )

local scene = composer.newScene()


local physics = require( "physics" )
physics.start()
physics.setGravity( 0, 0 )


display.setStatusBar( display.HiddenStatusBar )

local mercurio
local venus
local terra
local marte 
local jupiter 
local saturno 
local urano 
local netuno 
local sol 
local mira
local miraLoading
local background
local astro


local backGroup = display.newGroup()  
local mainGroup = display.newGroup() 
local uiGroup = display.newGroup()





background=display.newImageRect(backGroup,'planetarioBackground.png',2000,2000)
background.x = display.contentCenterX
background.y = display.contentCenterY
physics.addBody( background,"dynamic", {radius=30, density=3.0, friction=0.5, bounce=0.3, isSensor =true } )
background.myName = "background"


  
    local function uranoInfo()
        mercurio=display.newImageRect('mercurio.png',100,100)
    mercurio.x = display.contentCenterX-250
    mercurio.y = display.contentCenterY-150
    local texto = display.newText(  "MERCÚRIO\n O menor e mais próximo planeta do sol.\n Apesar de sua distância pequena do\n astro rei, ele não é o planeta mais quente.\n Mercúrio não tem uma atmosfera como a dos\n outros planetas, fazendo com que qualquer\n calor emitido sobre ele escape para\n o espaço. Durante sua formação, um\n mini planeta provavelmente o  atingiu,\n arremessando sua própria crosta para\n fora de sua força gravitacional.\n O reduzindo a somente seu núcleo..",400, 900, "Electrolize-Regular.ttf", 35 )
        local textoInfo = display.newText(  "Nome: Mercúrio\n Duração/Dia: 2 meses\n Duração/Ano: 87 dias terrestres\n Tamanho: 2,5x menor que a Terra\n Comp./Química: Potássio, sódio, oxigênio.",400, 15, "Electrolize-Regular.ttf", 35 )
end


function scene:create( event )

	local sceneGroup = self.view
    
  
 
 





end



function scene:show( event )

	local sceneGroup = self.view
	local phase = event.phase
    transition.to( background, { rotation=1000, time=7000000 } )
     uranoInfo()

  


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









