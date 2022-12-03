local currentBarPorcent = 0.01
local heightBar = 0
function onCreatePost()
    makeLuaSprite('FearBarImage','fearbar',screenWidth - 100,100)
    scaleObject('FearBarImage',1.2,1.1)
    setObjectCamera('FearBarImage','hud')
    addLuaSprite('FearBarImage',true)
	
	makeLuaSprite('rojo', 'rojito', 0, 0)
	setProperty('rojo.alpha', 0)
	setObjectCamera('rojo', 'hud');
	addLuaSprite('rojo', true)

    makeLuaSprite('FearBarBg','fearbarBG',getProperty('FearBarImage.x') + 15,getProperty('FearBarImage.y'))
    setObjectCamera('FearBarBg','hud')
    scaleObject('FearBarBg',1,1.1)
    addLuaSprite('FearBarBg',false)
    
    makeLuaSprite('FearBarBar','',getProperty('FearBarImage.x') + 20,getProperty('FearBarImage.y'))
    setObjectCamera('FearBarBar','hud')
    makeGraphic('FearBarBar',getProperty('FearBarBg.width')/2,getProperty('FearBarBg.height'),'FF0000')

    addLuaSprite('FearBarBar',false)
end
function onUpdate()

    setProperty('rojo.alpha', currentBarPorcent)

    if keyPressed('space') then
        currentBarPorcent = currentBarPorcent + 0.1
    end
    if currentBarPorcent == 0 then
        setGraphicSize('FearBarBar',getProperty('FearBarBg.width')/1.8 * getProperty('FearBarBg.scale.x'),0)
    else
        setGraphicSize('FearBarBar',getProperty('FearBarBg.width')/1.8 * getProperty('FearBarBg.scale.x'),getProperty('FearBarBg.height')/1.08* currentBarPorcent)
    end
    setProperty('FearBarBar.x',getProperty('FearBarBg.x') + 20)
    setProperty('FearBarBar.x',getProperty('FearBarBg.x') + 20)
    setProperty('FearBarBar.y',getProperty('FearBarImage.y') + 305 - getProperty('FearBarBar.height'))

    if currentBarPorcent > 1 then
        currentBarPorcent  = 1
        setProperty('health', -500);
    end
    if currentBarPorcent <= 0 then
        currentBarPorcent  = 0
        setGraphicSize('FearBarBar',getProperty('FearBarBg.width')/1.8 * getProperty('FearBarBg.scale.x'),0)
        setProperty('FearBarBar.visible',false)
    else
        setProperty('FearBarBar.visible',true)
    end
end
function opponentNoteHit()

    if currentBarPorcent < 1 then
        currentBarPorcent = currentBarPorcent + 0.0003
    end
	
end
function goodNoteHit()
    if currentBarPorcent > 0.01000 then
        currentBarPorcent = currentBarPorcent - 0.0001
    end
end
function noteMiss(id,dir,type,sustain)
    if type == '' then
        if currentBarPorcent < 1 then
            currentBarPorcent = currentBarPorcent + 0.002
        end
    end
end
function onStepHit() --en stephit es demasiado dificil xdddddddddddddd
if currentBarPorcent > 0.40 then
	health = getProperty('health');
	if getProperty('health') > 0.25 then
        setProperty('health', health- 0.010);
	end
	end
if currentBarPorcent > 0.70 then
	health = getProperty('health');
	if getProperty('health') > 0.25 then
        setProperty('health', health- 0.008);
	end
	end
end
