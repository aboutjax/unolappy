wheelsucker = Layer.select('wheelsucker')
podium = Layer.select('podium')
sufferfest = Layer.select('sufferfest')
windbreaker = Layer.select('windbreaker')

animateShapes = [wheelsucker, podium, sufferfest, windbreaker]

for shape in animateShapes
	strokeLength = shape.length
	path = shape._parent.svg
	shape.opacity = 1
	path.setAttribute("stroke-dasharray", "#{strokeLength}")
	path.setAttribute("stroke-linecap", "round") 
	path.setAttribute("stroke-dashoffset", strokeLength )
	

# Timing
animationDuration = 2

# Set gradient method	
setGradient = (gradient, shape) ->
	{ start, end } = gradient.gradient
	angle = gradient.gradient.angle
	svg = Layer.select(shape)

	gradient = new SVGLayer
		svg: """
			<svg>
				<linearGradient id="gradient#{shape}" gradientTransform="rotate(#{angle - 90}, 0.5, 0.5)">
					<stop offset="0%" stop-color="##{start.toHex()}"/>
					<stop offset="100%" stop-color="##{end.toHex()}" />
				</linearGradient>
			</svg>
		"""
	
	svg._parent.svg.setAttribute("stroke","url(#gradient#{shape})")


# Path animation method
animatePath = (shape, input, output) ->
	length = shape.length
	value = Utils.modulate(input, [0, 10], [0, length], true)
	shape._parent.svg.setAttribute("stroke-dashoffset","#{value}")



setGradient(g1, 'wheelsucker')
setGradient(g2, 'podium')
setGradient(g3, 'sufferfest')
setGradient(g4, 'windbreaker')


# 1️⃣ Wheelsucker Hook Layer
hiddenHookLayerWheelsuckerLayer = new Layer
	y: 10
	opacity: 0
	
hiddenHookLayerWheelsuckerLayer.on "change:y", ->
	animatePath(wheelsucker, @y, 10)
	
hiddenHookLayerWheelsuckerLayer.animate
	y: 7
	options:
		time: animationDuration
	



# 2️⃣ Podium Finish Hook Layer
hiddenHookLayerPodiumLayer = new Layer
	y: 10
	opacity: 0
	
hiddenHookLayerPodiumLayer.on "change:y", ->
	animatePath(podium, @y, 10)
	
hiddenHookLayerPodiumLayer.animate
	y: 2
	options:
		delay: 0.6
		time: animationDuration
		
		
		
# 3️⃣ Sufferfest Hook Layer
hiddenHookLayerSufferfestLayer = new Layer
	y: 10
	opacity: 0
	
hiddenHookLayerSufferfestLayer.on "change:y", ->
	animatePath(sufferfest, @y, 10)
	
hiddenHookLayerSufferfestLayer.animate
	y: 4
	options:
		delay: 1.2
		time: animationDuration
		
		
# 4️⃣ Windbreaker Hook Layer
hiddenHookLayerWindbreakerLayer = new Layer
	y: 10
	opacity: 0
	
hiddenHookLayerWindbreakerLayer.on "change:y", ->
	animatePath(windbreaker, @y, 10)
	
hiddenHookLayerWindbreakerLayer.animate
	y: 5
	options:
		delay: 1.8
		time: animationDuration
		



# Points Labels

pointsWheelsucker.props =
	text: "+ {points}"
	opacity: 0
	
pointsWheelsucker.templateFormatter = 
	points: (value) ->
		Utils.round(value, 0)
		
pointsWheelsucker.animate
	opacity: 1
	template: 
		points: 200
		unit: "KM"
	options:
		time: animationDuration
		
		

pointsPodium.props =
	text: "+ {points}"
	opacity: 0
	
pointsPodium.templateFormatter = 
	points: (value) ->
		Utils.round(value, 0)
		
pointsPodium.animate
	opacity: 1
	template: 
		points: 200
		unit: "KM"
	options:
		time: animationDuration
		delay: 0.6
		


pointsSufferfest.props =
	text: "+ {points}"
	opacity: 0
	
pointsSufferfest.templateFormatter = 
	points: (value) ->
		Utils.round(value, 0)
		
pointsSufferfest.animate
	opacity: 1
	template: 
		points: 200
		unit: "KM"
	options:
		time: animationDuration
		delay: 1.2
		
		

pointsWindbreaker.props =
	text: "+ {points}"
	opacity: 0
	
pointsWindbreaker.templateFormatter = 
	points: (value) ->
		Utils.round(value, 0)
		
pointsWindbreaker.animate
	opacity: 1
	template: 
		points: 200
	options:
		time: animationDuration
		delay: 1.8
		
pointsWindbreaker.onAnimationEnd ->
	showLevels()
		
		

badges.height = 452
Layer.select('lvl_progress_bar').width = 0
progressBarWidth = Layer.select('lvl_progress_bar_bg').width

showLevels = () ->
	badges.animate
		height: 320
		options:
			curve: Spring(tension: 200, friction: 30)
			
	Layer.select('lvl_progress_bar').animate
		width: (800 / 10000) * progressBarWidth
		options:
			delay: 0.5
			time: animationDuration
			curve: 'linear'
			
	lvl_progress_number.templateFormatter =
		points: (value) ->
			Utils.round(value, 0)
		
	lvl_progress_number.animate
		template:
			points: 800
		options:
			time: animationDuration
			curve: 'linear'
			delay: 0.5
		
		
lvl_progress_number.props =
	text: "{points} / 10000"
	
lvl_progress_number.template =
	points: 0
	

		
	
		
		
		

	
