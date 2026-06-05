extends Area2D

var oyuncu_yakinda = false
var oyuncu_referansi = null

func _ready():
	body_entered.connect(_oyuncu_girdi)
	body_exited.connect(_oyuncu_cikti)

func _process(_delta):
	if oyuncu_yakinda and Input.is_action_just_pressed("tree_interact"):
		print("Agac kesildi")
		oyuncu_referansi.kaynak_ekle("odun", 1)
		GlobalUI.etkilesim_gizle()
		queue_free()

func _oyuncu_girdi(body):
	if body.name == "Player":
		oyuncu_yakinda = true
		oyuncu_referansi = body
		GlobalUI.etkilesim_goster("E")

func _oyuncu_cikti(body):
	if body.name == "Player":
		oyuncu_yakinda = false
		oyuncu_referansi = null
		GlobalUI.etkilesim_gizle()
