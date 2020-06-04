extends KinematicBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass
remote func _update_client_position(data):
		Globals.players[data.id].position = data.position
		rpc_id(data.id, "updatePlayersPosition", Globals.players)
