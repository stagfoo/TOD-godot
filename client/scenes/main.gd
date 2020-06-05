extends Node

const DEFAULT_IP = '127.0.0.1'
const DEFAULT_PORT = 5000
var rng = RandomNumberGenerator.new()
var your_server_id

func _ready():
	rng.randomize()
	set_network_master(1)	
	connect_to_server()

func connect_to_server():
	var peer = NetworkedMultiplayerENet.new()
	peer.create_client(DEFAULT_IP, DEFAULT_PORT)
	get_tree().set_network_peer(peer)
	get_tree().connect('connected_to_server', self, '_connected_to_server')

func _connected_to_server():
	print("Connected")

remote func createPlayer(user):
	_Globals.current_user = user
	var id = user.id
	print("Creating " + String(id))
	var newClient = load("res://player/player.tscn").instance()
	newClient.set_name(str(id))
	get_node("Spatial").add_child(newClient)

remote func getUsername(id):
		_Globals.connection_id = id	
		rpc_id(1, "setUsername", {
			"id": id,
			"username":_Globals.username
			})
	
remote func createSlave(id):
	print("Creating " + String(id))
	var newClient = load("res://player/slave.tscn").instance()
	newClient.set_name(str(id))
	
	get_node("Spatial").add_child(newClient)
	
remote func createOtherPlayers(players):
	_Globals.players = players
	var current_nodes = get_node("Spatial").get_children()
	var rendered = []
	for nodes in current_nodes:
		rendered.append(int(nodes.name))
	for i in players:
			if(rendered.has(i)):
				print("already rendered")
			else:
				if(i != _Globals.connection_id):
					createSlave(i)

remote func removeNode(id):
	get_node(id).queue_free()
