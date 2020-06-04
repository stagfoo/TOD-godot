extends Node

const PORT        = 5000
const MAX_PLAYERS = 200

func _ready():
	var server = NetworkedMultiplayerENet.new()
	server.create_server(PORT, MAX_PLAYERS)
	get_tree().set_network_peer(server)
	get_tree().connect("network_peer_connected",    self, "_client_connected"   )
	get_tree().connect("network_peer_disconnected", self, "_client_disconnected")

func _client_connected(id):
	Globals.players[id] = {
		"id": id,
		"position": Vector3()
	}
	print('Client ' + str(id) + ' ' + ' connected to Server')
	rpc_id(id, "getUsername", id)
	var newClient = load("res://remote_client.tscn").instance()
	newClient.set_name(str(id))     # spawn players with their respective names
	get_node("Spatial").add_child(newClient)

remote func setUsername(data):
	var user =  Globals.users[data.username]
	user.id = data.id
	user.username = data.username
	Globals.players[data.id] = user
	rpc_id(data.id, "createPlayer", user)
	for i in Globals.players:
		rpc_id(i, "createOtherPlayers", Globals.players)

func _client_disconnected(id):
	Globals.players.erase(id)
	for i in Globals.players:
		rpc_id(i, "removeNode", id)
	pass
