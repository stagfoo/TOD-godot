extends KinematicBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var intName


# Called when the node enters the scene tree for the first time.
func _ready():
	print("OBJECT NAME:")
	intName = int(get_node(".").name)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(_Globals.players.has(intName)):
		transform.origin = _Globals.players[intName].position
	pass
