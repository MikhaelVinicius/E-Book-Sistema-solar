
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

sol=display.newImageRect(mainGroup,'Sol.png',300,300)
sol.x = display.contentCenterX
sol.y = display.contentCenterY
physics.addBody( sol,"dynamic", {radius=30, density=3.0, friction=0.5, bounce=0.3, isSensor =true } )
sol.myName = "sol"


terra=display.newImageRect(mainGroup,'terraCartoon.png',100,100)
terra.x = display.contentCenterX+350
terra.y = display.contentCenterY-400
physics.addBody( terra,"dynamic", {radius=30, density=3.0, friction=0.5, bounce=0.3, isSensor =true } )
terra.myName = "terra"



venus=display.newImageRect(mainGroup,'venus.png',100,100)
venus.x = display.contentCenterX+250
venus.y = display.contentCenterY-200
physics.addBody( venus,"dynamic", {radius=30, density=3.0, friction=0.5, bounce=0.3, isSensor =true } )
venus.myName = "venus"


marte=display.newImageRect(mainGroup,'marte.png',100,100)
marte.x = display.contentCenterX+100
marte.y = display.contentCenterY-550
physics.addBody( marte,"dynamic", {radius=30, density=3.0, friction=0.5, bounce=0.3, isSensor =true } )
marte.myName = "marte"

jupiter=display.newImageRect(mainGroup,'jupiter.png',150,150)
jupiter.x = display.contentCenterX+250
jupiter.y = display.contentCenterY+250
physics.addBody( jupiter,"dynamic", {radius=30, density=3.0, friction=0.5, bounce=0.3, isSensor =true } )
jupiter.myName = "jupiter"

saturno=display.newImageRect(mainGroup,'saturno.png',140,140)
saturno.x = display.contentCenterX-250
saturno.y = display.contentCenterY+250
physics.addBody( saturno,"dynamic", {radius=30, density=3.0, friction=0.5, bounce=0.3, isSensor =true } )
saturno.myName = "saturno"

urano=display.newImageRect(mainGroup,'urano.png',130,130)
urano.x = display.contentCenterX-150
urano.y = display.contentCenterY+450
physics.addBody( urano,"dynamic", {radius=30, density=3.0, friction=0.5, bounce=0.3, isSensor =true } )
urano.myName = "urano"

netuno=display.newImageRect(mainGroup,'netuno.png',130,130)
netuno.x = display.contentCenterX+200
netuno.y = display.contentCenterY+550
physics.addBody( netuno,"dynamic", {radius=30, density=3.0, friction=0.5, bounce=0.3, isSensor =true } )
netuno.myName = "netuno"

mercurio=display.newImageRect(mainGroup,'mercurio.png',100,100)
mercurio.x = display.contentCenterX-250
mercurio.y = display.contentCenterY-150
physics.addBody(mercurio, "static", {radius=50, isSensor=true})
mercurio.myName = "mercurio"



mira=display.newImageRect('miraLoading.png',210,210)
mira.x = display.contentCenterX
mira.y = display.contentCenterY+700
physics.addBody( mira,"dynamic", {radius=30, density=3.0, friction=0.5, bounce=0.3 , isSensor=true } )
mira.myName = "mira"












local texto = display.newText( uiGroup, "Use a mira telescópica para obter informações\n sobre o astro.",400, -200, "Electrolize-Regular.ttf", 35 )











local function miraLoading()
    
    
     transition.to( mira, { rotation=1000, time=3000} )
     
     

end


local function terraInfo()
    display.remove( mainGroup )
    display.remove(uiGroup)
    display.remove(backGroup)
   composer.gotoScene("lua")
