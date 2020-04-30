--[[**************************************************************************************
--gameSetup.lua     Creates messeges and feedback for user
**************************************************************************************--]]

local gameSetup = {
    
    startButton = nil,
    startBackground = nil,

    mainBackground = nil,
    newAttributeButton = nil,
    shapeSet1 = nil,
    startMenuObjects = display.newGroup(),
    backgroundObjects = display.newGroup(),
    currentObjects = display.newGroup(),   
    level1Objects = display.newGroup(),
    level2Objects = display.newGroup(),
    levelselectobjects = display.newGroup(),
    levelselectobjects2 = display.newGroup()
}
 
    --Function to display start menu
    local lib =  "C:\\Users\\matthewmartinez\\Desktop\\TangramsNewest\\lib\\"

    package.path = lib .. "?.lua;" .. package.path
   
  
     numRight = 0;
     numRightlevel2 = 0;

    local correctSnd = audio.loadSound('Correct-answer.mp3')
    local winnersound = audio.loadSound('winningsound.mp3')
    local buttonsnd = audio.loadSound('buttonsound2.mp3')




    
      recttester = display.newRect(80,575,39.5,163)
            recttester.x = display.contentCenterX - .5
            recttester.y = 300
            recttester.alpha = 0


      circletest = display.newCircle(50, 475, 60)
            circletest.x = display.contentCenterX
            circletest.y = 165
            circletest.alpha = 0
   

    






        

    local leftX = 0.15 * display.contentWidth
    local centerX = 0.5 * display.contentWidth
    local rightX = 0.85 * display.contentWidth
    local topY = 0.10 * display.contentHeight
    local centerY = 0.5 * display.contentHeight
    local bottomY = 0.90 * display.contentHeight
    ------------------------------------------------------
    --Start Menu Functions
    function gameSetup.createStartBackground()
        backgroundinitial = display.newImageRect( "newgrassbackground copy.jpg", 730 , 700 )
        backgroundinitial.x = display.contentCenterX
        backgroundinitial.y = display.contentCenterY
        gameSetup.currentObjects:insert( backgroundinitial )



        


        


    end

   


    function gameSetup.createStartButton()
         myText = display.newText( "Fun with Tangrams!", 160, 35, "comics", 30 );
         button = display.newImageRect( "start copy.png", 100, 50 )
        button.x = display.contentCenterX
        button.y = display.contentCenterY
        gameSetup.currentObjects:insert( button )
        gameSetup.currentObjects:insert( myText )
        button:addEventListener( "tap", gameSetup.levelSelect )
    end






    function gameSetup.levelSelect( event )
    background = display.newImageRect("newgrassbackground copy.jpg", 730, 700)
    background.x = display.contentCenterX;
    background.y = display.contentCenterY;
    gameSetup.levelselectobjects:insert(background)

     leveltext = display.newText( "Level Select", 160, 35, "comics", 30 );

    gameSetup.levelselectobjects:insert(leveltext);
     level1button = display.newImageRect("level1.png", 110, 35)
     level2button = display.newImageRect("level2.png", 110, 35)
    level1button.x = display.contentCenterX - 100;
    level1button.y = display.contentCenterY;
    level1button:addEventListener("tap", gameSetup.startGame, gameSetup.removeall);
    gameSetup.levelselectobjects:insert(level1button);





    
    level2button.x = display.contentCenterX + 100;
    level2button.y = display.contentCenterY;
    level2button:addEventListener("tap", gameSetup.startGame2, gameSetup.removeall);
    gameSetup.levelselectobjects:insert(level2button);

    end




    function gameSetup.removeall()


         for i = 0, 8 do

         display.remove(background);    
         display.remove(background);
         display.remove( leveltext ); 
         display.remove(level1button);
         display.remove(level2button);       
         display.remove( gameSetup.levelselectobjects[ 0 ]);
         display.remove( gameSetup.levelselectobjects[ 1 ]);
         display.remove( gameSetup.levelselectobjects[ 2 ]);
         display.remove( gameSetup.levelselectobjects[ 3 ]);

        end


    end






    function gameSetup.startGame( event )

      display.remove(triangletester)

      recttester = display.newRect(80,575,39.5,163)
            recttester.x = display.contentCenterX - .5
            recttester.y = 300
            recttester.alpha = 0


      circletest = display.newCircle(50, 475, 60)
            circletest.x = display.contentCenterX
            circletest.y = 165
            circletest.alpha = 0
 

    
       
       

        audio.play(buttonsnd)
        button = event.target

        display.remove(level1button)
        display.remove(level2button)
        display.remove( button )
        display.remove ( background )
        display.remove(leveltext)
        
        print("Number of objects : " .. gameSetup.currentObjects.numChildren )

        for i=1, gameSetup.currentObjects.numChildren do 
            display.remove( gameSetup.currentObjects[ 1 ])
            
        end
        gameSetup.gameBackground()

         box = display.newImageRect("newshapebank.png", 3500, 1200)
        box:scale(.115, .20)
        box.x = 173
        box.y = 525

        local myText3 = display.newText( "Level 1!", 160, -10, "comics", 20 );
         myText2 = display.newText( "Fill in the Tree with shapes!", 160, 11, "comics", 20 );
        gameSetup.level1Objects:insert( myText2 )
        gameSetup.level1Objects:insert( myText3 )

        backbutton = display.newImageRect( "BACK.png", 110, 35 )
       backbutton.x = 40
       backbutton.y = 50
       backbutton:addEventListener("tap", gameSetup.masterErase)




        gameSetup.createNewAttributeButton()

        
    end

      
    
    function gameSetup.createNewAttributeButton()
        
         attributeButton2 = display.newImageRect( "createrectangle.png", 110, 35 )
        attributeButton2.x = 160
        attributeButton2.y = 520
       -- gameSetup.level1Objects:insert(attributeButton2)
         attributeButton = display.newImageRect( "createcircle.png", 110, 35 )
        attributeButton.x = 50
        attributeButton.y = 520
      --  gameSetup.level1Objects:insert(attributeButton)
         attributeButton3 = display.newImageRect( "createtriangle.png", 110, 35 )
        attributeButton3.x = 270
        attributeButton3.y = 520
      --  gameSetup.level1Objects:insert(attributeButton3)
        attributeButton4 = display.newImageRect( "createsquare.png", 110, 35 )
        attributeButton4.x = 160
        attributeButton4.y = 560
       -- gameSetup.backgroundObjects:insert( attributeButton )
       attributeButton:addEventListener( "tap", gameSetup.createObjectSet1)
        attributeButton2:addEventListener("tap", gameSetup.createObjectSet2)
        attributeButton3:addEventListener("tap", gameSetup.createObjectSet3)
        
        
    end    


     function gameSetup.createNewAttributeButton2()



        display.remove(attributeButton)
        display.remove(attributeButton2)
        display.remove(attributeButton3)

        
         attributeButton20 = display.newImageRect( "createrectangle.png", 110, 35 )
        attributeButton20.x = 160
        attributeButton20.y = 520
       -- gameSetup.level1Objects:insert(attributeButton2)
         attributeButton10 = display.newImageRect( "createcircle.png", 110, 35 )
        attributeButton10.x = 50
        attributeButton10.y = 520
      --  gameSetup.level1Objects:insert(attributeButton)
         attributeButton30 = display.newImageRect( "createtriangle.png", 110, 35 )
        attributeButton30.x = 270
        attributeButton30.y = 520
      --  gameSetup.level1Objects:insert(attributeButton3)
        attributeButton40 = display.newImageRect( "createsquare.png", 110, 35 )
        attributeButton40.x = 160
        attributeButton40.y = 560



        



        attributeButton10:addEventListener( "tap", gameSetup.createObjectSet4)
        attributeButton20:addEventListener("tap", gameSetup.createObjectSet5)
        attributeButton30:addEventListener("tap", gameSetup.createObjectSet6)
        attributeButton40:addEventListener("tap", gameSetup.createObjectSet7)

    end



    


    function gameSetup.newAttributes ( )
        print("Number of objects : " .. gameSetup.currentObjects.numChildren )
        for i=1, gameSetup.currentObjects.numChildren do 
            display.remove( gameSetup.currentObjects[ 1 ])
        end
       
            gameSetup.createObjectSet1()
	    print( "Using ObjectSet1" )
        
        
    end

    function gameSetup.newAttributes2 ( )
        print("Number of objects : " .. gameSetup.currentObjects.numChildren )
        for i=1, gameSetup.currentObjects.numChildren do 
            display.remove( gameSetup.currentObjects[ 1 ])
        end
       
            gameSetup.createObjectSet2()
        print( "Using ObjectSet1" )
        
        
    end





    function gameSetup.gameBackground( )





        local background = display.newImageRect( "newbackground copy.jpg", 600 , 800 )
        background.x = display.contentCenterX
        background.y = display.contentCenterY
        gameSetup.level1Objects:insert( background )




        local tree = display.newImageRect( "tree.png", 130 , 273 ) 

        tree.x = display.contentCenterX
        tree.y = 245
        tree.alpha = .60
        
        gameSetup.level1Objects:insert( tree )

        local letterboxWidth = math.abs(display.screenOriginX)
        local letterboxHeight = math.abs(display.screenOriginY)
        local physics = require( "physics" )
        physics.start()
        physics.setGravity( 0, 0 ) --( gravityX, gravityY )
        local leftWall = display.newRect( display.contentCenterX - display.contentWidth / 2 , display.contentCenterY, 10, display.contentHeight )
        leftWall.anchorX = 1
        physics.addBody( leftWall, "static", { bounce=1, friction=1 } )
        --Right Wall
        local rightWall = display.newRect( display.contentCenterX + display.contentWidth / 2, display.contentCenterY, 20, display.contentHeight )
        rightWall.anchorX = 0
        physics.addBody( rightWall, "static", { bounce=1, friction=1 } )
        --Top Wall
        local topWall = display.newRect( display.contentCenterX, display.contentCenterY - display.contentHeight / 2, display.contentWidth, 20 )
        topWall.anchorY = 1
        topWall.alpha = 0
        physics.addBody( topWall, "static", { bounce=1, friction=1 } )
        --Bottom Wall
        local bottomWall = display.newRect( display.contentCenterX, display.contentCenterY + display.contentHeight / 2, display.contentWidth, 20 )
        bottomWall.anchorY = 0
        physics.addBody( bottomWall, "static", { bounce=1, friction=1 } )


       

        gameSetup.backgroundObjects:insert( leftWall )
        gameSetup.backgroundObjects:insert( rightWall ) 
        gameSetup.backgroundObjects:insert( topWall )
        gameSetup.backgroundObjects:insert( bottomWall ) 
        


       
        


    end 




    function gameSetup.createObjectSet1()   
   

            audio.play(buttonsnd)
            local circle = display.newCircle(50, 375, 60)
            circle.name  = 'circle'
            circle:setFillColor(32/255, 236/255, 00/255 )
            circle:addEventListener('touch', moveShape)
            gameSetup.level1Objects:insert( circle )
            


    end	


    function gameSetup.createObjectSet2()   


            audio.play(buttonsnd)
            local rectangle = display.newRect(80, 375, 39.5, 163)
            rectangle.name = 'rectangle'
            rectangle:setFillColor(58/255, 30/255, 19/255 )
            rectangle:addEventListener('touch', moveShape)
            gameSetup.level1Objects:insert( rectangle )


    end 


    function gameSetup.createObjectSet3()   


            audio.play(buttonsnd)
            local triangleShape = { 0,-60, 100,60, -100,60 }
            local Triangle = display.newPolygon( 80, 375, triangleShape )
            Triangle.name = 'Triangle'
            Triangle:setFillColor(32/255, 236/255, 00/255 )
            Triangle:addEventListener('touch', moveShape)
            gameSetup.level1Objects:insert( Triangle )


    end 





    function hitTestObjects(obj1, obj2)
        local left = obj1.contentBounds.xMin <= obj2.contentBounds.xMin and obj1.contentBounds.xMax >= obj2.contentBounds.xMin
        local right = obj1.contentBounds.xMin >= obj2.contentBounds.xMin and obj1.contentBounds.xMin <= obj2.contentBounds.xMax
        local up = obj1.contentBounds.yMin <= obj2.contentBounds.yMin and obj1.contentBounds.yMax >= obj2.contentBounds.yMin
        local down = obj1.contentBounds.yMin >= obj2.contentBounds.yMin and obj1.contentBounds.yMin <= obj2.contentBounds.yMax
        return (left or right) and (up or down)
       end



    function moveShape(e)

    if(e.phase == 'began') then
        lastX = e.x - e.target.x
        lastY = e.y - e.target.y
    elseif(e.phase == 'moved') then
        e.target.x = e.x - lastX
        e.target.y = e.y - lastY
    elseif(e.target.name == 'rectangle' and e.phase == 'ended' and hitTestObjects(e.target, recttester)) then
        e.target.x = display.contentCenterX
        e.target.y = 300
        e.target:removeEventListener('touch', moveShape)
        numRight = numRight + 1
        audio.play(correctSnd)
     
    elseif(e.target.name == 'circle' and e.phase == 'ended' and hitTestObjects(e.target, circletest)) then
        e.target.x = display.contentCenterX
        e.target.y = 165
        e.target:removeEventListener('touch', moveShape)
        numRight = numRight + 1
        audio.play(correctSnd)

    elseif(e.target.name == 'rectangle2' and e.phase == 'ended' and hitTestObjects(e.target, recttester2)) then
        e.target.x = display.contentCenterX - 45
        e.target.y = 342
        e.target:removeEventListener('touch', moveShape)
        numRightlevel2 = numRightlevel2 + 1
        audio.play(correctSnd)

    elseif(e.target.name == 'rectangle2' and e.phase == 'ended' and hitTestObjects(e.target, recttester3)) then
        e.target.x = display.contentCenterX + 35.5
        e.target.y = 342
        e.target:removeEventListener('touch', moveShape)
        numRightlevel2 = numRightlevel2 + 1
        audio.play(correctSnd)    


    elseif(e.target.name == 'Triangle' and e.phase == 'ended' and hitTestObjects(e.target, triangletester)) then
        e.target.x = display.contentCenterX
        e.target.y = 95
        e.target:removeEventListener('touch', moveShape)
        numRightlevel2 = numRightlevel2 + 1
        audio.play(correctSnd)    


    elseif(e.target.name == 'square' and e.phase == 'ended' and hitTestObjects(e.target, squaretester)) then
        e.target.x = display.contentCenterX - 4.88
        e.target.y = 209.2
        e.target:removeEventListener('touch', moveShape)
        numRightlevel2 = numRightlevel2 + 1
        audio.play(correctSnd)    

    end
    if(e.phase == 'ended' and numRight == 2) then
        
        display.remove( myText2 )
       local winnertext = display.newText("Congratulations! you've passed!", 160, 11, "comics", 20)
       gameSetup.level1Objects:insert( winnertext )

       audio.play(winnersound)
       --local button2 = display.newImageRect( "nextlevel.png", 110, 35 )
       --button2.x = 270
       --button2.y = 450
       --button2:addEventListener("tap", gameSetup.startGame2)
       --gameSetup.level1Objects:insert( button2 )
       numRight = 0;


     



     elseif(e.phase == 'ended' and numRightlevel2 == 4) then
        
        display.remove( watertowertext)

    
        winnertext2 = display.newText("Congratulations! you've passed!", 160, 11, "comics", 20)
       winnertext2:setTextColor(0, 0, 0 )

       audio.play(winnersound)
      -- display.remove( gameSetup.currentObjects[ 3 ])
      -- local button2 = display.newImageRect( "nextlevel.png", 110, 35 )
      -- button2.x = 270
      -- button2.y = 450
      -- button2:addEventListener("tap", gameSetup.startGame2, gameSetup.resetButtons)
       --gameSetup.level1Objects:insert( button2 )


     



    end
