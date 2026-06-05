extends Area2D

var oyuncu_yakinda = false

func _ready():
	body_entered.connect(_oyuncu_girdi)
	body_exited.connect(_oyuncu_cikti)

func _process(_delta):
	if oyuncu_yakinda and Input.is_action_just_pressed("cart_interact"):
		print("Kasabaya donuluyor")
		GlobalUI.etkilesim_gizle()
		GlobalUI.sure_gizle()
		get_tree().change_scene_to_file("res://scenes/Kasaba.tscn")

func _oyuncu_girdi(body):
	if body.name == "Player":
		oyuncu_yakinda = true
		GlobalUI.etkilesim_goster("F")

func _oyuncu_cikti(body):
	if body.name == "Player":
		oyuncu_yakinda = false
		GlobalUI.etkilesim_gizle()
