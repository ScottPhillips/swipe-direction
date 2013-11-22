local beginX 
local beginY  
local endX  
local endY 
 
local xDistance  
local yDistance
 
local bDoingTouch
local minSwipeDistance = 50
local totalSwipeDistanceLeft
local totalSwipeDistanceRight
local totalSwipeDistanceUp
local totalSwipeDistanceDown
 
function checkSwipeDirection()
                if bDoingTouch == true then
                xDistance =  math.abs(endX - beginX) -- math.abs will return the absolute, or non-negative value, of a given value. 
                yDistance =  math.abs(endY - beginY)
                if xDistance > yDistance then
                        if beginX > endX then
                        totalSwipeDistanceLeft = beginX - endX
                        if totalSwipeDistanceLeft > minSwipeDistance then
                                print("Swiped Left")
                        end
                    else 
                        totalSwipeDistanceRight = endX - beginX
                        if totalSwipeDistanceRight > minSwipeDistance then
                                print("Swiped Right")
                        end
                    end
                else 
                 if beginY > endY then
                        totalSwipeDistanceUp = beginY - endY
                        if totalSwipeDistanceUp > minSwipeDistance then
                                print("Swiped Up")
                        end
                     else 
                        totalSwipeDistanceDown = endY - beginY
                        if totalSwipeDistanceDown > minSwipeDistance then
                                print("Swiped Down")
                        end
                     end
                end
        end
 end
 function swipe(event)
                if event.phase == "began" then
            bDoingTouch = true
                beginX = event.x
            beginY = event.y
        end
        if event.phase == "ended"  then
            endX = event.x
            endY = event.y
            checkSwipeDirection();
            bDoingTouch = false
        end
end
 
Runtime:addEventListener("touch", swipe)
