extends Area2D

var oyuncu_yakinda = false

func _ready():
	body_entered.connect(_oyuncu_girdi)
	body_exited.connect(_oyuncu_cikti)

func _process(_delta):
	if oyuncu_yakinda and Input.is_action_just_pressed("building_interact"):
		GlobalUI.etkilesim_gizle()

		var parsel_ui = get_parent().get_node_or_null("UI/ParselSecimUI")
		if parsel_ui != null:
			parsel_ui.ac()

func _oyuncu_girdi(body):
	if body.name == "Player":
		oyuncu_yakinda = true
		GlobalUI.etkilesim_goster("G")

func _oyuncu_cikti(body):
	if body.name == "Player":
		oyuncu_yakinda = false
		GlobalUI.etkilesim_gizle()