end


    function gameSetup.resetButtons()

        attributeButton:removeEventListener("tap", gameSetup.createObjectSet1 )
        attributeButton2:removeEventListener("tap", gameSetup.createObjectSet2 )
        attributeButton3:removeEventListener("tap", gameSetup.createObjectSet3 )



    end




    function gameSetup.startGame2()


        display.remove(recttester)
        display.remove(circletest)


         backgroundbarn = display.newImageRect( "barn.jpg", 420 , 580 )
        backgroundbarn.x = display.contentCenterX 
        backgroundbarn.y = display.contentCenterY - 50

        box2 = display.newImageRect("newshapebank.png", 3500, 1200)
        box2:scale(.115, .20)
        box2.x = 173
        box2.y = 525




         gameSetup.createNewAttributeButton2()
    
         display.remove(level1button)
         display.remove(level2button)
         display.remove(background)
         display.remove(button)
         display.remove(myText)
         display.remove(button)
         display.remove(leveltext)
         display.remove(backgroundinitial)



        backbutton = display.newImageRect( "BACK.png", 110, 35 )
       backbutton.x = 40
       backbutton.y = 50
       backbutton:addEventListener("tap", gameSetup.masterErase)




       recttester2 = display.newRect(80,575,22.7,155)
            recttester2.x = display.contentCenterX - 45
            recttester2.y = 342
            recttester2.alpha = 0
  


       recttester3 = display.newRect(80,575,22.7,155)
            recttester3.x = display.contentCenterX + 35
            recttester3.y = 342
            recttester3.alpha = 0

        squaretester = display.newRect(80,575,103.4,110.4)
            squaretester.x = display.contentCenterX - 4.88
            squaretester.y = 209.2
            squaretester.alpha = 0

        
           
         local triangleShape = { 0,-90, 100,40, -90,40 }
         triangletester = display.newPolygon( 78, 95, triangleShape )
            triangletester.alpha = 0
            triangletester.x = display.contentCenterX 
            triangleShape.y = 200






        audio.stop()
        display.remove(button2)
         watertower = display.newImageRect( "Watertower.png", 188 , 400 ) 
        watertower.x = display.contentCenterX - 5
        watertower.y = display.contentCenterY - 20
        watertower.alpha = .5




        for i = 0, 8 do
        display.remove( gameSetup.level1Objects[ 0 ])
        display.remove( gameSetup.level1Objects[ 1 ]) --rectangle tester
        display.remove( gameSetup.level1Objects[ 2 ]) --circle tester
        display.remove( gameSetup.level1Objects[ 3 ])
        display.remove( gameSetup.level1Objects[ 4 ]) --level 1
        display.remove( gameSetup.level1Objects[ 5 ]) --fill in the tree
        display.remove( gameSetup.level1Objects[ 6 ])
        display.remove( gameSetup.level1Objects[ 7 ])

       
        


        end

        



        level2text = display.newText( "Level 2!", 160, -10, "comics", 20 );
        level2text:setTextColor(0, 0, 0 )
         watertowertext = display.newText( "Fill in the Watertower with shapes!", 160, 11, "comics", 15 );
        watertowertext:setTextColor(0, 0, 0 )

        gameSetup.level2Objects:insert( watertowertext )


        gameSetup.backgroundObjects:insert( backgroundbarn )

         






    end




