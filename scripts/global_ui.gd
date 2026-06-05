extends CanvasLayer

@onready var envanter_label = $EnvanterLabel
@onready var sure_label = $SureLabel
@onready var etkilesim_label = $EtkilesimLabel

func _ready():
	envanter_guncelle()
	sure_gizle()
	etkilesim_gizle()

func envanter_guncelle():
	var yazi = ""
	yazi += "Odun: " + str(Global.kaynak_sayisi("odun")) + "\n"
	yazi += "Tas: " + str(Global.kaynak_sayisi("tas")) + "\n"
	yazi += "Komur: " + str(Global.kaynak_sayisi("komur")) + "\n"
	yazi += "Demir: " + str(Global.kaynak_sayisi("demir")) + "\n"
	yazi += "Altin: " + str(Global.kaynak_sayisi("altin")) + "\n"
	yazi += "Para: " + str(Global.kaynak_sayisi("para"))
	envanter_label.text = yazi

func sure_goster(sure):
	sure_label.visible = true
	sure_label.text = "Sure: " + str(int(sure))

func sure_gizle():
	sure_label.visible = false

func etkilesim_goster(tus):
	etkilesim_label.visible = true
	etkilesim_label.text = "[" + tus + "]"

func etkilesim_gizle():
	etkilesim_label.visible = false
