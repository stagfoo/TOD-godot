extends ItemList

onready var START_BUTTON = get_node("Start Game")
onready var END_BUTTON =  get_node("End Game")
onready var ALEX_BUTTON =  get_node("Alex")
onready var JOSH_BUTTON =  get_node("Josh")

func _ready():
	pass

func _process(delta):
	pass
func _on_Button_pressed():
	if(START_BUTTON.pressed):
		_Globals.goto_scene("res://scenes/main.tscn")
		return
	if(ALEX_BUTTON.pressed):
		_Globals.username = "alex"
		_Globals.goto_scene("res://scenes/main.tscn")
		return
	if(JOSH_BUTTON.pressed):
		_Globals.username = "josh"
		_Globals.goto_scene("res://scenes/main.tscn")
		return
	if(END_BUTTON.pressed):
		get_tree().quit()
		return
	pass


func _on_name_text_changed():
	_Globals.username = get_node("name").text
	pass # Replace with function body.
