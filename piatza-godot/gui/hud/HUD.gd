extends TextureRect

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func _physics_process(delta):
#	if(get_node("coins").text != str(PlayerVars.points)):
#		get_node("coinSound").play()
#		pass
	get_node("coins").text = str(PlayerVars.points)
	pass
