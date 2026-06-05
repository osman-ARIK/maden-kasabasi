# ⛏️ Maden Kasabası

**Godot 4 ile geliştirilen 2D madencilik ve kasaba geliştirme oyunu**

---

## 🎮 Oyun Hakkında

*Maden Kasabası*, çökmüş bir maden kasabasını yeniden ayağa kaldırmayı konu alan bir 2D madencilik oyunudur.

Oyuncu, kaynak toplar, maden kazıları yapar, kazandığı kaynakları satar ve kasabaya yatırım yaparak ekonomiyi yeniden inşa eder.

---

## 🔁 Temel Oyun Döngüsü

Kasaba → Maden Parseli → Madencilik → Kasabaya Dönüş → Satış → Gelişim → Yeni Yatırım

---

## ⚙️ Öne Çıkan Özellikler

* 🪨 TileMap tabanlı madencilik sistemi (performanslı ve ölçeklenebilir yapı)
* ⛏️ Derinliğe göre değişen kaynak dağılımı
* 💰 Kaynak toplama ve ekonomi sistemi
* 🏘️ Kasaba geliştirme mekaniği
* 🎒 Global envanter sistemi (Dictionary tabanlı)
* 🔄 Sahneler arası veri koruma (autoload sistem)
* 🖱️ Mouse ile blok kırma mekaniği
* ⏱️ Süreli madencilik alanları (risk / ödül dengesi)

---

## 🧱 Teknik Yapı

* **Engine:** Godot 4.x
* **Dil:** GDScript
* **Görsel Stil:** Pixel Art (32x32 tile)
* **Mimari:** Scene-based yapı + Autoload global sistemler
* **Veri Yönetimi:** Global.gd + Dictionary inventory

---

## 🌍 Sistemler

### ⛏️ Madencilik

* TileMap tabanlı kırılabilir blok sistemi
* Derinliğe göre rastgele maden üretimi
* Farklı kaynak türleri (taş, kömür, demir, altın)
* Dayanıklılık sistemi

### 🏘️ Kasaba

* Kaynak satışı ve para kazanma
* NPC etkileşim sistemleri (geliştirme aşamasında)
* Kasaba geliştirme altyapısı

### 🎒 Envanter

* Global envanter sistemi
* Sahneler arası veri taşınması
* Kaynak bazlı ekonomi yapısı

---

## 🧪 Geliştirme Durumu

Oyun **erken geliştirme aşamasındadır**.

Şu anda tamamlanan sistemler:

* Oyuncu hareketi
* Madencilik mekaniği
* Kaynak toplama
* Kasaba ↔ maden geçiş sistemi
* Temel envanter sistemi

Geliştirme aşamasında olan sistemler:

* NPC ve görev sistemi
* Ekonomi derinliği
* Ekipman geliştirme
* Save/Load sistemi
* Kasaba büyüme sistemi

---

## 🎯 Tasarım Hedefi

Bu proje sadece “kaz ve sat” mekaniği değil, aynı zamanda:

* ekonomik ilerleme hissi
* risk / ödül dengesi
* uzun vadeli kasaba geliştirme sistemi
* stratejik kaynak yönetimi

sunmayı hedefler.

---

## 📁 Proje Yapısı

```
scenes/
scripts/
assets/
```

(Detaylı yapı geliştirme sürecinde sade tutulmuştur.)

---

## 🚧 Kurulum

1. Repo’yu klonla
2. Godot 4.x ile aç
3. Main scene’i çalıştır
4. Oyunu test et

---

## 📝 Not

Bu proje aktif geliştirme aşamasındadır.
Geri bildirimler ve teknik öneriler değerlidir.

---

**“Terk edilmiş bir kasabayı yeniden inşa et.”**

© 2026 — Tüm hakları saklıdır.
