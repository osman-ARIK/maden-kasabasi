extends Control

@onready var parsel1_button = $Panel/VBoxContainer/Parsel1Button
@onready var parsel2_button = $Panel/VBoxContainer/Parsel2Button
@onready var kapat_button = $Panel/VBoxContainer/KapatButton

func _ready():
	visible = false

	parsel1_button.pressed.connect(_on_parsel1_pressed)
	parsel2_button.pressed.connect(_on_parsel2_pressed)
	kapat_button.pressed.connect(_on_kapat_pressed)

func ac():
	visible = true

	var player = get_tree().current_scene.get_node_or_null("Player")
	if player != null:
		player.hareketi_ayarla(false)

func kapat():
	visible = false

	var player = get_tree().current_scene.get_node_or_null("Player")
	if player != null:
		player.hareketi_ayarla(true)

func _process(delta):
	if visible and Input.is_action_just_pressed("ui_cancel"):
		kapat()

func _on_parsel1_pressed():
	print("Parsel 1 secildi")
	get_tree().change_scene_to_file("res://scenes/Parsel.tscn")

func _on_parsel2_pressed():
	print("Parsel 2 secildi")
	get_tree().change_scene_to_file("res://scenes/Parsel.tscn")

func _on_kapat_pressed():
	kapat()
