--[[
Made by ImaginationSuperHero52806#2485 and JasonTheOne111#0529 (Fun Fact: Jason doesn't remember working on this at all)
Cleaned up and fixed by Superpowers#3887
Heatlthbar movement by The Shade Lord#9206
Version Checker by raltyro#1324
]]--

local Vertical = false -- True is downscroll, false is upscroll
local Horizontal = false -- True is middlescroll, false is sidescroll
local StrumSwap = false; local ignoreMiddle = true; local targetAlpha = {0.5, 'opponent'}

local updateLabels = false
local hscriptExists = true
local chartingMode
	
function onUpdatePost(elapsed)
	-- Shit here by methewhenmethe#7219 this is to fix the wired visual issues with noteTweenDirection!
	noteCount = getProperty('notes.length')
	for i = 0, noteCount-1 do
		noteData = getPropertyFromGroup('notes', i, 'noteData')
		if getPropertyFromGroup('notes', i, 'isSustainNote') then
			--debugPrint(noteData)
            if (getPropertyFromGroup('notes', i, 'mustPress')) then
                setPropertyFromGroup('notes', i, 'angle', getPropertyFromGroup('playerStrums', noteData, 'direction') - 90)
            else
				
                setPropertyFromGroup('notes', i, 'angle', getPropertyFromGroup('opponentStrums', noteData, 'direction') - 90)
            end	
		else
            if (noteData >= 4) then
                setPropertyFromGroup('notes', i, 'angle', getPropertyFromGroup('playerStrums', noteData, 'angle'))
            else
                setPropertyFromGroup('notes', i, 'angle', getPropertyFromGroup('opponentStrums', noteData, 'angle'))
            end	
		end
	end
	-- End of the fix
end

local autoSwapVertical; local veryBoi
local autoSwapHorizontal
function onBeatHit()
	if autoSwapVertical == true then
		if curBeat % bpmCheckforASV == 0 then
			if veryBoi == true then triggerEvent('ChaSrlTyp~ Tween Typing', 'backInOut, 0.3', 'Vert') else end
			triggerEvent('Change Scrolltype', 'swap', '')
		end
	end
end

function onMoveCamera(focus)
	if autoSwapHorizontal == true then
		if focus == 'dad' then
			triggerEvent('Change Scrolltype', '', 'off')
		elseif focus == 'boyfriend' then
			triggerEvent('Change Scrolltype', '', 'on')
		end
	end
end

local defTween = 'quadOut'
local defDuration = 0.5

local curTweenVert = defTween
local curDurationVert = defDuration
local curTweenHori = defTween
local curDurationHori = defDuration