end


 local function mercurioInfo()
   
    display.remove( mainGroup )
    display.remove(uiGroup)
    miraLoading()
    mercurio=display.newImageRect('mercurio.png',100,100)
    mercurio.x = display.contentCenterX-250
    mercurio.y = display.contentCenterY-150
    local texto = display.newText(  "MERCÚRIO\n O menor e mais próximo planeta do sol.\n Apesar de sua distância pequena do\n astro rei, ele não é o planeta mais quente.\n Mercúrio não tem uma atmosfera como a dos\n outros planetas, fazendo com que qualquer\n calor emitido sobre ele escape para\n o espaço. Durante sua formação, um\n mini planeta provavelmente o  atingiu,\n arremessando sua própria crosta para\n fora de sua força gravitacional.\n O reduzindo a somente seu núcleo..",400, 900, "Electrolize-Regular.ttf", 35 )
        local textoInfo = display.newText(  "Nome: Mercúrio\n Duração/Dia: 2 meses\n Duração/Ano: 87 dias terrestres\n Tamanho: 2,5x menor que a Terra\n Comp./Química: Potássio, sódio, oxigênio.",400, 15, "Electrolize-Regular.ttf", 35 )
        
end


local function venusInfo()
    display.remove( mainGroup )
    display.remove(uiGroup)
    miraLoading()
    venus =display.newImageRect('venus.png',100,100)
    venus.x = display.contentCenterX+250
venus.y = display.contentCenterY-200
    local texto = display.newText(  "O planeta irmão da Terra, Vênus\n possui um tamanho e geologia bastante\n similar ao nosso. Se difere em pouca coisa,\n como por exemplo ser um planeta\n escaldante com temperaturas infernais.\n Vênus, apesar de ser o segundo planeta mais\n perto do Sol, é o planeta mais quente do\n sistema solar. Atingindo facilmente 400° C\n e sendo capaz de derreter chumbo em\n um dia frio. O planeta é assim por\n causa da densa atmosfera do planeta\n que gera um efeito estufa que impede\n que o calor escape para o espaço.\n Vênus se formou da mesma \nmaneira que os outros planetas\n rochosos. Atraindo tudo até não haver mais\n nada em seu campo gravitacional.\n Outra curiosidade é que um dia no planeta\n dura mais que um ano.",400, 900, "Electrolize-Regular.ttf", 35 )
        local textoInfo = display.newText(  "Nome: Vênus\n Duração/Dia: 240 dias\n Duração/Ano: 225 dias\n Tamanho: Igual ao tamanho da Terra\n Comp./Química: Dióxido de carbono,\n nitrogênio e dióxido de enxofre.",350, 50, "Electrolize-Regular.ttf", 35 )
end





local function marteInfo()
    display.remove( mainGroup )
    display.remove(uiGroup)
    miraLoading()
    marte  =display.newImageRect('marte.png',100,100)
    marte.x = display.contentCenterX+100
    marte.y = display.contentCenterY-550
    local texto = display.newText(  " MARTE\n O planeta vermelho é o melhor candidato\n até agora para a extensão da\n civilização humana, o próximo lugar que\n talvez possamos chamar um dia de lar.\n Marte é um planeta rochoso bastante\n similar a terra, e acredita-se que a bilhões\n de anos marte era parecido com a Terra\n em questão de ambiente, com oceanos,\n vales, rios e geleiras. Algo\n aconteceu com a estabilidade do núcleo\n de marte que desligou de campo magnético\n que o protege das tempestades solares,\n transformando no que um dia foi\n um planeta cheio de diversidade climática,\n a um deserto árido. Marte se formou assim como os outros\n planetas pelo acúmulo de detritos\n puxado pela sua gravidade.",500, 800, "Electrolize-Regular.ttf", 35 )
        local textoInfo = display.newText(  " Nome: Marte\n Duração/Dia: 23 HS\n Duração/Ano: 2 anos\n Tamanho: 1,5x menor que a Terra\n Comp./Química: Dióxido de carbono,\n nitrogênio e argônio.",320, 200, "Electrolize-Regular.ttf", 35 )
end




