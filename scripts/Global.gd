extends Node

var secili_parsel = 0
var parsel_suresi = 60.0

var envanter = {
	"odun": 0,
	"tas": 0,
	"komur": 0,
	"demir": 0,
	"altin": 0,
	"para": 0
}

func kaynak_ekle(kaynak_adi, miktar):
	if envanter.has(kaynak_adi):
		envanter[kaynak_adi] += miktar
		print(kaynak_adi, " sayisi: ", envanter[kaynak_adi])

func kaynak_cikar(kaynak_adi, miktar):
	if envanter.has(kaynak_adi):
		if envanter[kaynak_adi] >= miktar:
			envanter[kaynak_adi] -= miktar
			return true
	return false

func kaynak_sayisi(kaynak_adi):
	if envanter.has(kaynak_adi):
		return envanter[kaynak_adi]
	return 0
