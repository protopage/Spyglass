#Document Setup
document.body.style.cursor = "auto"
Framer.Extras.Hints.disable()
Framer.Extras.ShareInfo.disable()
Framer.Extras.Preloader.enable()

# Sketch
sketch = Framer.Importer.load("imported/Spyglass Prototype@1x")

{Main_Dashboard_Regular, pipboy, accountDropdown, setupDropdown, listContent1, listContent, listContentTop, loader, listContentBot, accountZone, setupZone, accountActivityZone, setupActivityZone, accountActivity, logo, mask, pipboyExit, listContentBot1, loader1, listContentTop1, accountGuide, dropdown1, dropdown2, dropdown3, dropdown4, dropdown5, dropdown6, dropdown7, moreShit1, moreShit2, moreShit3, moreShit4, moreShit5, moreShit6, moreShit7} = sketch


Main_Dashboard_Regular.x = Align.center

accountActivity.visible = false
pipboy.visible = false
accountDropdown.visible = false
setupDropdown.visible = false

setupZone.onClick ->
	if setupDropdown.visible is false
		setupDropdown.visible = true
	else
		setupDropdown.visible = false

accountZone.onClick ->
	if accountDropdown.visible == false
		accountDropdown.visible = true
	else
		accountDropdown.visible = false

accountActivityZone.onClick ->
	accountActivity.visible = true
	accountDropdown.visible = false

logo.onClick ->
	accountActivity.visible = false

setupActivityZone.onClick ->
	pipboy.visible = true
	setupDropdown.visible = false

accountScroll = ScrollComponent.wrap(listContent)
accountScroll.props =
	height: accountGuide.height - 138
	width: accountGuide.width
	mouseWheelEnabled: true


pipboyScroll = ScrollComponent.wrap(listContent1)
pipboyScroll.props =
	height: mask.height - 10
	width: mask.width
	mouseWheelEnabled: true
	y: mask.y + 10


listContentBot.visible = false

pipboyExit.onClick ->
	pipboy.visible = false


sketch.dash.onClick ->
	accountDropdown.visible = false
	setupDropdown.visible = false


listContentBot1.visible = false
listContent1.removeChild(listContentBot1)


animateLimit = 2
animateCountPip = 0
animateCountAccount = 0


pipboyScroll.onMove ->
	if pipboyScroll.scrollY > 75 and loader1.isAnimating is false
		loader1.animate
			rotation: 360


loader1.onAnimationEnd ->
	unless animateCountPip is animateLimit
		loader1.animate
			rotation: loader1.rotation + 360
		animateCountPip++
	if animateCountPip is animateLimit
		listContent1.addChild(listContentBot1)
		pipboyScroll.updateContent()
		listContentBot1.visible = true
		loader1.visible = false


listContent.removeChild(listContentBot)


accountScroll.onMove ->
	if accountScroll.scrollY > 61 and loader.isAnimating is false
		loader.animate
			rotation: 360


loader.onAnimationEnd ->
	unless animateCountAccount is animateLimit
		loader.animate
			rotation: loader.rotation + 360
		animateCountAccount++
	if animateCountAccount is animateLimit
		listContent.addChild(listContentBot)
		accountScroll.updateContent()
		listContentBot.visible = true
		loader.visible = false

shits = [moreShit1, moreShit2, moreShit3, moreShit4, moreShit5, moreShit6, moreShit7]
menus = [dropdown1, dropdown2, dropdown3, dropdown4, dropdown5, dropdown6, dropdown7]


create = (index) ->
	shits[index].onClick ->
		menus[index].visible = true
	menus[index].onClick ->
		menus[index].visible = false
	sketch.dash.onClick ->
		menus[index].visible = false


for i in [0...shits.length]
	create(i)

affordances = [moreShit1, moreShit2, moreShit3, moreShit4, moreShit5, moreShit6, moreShit7, accountZone, setupZone, setupActivityZone, accountActivityZone, logo, pipboyExit]

# Affordances
createAffordances = (index) ->
	affordances[index].onMouseOver ->
		document.body.style.cursor = "pointer"
	affordances[index].onMouseOut ->
		document.body.style.cursor = "auto"

for i in [0...affordances.length]
	createAffordances(i)