function gameSetup.createObjectSet4()


            audio.play(buttonsnd)
            local circle = display.newCircle(50, 375, 60)
            circle.name  = 'circle'
            circle:setFillColor(58/255, 30/255, 19/255 )
            circle:addEventListener('touch', moveShape)
            gameSetup.level1Objects:insert( circle )
            gameSetup.level2Objects:insert( circle )

    
end


function gameSetup.createObjectSet5()

            audio.play(buttonsnd)
            local rectangle3 = display.newRect(80,375,22.7,155)
            rectangle3.name = 'rectangle2'
            rectangle3:setFillColor(58/255, 30/255, 19/255 )
            rectangle3:addEventListener('touch', moveShape)
            gameSetup.level2Objects:insert( rectangle3 )

end

 function gameSetup.createObjectSet6()   


            audio.play(buttonsnd)
            local triangleShape = { 0,-60, 100,60, -100,60 }
            local Triangle = display.newPolygon( 80, 375, triangleShape )
            Triangle.name = 'Triangle'
            Triangle:setFillColor(58/255, 30/255, 19/255 )
            Triangle:addEventListener('touch', moveShape)
            gameSetup.level1Objects:insert( Triangle )
            gameSetup.level2Objects:insert( Triangle )


    end 

function gameSetup.createObjectSet7()

            audio.play(buttonsnd)
            local square = display.newRect(80,375,103.4,110.4)
            square.name = 'square'
            square:setFillColor(58/255, 30/255, 19/255 )
            square:addEventListener('touch', moveShape)
            gameSetup.level2Objects:insert( square )
            


