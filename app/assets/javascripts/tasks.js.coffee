# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

# Find Left Boundry of the Screen/Monitor

FindLeftWindowBoundry = ->
	# In Internet Explorer window.screenLeft is the window's left boundry
	if window.screenLeft
		return window.screenLeft
	
	# In Firefox window.screenX is the window's left boundry
	if window.screenX
		return window.screenX	
	0

window.leftWindowBoundry = FindLeftWindowBoundry


FindLeftScreenBoundry = ->	
  # Check if the window is off the primary monitor in a positive axis
  # X,Y                  X,Y                    S = Screen, W = Window
  # 0,0  ----------   1280,0  ----------
  #     |          |         |  ---     |
  #     |          |         | | W |    |
  #     |        S |         |  ---   S |
  #      ----------           ----------
	if window.leftWindowBoundry() > window.screen.width
 		return window.leftWindowBoundry() - (window.leftWindowBoundry() - window.screen.width)

  # Check if the window is off the primary monitor in a negative axis
  # X,Y                  X,Y                    S = Screen, W = Window
  # 0,0  ----------  -1280,0  ----------
  #     |          |         |  ---     |
  #     |          |         | | W |    |
  #     |        S |         |  ---   S |
  #      ----------           ----------
  # This only works in Firefox at the moment due to a bug in Internet Explorer opening new windows into a negative axis
  # However, you can move opened windows into a negative axis as a workaround
  windowOnAnotherDisplay = (window.leftWindowBoundry() < 0) && (window.leftWindowBoundry() > (window.screen.width * -1))
  if windowOnAnotherDisplay
  	return (window.screen.width * -1)
  #if 
		

  # If neither of the above, the monitor is on the primary monitor whose's screen X should be 0
  0
window.leftScreenBoundry = FindLeftScreenBoundry

$ ->	
	$('#loginbycall').on('click', ->
    left = window.leftScreenBoundry() + 300
    
    windowParams = "resizable=1, scrollbars=1, fullscreen=0, menubar=1, height=450, width=500, screenX=#{left}, left=#{left}, toolbar=0, menubar=1, status=1"
    window.open('/auth/id4tel', 'loginbycall', windowParams)
	)