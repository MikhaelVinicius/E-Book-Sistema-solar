mercurio=display.newImageRect('mercurio.png',100,100)
            mercurio.x = display.contentCenterX-250
            mercurio.y = display.contentCenterY-150
            physics.addBody( mercurio,"dynamic", {radius=30, density=3.0, friction=0.5, bounce=0.3, isSensor =true } )
            mercurio.myName = "mercurio"