local leftSide = {92, 204, 316, 428}; local rightSide = {732, 844, 956, 1068}
local splitWay = {82, 194, 971, 1083}; local middleWay = {412, 524, 636, 748}
function onEvent(name, value1, value2)
	if name == 'Change Scrolltype' then
		-- Vertical Scrolltypes
		if value1 == 'off' or value1 == 'on' then -- Switch Between Upscroll and Downscroll
			Vertical = (value1 == 'on')
			runTimer('Vertical', 0.0001)
		elseif value1 == 'swap' then -- Swap between Up and Downscroll
			Vertical = not Vertical
			runTimer('Vertical', 0.0001)
		elseif value1 == 'default' then -- Switch Back to Default Scrolltype
			Vertical = downscroll
			runTimer('Vertical', 0.0001)
		elseif value1 == 'anti' then -- Switch to the opposite of Default Scrolltype
			Vertical = not downscroll
			runTimer('Vertical', 0.0001)
		elseif value1 == 'very unfunny' then -- Weird Shit, it's cool
			veryBoi = true
			autoSwapVertical = true
		elseif value1 == 'unfunny' then -- Weird Shit, it's cool
			veryBoi = false
			autoSwapVertical = true
		elseif value1 == 'funny' then
			autoSwapVertical = false
			triggerEvent('Change Scrolltype', 'default', '')
		end
		
		-- Horizontal Scrolltypes
		if value2 == 'off' or value2 == 'on' then -- Switch Between Sidescroll and Middlescroll
			Horizontal = (value2 == 'on')
			runTimer('Horizontal', 0.0001)
		elseif value2 == 'swap' then -- Swap between Up and Middlescroll
			Horizontal = not Horizontal
			runTimer('Horizontal', 0.0001)
		elseif value2 == 'default' then -- Switch Back to Default Scrolltype
			Horizontal = middlescroll
			runTimer('Horizontal', 0.0001)
		elseif value2 == 'anti' then -- Switch to the opposite of Default Scrolltype
			Horizontal = not middlescroll
			runTimer('Horizontal', 0.0001)
		elseif value2 == 'unfunny' then -- Weird Shit, it's cool
			autoSwapHorizontal = true
			if chartingMode then addLuaText('sectionTxt') end
		elseif value2 == 'funny' then
			autoSwapHorizontal = false
			if chartingMode then removeLuaText('sectionTxt', false) end
			triggerEvent('Change Scrolltype', '', 'default')
		end
	end
	if name == 'ChaSrlTyp~ Tween Typing' then
		local value1contents = {}
		if string.find(value1, ',') then
			value1contents = Split(value1, ',')
			TweenTyping(value1contents[1], value1contents[2], value2)
		else
			TweenTyping(value1, value2, 'Both')
		end
	end
	if name == 'ChaSrlTyp~ Strum Swap' then
		-- Gonna Happen
		if value1 == 'off' or value1 == 'on' then
			StrumSwap = (value1 == 'on')
		elseif value1 == 'swap' then
			StrumSwap = not StrumSwap
		end

		if value2 == 'full' then
			targetAlpha[2] = 'full'
		elseif value2 == 'opponent' then
			targetAlpha[2] = 'opponent'
		elseif value2 == 'player' then
			targetAlpha[2] = 'player'
		end
	end
end

function TweenTyping(Tween, Duration, Direction)
	if Tween == '' then
		Tween = defTween
	end
	if Duration == '' then
		Duration = defDuration
	end

	if Direction == '' or Direction == nil or Direction == 'Both' then
		curTweenVert = Tween
		curDurationVert = Duration
		curTweenHori = Tween
		curDurationHori = Duration
	
	elseif Direction == 'Vert' then
		curTweenVert = Tween
		curDurationVert = Duration
	
	elseif Direction == 'Hori' then
		curTweenHori = Tween
		curDurationHori = Duration
	end
end