local function jupiterInfo()
    display.remove( mainGroup )
    display.remove(uiGroup)
    miraLoading()
    jupiter  =display.newImageRect('jupiter.png',150,150)
    jupiter.x = display.contentCenterX+250
    jupiter.y = display.contentCenterY+250
    local texto = display.newText(  "JÚPITER\n O maior planeta do nosso sistema,\n júpiter com sua imponência proteja\n a terra atraindo a maioria dos asteroides\n soltos no espaço para ele. Muitos\n não fazem ideia mas pode-se\n dizer que Júpiter é uma estrela que deu errado.\n Um núcleo com massa 10x maior que\n a da terra puxou tudo que o circundava,\n chegando a competir com o poder do nosso\n jovem sol na época. 10 milhões\n de anos após seu nascimento, ele\n perdeu a luta após seu núcleo se estabilizar.\n Ficando em segundo lugar de influência\n no nosso lar. Perdendo somente\n para o Sol.",400, 200, "Electrolize-Regular.ttf", 35 )
        local textoInfo = display.newText(  " Nome: Urano\n Duração/Dia: 17 HS\n Duração/Ano: 84 anos\n Tamanho: 16x o tamanho da Terra\n Comp./Química: Hidrogênio, Hélio, Metano.",400, 1000, "Electrolize-Regular.ttf", 35 )
end



local function saturnoInfo()
    display.remove( mainGroup )
    display.remove(uiGroup)
    miraLoading()
    saturno  =display.newImageRect('saturno.png',140,140)
        saturno.x = display.contentCenterX-250
    saturno.y = display.contentCenterY+250
        local texto = display.newText(  " SATURNO\n Considerado o planeta mais majestoso\n do nosso sistema solar. Saturno\n com seus anéis de gelo é o segundo\n maior planeta seguido por Júpiter,\n cujo sua composição é semelhante.\n Assim como os outros planetas gasosos,\n núcleo embrionário de Saturno puxou tudo\n ao seu redor até nõ restar mais nada.\n Seus icónicos anéis surgiram após a colossal\n gravidade do planeta destroçar um corpo\n celeste ou vários corpos celestes que \ntiveram a infelicidade de cruzar o caminho\n de Saturno.\n",390, 200, "Electrolize-Regular.ttf", 35 )
            local textoInfo = display.newText(  " Nome: Saturno\n Duração/Dia: 11 HS\n Duração/Ano: 30 anos\n Tamanho: 95x o tamanho da Terra\n Comp./Química: Hidrogênio, Hélio, Metano.",390, 1000, "Electrolize-Regular.ttf", 35 )
    end





local function uranoInfo()
    display.remove( mainGroup )
    display.remove(uiGroup)
    miraLoading()
    
    urano  =display.newImageRect('urano.png',140,140)
    urano.x = display.contentCenterX-150
    urano.y = display.contentCenterY+450
    local texto = display.newText(  " URANO\n Urano é extremamente parecido em\n composição com o parente azulado Netuno.\n Entretanto, Urano se destaca com um \natributo que não é encontrado em nenhum\n outro planeta em nosso sistema.\n Sua rotação é inclinada para o lado, ou seja,\n é como se o sol nascesse primeiramente\n no norte do Brasil e pusesse no sul, ao\n invés de leste para oeste. Conforme\n a gravidade do embrião de Urano\n, puxava os gases da caótica nebulosa\n que gerou o sol, o planeta crescia\n cada vez mais até não haver\n mais nada dentro do alcance\n de sua força gravitacional.",400, 80, "Electrolize-Regular.ttf", 35 )
        local textoInfo = display.newText(  " Nome: Urano\n Duração/Dia: 17 HS\n Duração/Ano: 84 anos\n Tamanho: 16x o tamanho da Terra\n Comp./Química: Hidrogênio, Hélio, Metano.",390, 1200, "Electrolize-Regular.ttf", 35 )
end





local function netunoInfo()
    display.remove( mainGroup )
    display.remove(uiGroup)
    miraLoading()
    netuno  =display.newImageRect('netuno.png',140,140)
    netuno.x = display.contentCenterX+200
