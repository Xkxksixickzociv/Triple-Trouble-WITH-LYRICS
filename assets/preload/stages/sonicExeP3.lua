local ffi = require("ffi")  -- LuaJIT Extension
local user32 = ffi.load("user32")   -- LuaJIT User32 DLL Handler Function

ffi.cdef([[
enum{
    MB_OK = 0x00000000L,
	MB_OKCANCEL = 0x00000001L,
    MB_ABORTRETRYIGNORE = 0x00000002L,
    MB_YESNOCANCEL = 0x00000003L,
    MB_YESNO = 0x00000004L,
    MB_RETRYCANCEL = 0x00000005L,
    MB_CANCELTRYCONTINUE = 0x00000006L,
    MB_ICONINFORMATION = 0x00000040L,
};

typedef void* HANDLE;
typedef HANDLE HWND;
typedef const char* LPCSTR;
typedef unsigned UINT;

int MessageBoxA(HWND, LPCSTR, LPCSTR, UINT);
int MessageBoxW(HWND, LPCSTR, LPCSTR, UINT);
]])

local xx = 460;
local yy = 680;
local xx2 = 820;
local yy2 = 720;
local ofs = 16;
local ofs2 = 20;
local del = 0;
local del2 = 0;
local t = 0
local s = 0
-- local allowCountdown = false

function onCreate()

	luaDebugMode = false

    makeLuaSprite('bg', 'tripleTrouble/Glitch', -621, -365)
    addLuaSprite('bg', false)
    setGraphicSize('bg', getProperty('bg.width') * 1.2)
	setObjectOrder('bg', 0);

    makeAnimatedLuaSprite('plasticShit', 'tripleTrouble/NewTitleMenuBG', 0, -200)
    addAnimationByPrefix('plasticShit', 'ImGonnaDie', 'TitleMenuSSBG instance 1', 24, true)
    setGraphicSize('plasticShit', getProperty('plasticShit.width') * 4.5)
    setProperty('plasticShit.visible', false)
    addLuaSprite('plasticShit', false)setScrollFactor('gfGroup', 0.95, 0.95);
	setObjectOrder('plasticShit', 1);

	makeLuaSprite('TTTrees', 'tripleTrouble/TTTrees', -815, -260.833333333333);
	scaleObject('TTTrees', 2.2, 2.2);
	setScrollFactor('TTTrees', 1, 1);
	setProperty('TTTrees.antialiasing', true);
	setObjectOrder('TTTrees', 2);

	makeLuaSprite('BackBush', 'tripleTrouble/BackBush', -815, -266.666666666667);
	scaleObject('BackBush', 2.2, 2.2);
	setScrollFactor('BackBush', 1, 1);
	setProperty('BackBush.antialiasing', true);
	setObjectOrder('BackBush', 3);

	makeLuaSprite('TopBushes', 'tripleTrouble/TopBushes', -816.5, -309.166666666667);
	scaleObject('TopBushes', 2.2, 2.2);
	setScrollFactor('TopBushes', 1, 1);
	setProperty('TopBushes.antialiasing', true);
	setObjectOrder('TopBushes', 4);

	makeLuaSprite('BackTrees', 'tripleTrouble/BackTrees', -813.333333333333, -310);
	scaleObject('BackTrees', 2.2, 2.2);
	setScrollFactor('BackTrees', 1, 1);
    setProperty('BackTrees.visible', false)
	setProperty('BackTrees.antialiasing', true);
	setObjectOrder('BackTrees', 5);

	makeLuaSprite('Grass', 'tripleTrouble/Grass', -815, -264.166666666667);
	scaleObject('Grass', 2.2, 2.2);
	setScrollFactor('Grass', 1, 1);
    setProperty('Grass.visible', false)
	setProperty('Grass.antialiasing', true);
	setObjectOrder('Grass', 6);

	makeLuaSprite('FGTree2', 'tripleTrouble/FGTree2', -815, -250);
	scaleObject('FGTree2', 2.2, 2.2);
	setScrollFactor('FGTree2', 1, 1);
	setProperty('FGTree2.antialiasing', true);
	setObjectOrder('FGTree2', 11);

	makeLuaSprite('FGTree1', 'tripleTrouble/FGTree1', -950, -395);
	scaleObject('FGTree1', 2.4, 2.4);
	setScrollFactor('FGTree1', 1, 1);
	setProperty('FGTree1.antialiasing', true);
	setObjectOrder('FGTree1', 10);


   makeLuaSprite('readthefiletitlelol', 'tripleTrouble/makeGraphicsucks', 0, 0);
		scaleObject('readthefiletitlelol', 6.0, 6.0);
		setObjectCamera('readthefiletitlelol', 'other');
		addLuaSprite('readthefiletitlelol', true);

	makeLuaSprite('introcircle', 'tripleTrouble/CircleTripleTrouble', 100, 0);
		setObjectCamera('introcircle', 'other');
		addLuaSprite('introcircle', true);

	makeLuaSprite('introtext', 'tripleTrouble/TextTripleTrouble', -100, 0);
		setObjectCamera('introtext', 'other');
		addLuaSprite('introtext', true);
end

function onCreatePost()
    setProperty('gf.alpha', 0)
end

function onStartCountdown()
	doTweenX('circleTween', 'introcircle', -100, 2, 'quintOut')
	doTweenX('textTween', 'introtext', 100, 2, 'quintOut')
    return Function_Continue
end

function onSongStart()
	doTweenAlpha('graphicAlpha', 'readthefiletitlelol', 0, 0.2, 'quintOut');
	doTweenAlpha('circleAlpha', 'introcircle', 0, 0.2, 'quintOut');
	doTweenAlpha('textAlpha', 'introtext', 0, 0.2, 'quintOut');

end