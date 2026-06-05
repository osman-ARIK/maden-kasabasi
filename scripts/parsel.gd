extends Node2D

@onready var sure_sayaci = $SureSayaci
@onready var maden_haritasi = $MadenHaritasi
@onready var player = $Player

var kalan_sure = 0.0
var blok_canlari = {}

var tile_bilgileri = {
	"tas": {"source_id": 2, "coords": Vector2i(0, 0)},
	"komur": {"source_id": 3, "coords": Vector2i(0, 0)},
	"demir": {"source_id": 4, "coords": Vector2i(0, 0)},
	"altin": {"source_id": 5, "coords": Vector2i(0, 0)}
}

var maden_baslangic_x = -2
var maden_baslangic_y = 9
var maden_genislik = 22
var maden_yukseklik = 16

func _ready():
	kalan_sure = Global.parsel_suresi

	sure_sayaci.wait_time = 1.0
	sure_sayaci.timeout.connect(_her_saniye)
	sure_sayaci.start()

	GlobalUI.sure_goster(kalan_sure)
	rastgele_maden_olustur()

func rastgele_maden_olustur():
	for x in range(maden_genislik):
		for y in range(maden_yukseklik):
			var hucre = Vector2i(maden_baslangic_x + x, maden_baslangic_y + y)
			var tile_adi = rastgele_maden_sec(y)

			var bilgi = tile_bilgileri[tile_adi]
			maden_haritasi.set_cell(1, hucre, bilgi["source_id"], bilgi["coords"])

func rastgele_maden_sec(derinlik: int) -> String:
	var sans = randi() % 100

	if derinlik < 4:
		if sans < 50:
			return "tas"
		elif sans < 80:
			return "komur"
		elif sans < 97:
			return "demir"
		else:
			return "altin"

	elif derinlik < 10:
		if sans < 30:
			return "tas"
		elif sans < 55:
			return "komur"
		elif sans < 85:
			return "demir"
		else:
			return "altin"

	else:
		if sans < 15:
			return "tas"
		elif sans < 35:
			return "komur"
		elif sans < 65:
			return "demir"
		else:
			return "altin"

func _process(_delta):
	if Input.is_action_just_pressed("mine_interact"):
		kazi_yap()

func kazi_yap():
	var mouse_pos = get_global_mouse_position()
	var hedef_local = maden_haritasi.to_local(mouse_pos)
	var hucre = maden_haritasi.local_to_map(hedef_local)

	var tile_data = maden_haritasi.get_cell_tile_data(1, hucre)

	if tile_data == null:
		return

	var kirilabilir = tile_data.get_custom_data("kirilabilir")
	if not kirilabilir:
		return

	var tur = str(tile_data.get_custom_data("tur"))
	var dayaniklilik = int(tile_data.get_custom_data("dayaniklilik"))

	if not blok_canlari.has(hucre):
		blok_canlari[hucre] = dayaniklilik

	blok_canlari[hucre] -= 1
	print(tur, " kaziliyor. Kalan vurus: ", blok_canlari[hucre])

	if blok_canlari[hucre] <= 0:
		maden_haritasi.erase_cell(1, hucre)
		blok_canlari.erase(hucre)

		Global.kaynak_ekle(tur, 1)
		GlobalUI.envanter_guncelle()
		print(tur, " cikarildi!")

func _her_saniye():
	kalan_sure -= 1
	GlobalUI.sure_goster(kalan_sure)

	if kalan_sure <= 0:
		print("Sure bitti! Kasabaya donuluyor")
		GlobalUI.sure_gizle()
		get_tree().change_scene_to_file("res://scenes/Kasaba.tscn")
