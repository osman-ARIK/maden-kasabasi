<div align="center">

# ⛏️ Maden Kasabası

**Terk edilmiş bir maden kasabasını yeniden ayağa kaldırmaya çalıştığın 2D madencilik oyunu.**  
Godot 4 ile geliştiriliyor.

<br>

![Engine](https://img.shields.io/badge/Engine-Godot_4.x-478cbf?logo=godot-engine&logoColor=white)
![Language](https://img.shields.io/badge/Language-GDScript-6c5ce7)
![Style](https://img.shields.io/badge/Art-Pixel_Art-ff9f43)
![Status](https://img.shields.io/badge/Status-Early_Development-orange)
![Platform](https://img.shields.io/badge/Platform-PC-lightgrey)
![Copyright](https://img.shields.io/badge/Copyright-All_Rights_Reserved-red)

</div>

---

## 📌 Oyun Hakkında

**Maden Kasabası**, çökmüş bir maden kasabasını yeniden canlandırma fikri etrafında şekillenen bir 2D madencilik oyunudur.

Bir zamanlar zengin maden yataklarıyla bilinen bu kasaba artık neredeyse tamamen tükenmiştir.  
Dükkanlar kapanmış, halk yoksullaşmış, üretim durmuş ve umut azalmıştır.

Sen ise uzaktan gelen genç bir madencisin.

Amacın:
- maden parsellerine gitmek,
- kaynak toplamak,
- kasabaya geri dönmek,
- kaynakları satmak,
- para kazanmak,
- kasabaya yatırım yaparak her şeyi yeniden ayağa kaldırmak.

---

## 🎮 Oynanış Döngüsü

```text
Kasaba → Parsele Git → Maden Kaz → Kasabaya Dön → Sat → Para Kazan → Kasabaya Yatırım Yap
```

Oyunun temel yapısı kısa ama tatmin edici bir ilerleme hissi üzerine kuruludur.

- Parsellerde süreli madencilik yapılır
- Derinliğe göre maden türleri değişir
- Daha değerli kaynaklar daha riskli ve derin katmanlarda bulunur
- Kasabaya dönülerek ekonomik ilerleme sağlanır
- Zamanla daha iyi ekipmanlar, yeni parseller ve yeni sistemler açılır

---

## 📖 Hikaye Özeti

Bir zamanlar madenleriyle ünlü olan küçük bir kasaba, kaynakların tükenmesiyle çöküşe sürüklenmiştir.  
İnsanlar yoksullaşmış, üretim durmuş ve şehir neredeyse kaderine terk edilmiştir.

Sen bu kasabaya dışarıdan gelen genç bir madencisin.  
Amacın sadece zengin olmak değil, aynı zamanda bu kasabayı tekrar yaşanır hale getirmektir.

Kaz, çıkar, sat, geliştir ve kasabayı yeniden ayağa kaldır.

---

## 🕹️ Kontroller

| Tuş | Aksiyon |
| :-- | :-- |
| `A` / `D` | Sola / Sağa yürü |
| `Space` | Zıpla |
| `Sol Tık` | Maden kaz |
| `E` | Ağaç kes |
| `F` | At arabası / Çıkış noktası ile etkileşim |
| `G` | Belediye binası ile etkileşim |
| `Esc` | UI kapatma / geri çıkma |

---

## 🧱 Teknik Yapı

- **Motor:** Godot 4.x
- **Dil:** GDScript
- **Görsel stil:** Pixel Art
- **Tile boyutu:** 32x32
- **Texture Filter:** Nearest
- **Sahne sistemi:** Kasaba ↔ Parsel geçişi
- **Veri saklama:** `Global.gd` autoload
- **UI sistemi:** `GlobalUI.tscn` autoload
- **Madencilik altyapısı:** TileMap / TileSet tabanlı kırılabilir blok sistemi
- **Envanter yapısı:** Dictionary tabanlı global envanter
- **Maden mantığı:** Derinliğe göre rastgele kaynak dağılımı

---

## ⛏️ Mevcut Özellikler

### Kasaba
- [x] Oyuncu hareketi
- [x] Zıplama
- [x] Ağaç kesme
- [x] Odun toplama
- [x] At arabası ile parsele gitme
- [x] Belediye binası etkileşimi
- [x] Etkileşim tuşu göstergeleri

### Parsel
- [x] Süreli madencilik alanı
- [x] Süre sayacı
- [x] Süre bitince otomatik dönüş
- [x] Çıkış noktası ile erken dönüş
- [x] TileMap tabanlı maden üretimi
- [x] Sabit zemin + ayrı kırılabilir maden katmanı
- [x] Mouse ile blok kırma
- [x] Dayanıklılık sistemi
- [x] Derinliğe göre maden değeri değişimi
- [x] Kırılan bloktan envantere kaynak ekleme

### Genel
- [x] Global envanter sistemi
- [x] Sahneler arası veri koruma
- [x] Merkezi UI sistemi
- [x] Kaynak türleri:
  - [x] Odun
  - [x] Taş
  - [x] Kömür
  - [x] Demir
  - [x] Altın
  - [x] Para

---

## 🌍 Maden Sistemi

Oyundaki madencilik sistemi, tek tek obje yerleştirmek yerine **TileMap / TileSet tabanlı** olarak tasarlanmıştır.

Bu yaklaşım sayesinde:
- daha performanslı bir yapı elde edilir
- çok daha büyük maden alanları oluşturulabilir
- 2D blok mantığı daha temiz yönetilir
- dayanıklılık, kırılabilirlik ve kaynak türü gibi bilgiler tile custom data ile saklanabilir

### Kullanılan Katmanlar
- **Layer 0:** Sabit zemin  
  Çimen ve toprak gibi elle yerleştirilen, kırılmayan bloklar
- **Layer 1:** Kırılabilir madenler  
  Taş, kömür, demir ve altın gibi rastgele oluşturulan bloklar

### Derinlik Mantığı
- Üst katmanlarda sıradan madenler daha fazla bulunur
- Aşağı indikçe değerli kaynakların oranı artar
- Altın en üstte çok nadirdir, daha derinlerde daha sık görülür

---

## 📁 Proje Yapısı

```text
project/
├── scenes/
│   ├── Kasaba.tscn
│   ├── Parsel.tscn
│   ├── Player.tscn
│   ├── Agac.tscn
│   ├── AtArabasi.tscn
│   ├── BelediyeBinasi.tscn
│   ├── CikisNoktasi.tscn
│   ├── GlobalUI.tscn
│   └── ParselSecimUI.tscn
├── scripts/
│   ├── Global.gd
│   ├── GlobalUI.gd
│   ├── Player.gd
│   ├── Agac.gd
│   ├── AtArabasi.gd
│   ├── BelediyeBinasi.gd
│   ├── CikisNoktasi.gd
│   └── Parsel.gd
└── assets/
    ├── cimen.png
    ├── toprak.png
    ├── tas.png
    ├── komur.png
    ├── demir.png
    └── altin.png
```

---

## 🚧 Geliştirme Yol Haritası

Aşağıdaki sistemler planlanmaktadır:

- [ ] Tüccar NPC ve satış sistemi
- [ ] Para ekonomisi
- [ ] Parsel özet ekranı
- [ ] Maden menzil sınırı
- [ ] Parsel satın alma / kör alım sistemi
- [ ] Demirci ve alet geliştirme
- [ ] Kasaba yatırım sistemi
- [ ] NPC diyalogları
- [ ] Görev sistemi
- [ ] AI rakip madenciler
- [ ] Save / Load sistemi
- [ ] Sprite animasyonları
- [ ] Çevresel tehlikeler (gaz, çökme vb.)

---

## 🎯 Uzun Vadeli Vizyon

Bu proje yalnızca basit bir “kaz ve sat” oyunu olarak düşünülmemektedir.

Ana hedef:
- **çöken bir kasabayı yeniden canlandırmak**
- **ekonomik ilerleme hissi vermek**
- **oyuncuya stratejik kararlar aldırmak**
- **her parseli potansiyel bir risk / ödül alanı haline getirmek**
- **madenciliği sadece kaynak toplamak değil, yatırım kararı haline dönüştürmek**

İlerleyen sürümlerde:
- kasabadaki dükkanların açılması,
- farklı karakterlerin gelmesi,
- parsel satın alma sistemleri,
- gelişmiş ekipmanlar,
- rakip madenciler,
- daha güçlü ilerleme mekanikleri
eklenmesi planlanmaktadır.

---

## 🧪 Geliştirme Durumu

Oyun şu anda **erken geliştirme aşamasındadır**.

Çekirdek oynanış sistemleri kurulmaktadır:
- hareket
- etkileşim
- maden kazma
- kaynak toplama
- parsel döngüsü
- temel veri saklama sistemi

Hikaye, ekonomi derinliği, NPC sistemleri ve kasaba geliştirme mekanikleri sonraki aşamalarda genişletilecektir.

---

## 🛠️ Kurulum / Çalıştırma

1. Bu repoyu indir veya klonla
2. Godot 4.x ile aç
3. Projeyi çalıştır
4. Oynanış testlerine başla

```bash
git clone <repo-linki>
```

---

## 📝 Telif ve Kullanım

**Copyright © 2026 [Adın veya kullanıcı adın]. Tüm hakları saklıdır.**

Bu depo yalnızca proje geliştirme sürecini göstermek amacıyla yayınlanmıştır.

Bu projedeki:
- kodlar,
- görseller,
- assetler,
- yazılar,
- tasarımlar,
- oyun mekanikleriyle ilgili somut içerikler
izinsiz olarak kopyalanamaz, dağıtılamaz, değiştirilemez, yeniden kullanılamaz ve herhangi bir kişisel ya da ticari projede kullanılamaz.

Bu repo için açık kaynak lisansı verilmemiştir.  
Açık yazılı izin olmadan herhangi bir kullanım hakkı tanınmaz.

---

## ✨ Not

Bu proje aktif geliştirme altındadır.  
Geri bildirimler, fikirler ve gözlemler değerlidir; ancak proje içeriğinin izinsiz kullanımı yasaktır.

---

<div align="center">

### *"Terk edilmiş madenlerde servet, çökmüş kasabada umut var."*

</div>