function onTimerCompleted(tag)
	-- Up and Downscroll
	if tag == 'Vertical' then
		for i = 0, 7 do
			noteTweenDirection('scrollDir' .. i, i, (downscroll and (Vertical and 90 or -90) or (Vertical and -90 or 90)), curDurationVert, curTweenVert)
			setProperty('healthBar.y', (Vertical and 83.2 or 644.8))
			setProperty('timeBar.y', (Vertical and 688 or 31))
			setProperty('iconP1.y', getProperty('healthBar.y') - 75)
			setProperty('iconP2.y', getProperty('healthBar.y') - 75)
			setProperty('scoreTxt.y', getProperty('healthBar.y') + 25)
			setProperty('timeTxt.y', getProperty('timeBar.y') - 12)
			setProperty('botplayTxt.y', (Vertical and 606 or 82))
			noteTweenY('moveNoteY' .. i, i, (Vertical and 570 or 50), curDurationVert, curTweenVert)
		end

		if hscriptExists == true then
			runHaxeCode([[
				for (i in 0...4)
				{
					game.setOnLuas('defaultPlayerStrumY' + i, ]] .. (Vertical and 570 or 50) .. [[);
					game.setOnLuas('defaultOpponentStrumY' + i, ]] .. (Vertical and 570 or 50) .. [[);
				}
			]])
		end
		
		curTweenVert = defTween
		curDurationVert = defDuration
	end
		
	-- Side and Middlescroll
	if tag == 'Horizontal' then
		if Horizontal then
			testing = ((targetAlpha[2] ~= 'opponent') and targetAlpha[1] or 1)
			for i = 4, 7 do
				noteTweenX('moveNoteX' .. i, i, (ignoreMiddle == false and (StrumSwap == false and middleWay or splitWay) or middleWay)[i-3], curDurationHori, curTweenHori)
				noteTweenAlpha('alphaNote' .. i, i, (targetAlpha[2] ~= 'opponent' and targetAlpha[1] or 1), curDurationHori, curTweenHori)
				resetDefaultStrumX(true, (ignoreMiddle == false and (StrumSwap == false and middleWay or splitWay) or middleWay))
			end
			
			for i = 0, 3 do
				noteTweenX('moveNoteX' .. i, i, (ignoreMiddle == false and (StrumSwap == false and splitWay or middleWay) or splitWay)[i+1], curDurationHori, curTweenHori)
				noteTweenAlpha('alphaNote' .. i, i, (targetAlpha[2] ~= 'player' and targetAlpha[1] or 1), curDurationHori, curTweenHori)
				resetDefaultStrumX(false, (ignoreMiddle == false and (StrumSwap == false and splitWay or middleWay) or splitWay))
			end
		else
			for i = 4, 7 do
				noteTweenX('moveNoteX' .. i, i, (StrumSwap == false and rightSide or leftSide)[i-3], curDurationHori, curTweenHori)
				noteTweenAlpha('alphaNote' .. i, i, 1, curDurationHori, curTweenHori)
				resetDefaultStrumX(true, (StrumSwap == false and rightSide or leftSide))
			end
			
			for i = 0, 3 do
				noteTweenX('moveNoteX' .. i, i, (StrumSwap == false and leftSide or rightSide)[i+1], curDurationHori, curTweenHori)
				noteTweenAlpha('alphaNote' .. i, i, 1, curDurationHori, curTweenHori)
				resetDefaultStrumX(false, (StrumSwap == false and leftSide or rightSide))
			end
		end
			
		curTweenHori = defTween
		curDurationHori = defDuration
	end
end
		
function resetDefaultStrumX(isP1, arrayStor)
	if hscriptExists == true then
		for i = 0, 3 do
			runHaxeCode([[
				for (i in 0...4)
				{
					game.setOnLuas('default]] .. ((isP1 == true and 'Player') or (isP1 == false and 'Opponent')) .. [[StrumX' + ]] .. i .. [[, ]] .. arrayStor[i+1] .. [[);
				}
			]])
		end
	end
end

function onDestory()
	for i = 0, 7 do
		cancelTween('scrollDir' .. i)
		cancelTween('moveNoteY' .. i)
		cancelTween('moveNoteX' .. i)
		cancelTween('alphaNote' .. i)
	end
end

function Split(s, delimiter)
	result = {}
	for match in (s..delimiter):gmatch('(.-)'..delimiter) do
		table.insert(result, tostring(match))
	end
	return result
end

function getVersion()
    return version or getPropertyFromClass('MainMenuState', 'psychEngineVersion') or '0.0.0'
end

function getVersionLetter(ver) -- ex '0.5.2h' > 'h'
    local str = ''
    string.gsub(ver, '%a+', function(e)
        str = str .. e
    end)
    return str
end

function getVersionNumber(ver) -- ex '0.6.1' > 61
    local str = ''
    string.gsub(ver, '%d+', function(e)
        str = str .. e
    end)
    return tonumber(str)
end

function getVersionBase(ver) -- ex '0.5.2h' > '0.5.2'
    local letter, str = getVersionLetter(ver), ''
    if (letter == '') then return ver end
    for s in ver:gmatch('([^'..letter..']+)') do
        str = str .. s
    end
    return str
end

function compareVersion(ver, needed)
    local a, b = getVersionLetter(ver), getVersionLetter(needed)
    local c, d = getVersionNumber(ver), getVersionNumber(needed)
    local v = true
    if (c == d) then v = (b == '' or (a ~= '' and a:byte() >= b:byte())) end
    return c >= d and v
end