end






function gameSetup.masterErase()

        for i = 0, 8 do
        display.remove(recttester)
        display.remove(circletest)
        display.remove( gameSetup.level1Objects[ 0 ])
        display.remove( gameSetup.level1Objects[ 1 ]) --rectangle tester
        display.remove( gameSetup.level1Objects[ 2 ]) --circle tester
        display.remove( gameSetup.level1Objects[ 3 ])
        display.remove( gameSetup.level1Objects[ 4 ]) --level 1
        display.remove( gameSetup.level1Objects[ 5 ]) --fill in the tree
        display.remove( gameSetup.level1Objects[ 6 ])
        display.remove( gameSetup.level1Objects[ 7 ])
        display.remove( gameSetup.level2Objects[ 0 ])
        display.remove( gameSetup.level2Objects[ 1 ]) --rectangle tester
        display.remove( gameSetup.level2Objects[ 2 ]) --circle tester
        display.remove( gameSetup.level2Objects[ 3 ])
        display.remove( gameSetup.level2Objects[ 4 ]) --level 1
        display.remove( gameSetup.level2Objects[ 5 ]) --fill in the tree
        display.remove( gameSetup.level2Objects[ 6 ])
        display.remove( gameSetup.level2Objects[ 7 ])
        display.remove( box)
        display.remove(attributeButton)
        display.remove(attributeButton2)
        display.remove(attributeButton3)
        display.remove(attributeButton4)
        display.remove( tree )
        display.remove( backbutton)
        display.remove(attributeButton10)
        display.remove(attributeButton20)
        display.remove(attributeButton30)
        display.remove(attributeButton40)
        display.remove(watertower)
        display.remove( level2text )
        display.remove(box2)
        display.remove( watertowertext )
        display.remove(rectangle2)
        display.remove( rectangle3)
        display.remove(square)
        display.remove(Triangle)
        display.remove(winnertext2)
        numRightlevel2 = 0;
        display.remove(backgroundbarn)
        display.remove( backbutton)
       -- numRight = 0;

    end
    gameSetup.levelSelect();

 end





return gameSetup --end gameSetup 