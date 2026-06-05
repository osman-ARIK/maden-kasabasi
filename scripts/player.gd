extends CharacterBody2D

const HIZ = 200.0
const ZIPLAMA_GUCU = -400.0
const YERCEKIMI = 980.0

var hareket_aktif = true
var baktigi_yon = 1

func _ready():
	GlobalUI.envanter_guncelle()

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += YERCEKIMI * delta

	if not hareket_aktif:
		velocity.x = 0
		move_and_slide()
		return

	var yon = 0

	if Input.is_action_pressed("move_left"):
		yon = -1
		baktigi_yon = -1
	elif Input.is_action_pressed("move_right"):
		yon = 1
		baktigi_yon = 1

	velocity.x = yon * HIZ

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = ZIPLAMA_GUCU

	move_and_slide()

func hareketi_ayarla(durum):
	hareket_aktif = durum

func kaynak_ekle(kaynak_adi, miktar):
	Global.kaynak_ekle(kaynak_adi, miktar)
	GlobalUI.envanter_guncelle()
