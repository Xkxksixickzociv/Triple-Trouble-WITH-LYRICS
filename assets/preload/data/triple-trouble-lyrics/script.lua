local allowCountdown = false
function onCreate()

    makeAnimatedLuaSprite('missStatic', 'tripleTrouble/hitStatic', 0, 0)
    addAnimationByPrefix('missStatic', 'missed', 'staticANIMATION', 24, false)
    setObjectCamera('missStatic', 'hud')
    setGraphicSize('missStatic', getProperty('missStatic.width') * 4)
    setProperty('missStatic.alpha', 0.7)

    addCharacterToList('knucklesOMS', 'dad')
    addCharacterToList('xenophane', 'dad')
    addCharacterToList('xenophane-flip', 'dad')
    addCharacterToList('eggmanOMS', 'dad')
    addCharacterToList('flippedBf', 'boyfriend')
    addCharacterToList('bfHaha', 'boyfriend')
    addCharacterToList('bf-perspectiveLeftALT', 'boyfriend')
    addCharacterToList('bf-perspectiveRightALT', 'boyfriend')
end

function onCreatePost()

end
function onUpdate(elapsed)

end
function onTimerCompleted(tag)

end

function onEvent(name,a,b)
end

function onStepHit()
    if curStep == 1 then
        doTweenZoom('asf', 'camGame', 1.1, 2, 'cubeOut')
        setProperty('defaultCamZoom', 0.8)
    end

    if curStep == 1024 or curStep == 1088 or curStep == 1216 or curStep == 1280 or curStep == 2305 or curStep == 2810 or curStep == 3199 or curStep == 4096 then
        triggerEvent('Trigger Static', 0, 0)
    end

    if curStep == 1040 then --xenophane
        setProperty('Grass.visible', true)
        setProperty('BackTrees.visible', true)
        setProperty('plasticShit.visible', true)
		setProperty('TTTrees.visible', false)
		setProperty('BackBush.visible', false)
		setProperty('TopBushes.visible', false)
		

        triggerEvent('Change Character', 'dad', 'xenophane')
        triggerEvent('Change Character', 'nashe', 'bf-perspectiveRightALT')

        setProperty('boyfriend.x', 502.45 + 300)
        setProperty('boyfriend.y', 320.45)
        setProperty('dad.x', 20 + -50)
        setProperty('dad.y', -94.75 + -150)

        doTweenZoom('adffg', 'camGame', 0.9, 2, 'cubeOut')
        setProperty('defaultCamZoom', 1.1)
    end

    if curStep == 1296 then --knuckk
        setProperty('Grass.visible', false)
        setProperty('BackTrees.visible', false)
        setProperty('plasticShit.visible', false)
		setProperty('TTTrees.visible', true)
		setProperty('BackBush.visible', true)
		setProperty('TopBushes.visible', true)

        triggerEvent('Opponent Notes Right Side', 'among us is', 'not funny')
        
        doTweenZoom('asfyte', 'camGame', 1.1, 2, 'cubeOut')
        setProperty('defaultCamZoom', 0.8)

        triggerEvent('Change Character', 'dad', 'knucklesOMS')
        triggerEvent('Change Character', 'nashe', 'flippedBf')

        setProperty('boyfriend.x', 46.1)
        setProperty('boyfriend.y', 685.6 - 300)
        setProperty('dad.x', 1550 - 700)
        setProperty('dad.y', 260 + -50)
    end

    if curStep == 2320 then --xenophane right
        doTweenZoom('adffgedfdfg', 'camGame', 0.9, 2, 'cubeOut')
        setProperty('defaultCamZoom', 0.9)

        setProperty('Grass.visible', true)
        setProperty('BackTrees.visible', true)
        setProperty('plasticShit.visible', true)
		setProperty('TTTrees.visible', false)
		setProperty('BackBush.visible', false)
		setProperty('TopBushes.visible', false)
		
		setProperty('Grass.flipX', true)
		setProperty('Grass.flipX', true)
		setProperty('BackTrees.flipX', true)
		setProperty('BackTrees.flipX', true)

        triggerEvent('Change Character', 'dad', 'xenophane-flip')
        triggerEvent('Change Character', 'nashe', 'bf-perspectiveLeftALT')

        setProperty('boyfriend.x', 302.45 - 150)
        setProperty('boyfriend.y', 270.45)
        setProperty('dad.x', 1300 - 300)
        setProperty('dad.y', -94.75 + -150)

        doTweenZoom('asfyteasdsedfdrgg', 'camGame', 1, 2, 'cubeOut')
        setProperty('defaultCamZoom', 1.1)
    end

    if curStep == 2823 then --eggdick face event
        doTweenZoom('rrrrrr', 'camGame', 1, 2, 'cubeOut')
        setProperty('defaultCamZoom', 0.8)

        setProperty('Grass.visible', false)
        setProperty('BackTrees.visible', false)
        setProperty('plasticShit.visible', false)
		setProperty('TTTrees.visible', true)
		setProperty('BackBush.visible', true)
		setProperty('TopBushes.visible', true)

        triggerEvent('Change Character', 'dad', 'eggmanOMS')
        triggerEvent('Change Character', 'nashe', 'bfHaha')

        setProperty('boyfriend.x', 466.1 + 400)
        setProperty('boyfriend.y', 685.6 - 300)
        setProperty('dad.x', 20 - 0)
        setProperty('dad.y', 30 + 105)
    end

    if curStep == 4111 then --xenophane come back
        setProperty('Grass.visible', true)
        setProperty('BackTrees.visible', true)
        setProperty('plasticShit.visible', true)
		setProperty('TTTrees.visible', false)
		setProperty('BackBush.visible', false)
		setProperty('TopBushes.visible', false)
		
		setProperty('Grass.flipX', false)
		setProperty('Grass.flipX', false)
		setProperty('BackTrees.flipX', false)
		setProperty('BackTrees.flipX', false)

        triggerEvent('Change Character', 'dad', 'xenophane')
        triggerEvent('Change Character', 'nashe', 'bf-perspectiveRightALT')

        setProperty('boyfriend.x', 502.45 + 300)
        setProperty('boyfriend.y', 320.45)
        setProperty('dad.x', 20 + -50)
        setProperty('dad.y', -94.75 + -150)

        doTweenZoom('adffg', 'camGame', 0.9, 2, 'cubeOut')
        setProperty('defaultCamZoom', 1.1)
    end
end