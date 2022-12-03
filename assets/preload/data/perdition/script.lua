function onSongStart()
  doTweenX('texto', 'texto', -1000, 0.5)
  doTweenX('circulo', 'circulo', 1800, 0.5)
  doTweenAlpha('negro', 'negro', 0, 0.5)
end

function onCreate()

makeLuaSprite('negro','', 0, 0)
makeGraphic('negro', 1280, 720, '000000')
setObjectCamera('negro', 'other');
addLuaSprite('negro', true)

makeLuaSprite('circulo','Circle-perdition', -900, 0)
setObjectCamera('circulo', 'other');
addLuaSprite('circulo', true)

makeLuaSprite('texto','Text-perdition', 1800, 0)
setObjectCamera('texto', 'other');
addLuaSprite('texto', true)
end

function onCreatePost()
	doTweenX('texto', 'texto', 100, 0.5)
	doTweenX('circulo', 'circulo', 100, 0.5)
end