netuno.y = display.contentCenterY+550
    local texto = display.newText(  " NETUNO\n O oitavo e último planeta do sistema solar,\n surgiu a parti da colisão de inúmeros\n outros planetas que também já estavam\n nascendo. Esses planetas em formação,\n chamados de protoplanetas, se fundiram\n em um núcleo de gelo e rocha que\n posteriormente teve força gravitacional\n suficiente para puxar os gases ao seu redor\n e manter uma atmosfera.",390, -50, "Electrolize-Regular.ttf", 35 )
        local textoInfo = display.newText(  " Nome: Netuno\n Duração/Dia: 16 hs\n Duração/Ano: 165 anos\n terrestres\n Tamanho: 16x a Terra\n Comp./Química: Metano, hélio\n e hidrogénio",270, 1180, "Electrolize-Regular.ttf", 32 )
        
        

end


local function moverMira( event )
    local mira = event.target
    local phase = event.phase

    if ( "began" == phase ) then
        display.currentStage:setFocus( mira )
        mira.touchOffsetX = event.x - mira.x
        mira.touchOffsetY = event.y - mira.y
    elseif ( "moved" == phase ) then
        mira.x = event.x - mira.touchOffsetX
        mira.y = event.y - mira.touchOffsetY
    elseif ( "ended" == phase or "cancelled" == phase ) then
        display.currentStage:setFocus( nil )
        if estavaEmContato then
            composer.gotoScene("planetario", { effect="fade", time=500 })
            estavaEmContato = false
        end
    end

    return true 
end

 

local estavaEmContato = false

local function onCollision( event )
   
 
    if ( event.phase == "began" ) then
 
        local obj1 = event.object1
        local obj2 = event.object2

        if ( ( obj1.myName == "mercurio" and obj2.myName == "mira" ) or
             ( obj1.myName == "mira" and obj2.myName == "mercurio" ) )
        then 
            estavaEmContato = true
            mercurioInfo()
            
        elseif ( ( obj1.myName == "venus" and obj2.myName == "mira" ) or
        ( obj1.myName == "mira" and obj2.myName == "venus" ) )
        then 
            estavaEmContato = true
            venusInfo()
        elseif ( ( obj1.myName == "marte" and obj2.myName == "mira" ) or
        ( obj1.myName == "mira" and obj2.myName == "marte" ) )
        then 
            estavaEmContato = true
            marteInfo()
        elseif ( ( obj1.myName == "jupiter" and obj2.myName == "mira" ) or
        ( obj1.myName == "mira" and obj2.myName == "jupiter" ) )
        then 
            estavaEmContato = true
            jupiterInfo()
        elseif ( ( obj1.myName == "saturno" and obj2.myName == "mira" ) or
        ( obj1.myName == "mira" and obj2.myName == "saturno" ) )
        then 
            estavaEmContato = true
            saturnoInfo()
        elseif ( ( obj1.myName == "urano" and obj2.myName == "mira" ) or
        ( obj1.myName == "mira" and obj2.myName == "urano" ) )
        then 
            estavaEmContato = true
            uranoInfo()
        elseif ( ( obj1.myName == "terra" and obj2.myName == "mira" ) or
        ( obj1.myName == "mira" and obj2.myName == "terra" ) )
        then 
            estavaEmContato = true
            terraInfo()    
        elseif ( ( obj1.myName == "netuno" and obj2.myName == "mira" ) or
        ( obj1.myName == "mira" and obj2.myName == "netuno" ) )
        then 
            estavaEmContato = true
            netunoInfo()
        end
    elseif ( event.phase == "ended" ) then
        if estavaEmContato then
            estavaEmContato = false
            composer.gotoScene("planetario", { effect="fade", time=500 })
        end  
                
    end
end
    














mira:addEventListener( "touch", moverMira )
Runtime:addEventListener( "collision", onCollision )








function scene:create( event )

	local sceneGroup = self.view
    
  
 
 





end



function scene:show( event )

	local sceneGroup = self.view
	local phase = event.phase
    transition.to( background, { rotation=1000, time=7000000 } )
   

  


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









