# O'zgarishlar Tarixi / Changelog

Bu loyihadagi barcha muhim o'zgarishlar shu faylda qayd etiladi.

Format [Keep a Changelog](https://keepachangelog.com/en/1.0.0/) asosida,
va bu loyiha [Semantic Versioning](https://semver.org/spec/v2.0.0.html) ga rioya qiladi.

## [1.2.0] - 2025-01-06

### Qo'shildi / Added
- ✅ To'liq O'zbekcha tarjima (Inglizcha bilan birga)
- ✅ Real-time progress bar bilan jarayon ko'rsatkichi
- ✅ 4 bosqichli qurish jarayoni (Tozalash, Paketlar, Qurish, Nusxalash)
- ✅ Fayllar nusxalash vaqtida progress bar
- ✅ Yangi `hammasi` buyrug'i (o'zbekcha)
- ✅ Yangi `tekshir` buyrug'i (o'zbekcha)
- ✅ Yangi `yordam` buyrug'i (o'zbekcha)

### Yaxshilandi / Improved
- ✅ Xato xabarlari yanada tushunarli va yordam beruvchi
- ✅ Natija xabarlari ko'proq ma'lumot beradi
- ✅ Progress bar animatsiyasi yaxshilandi
- ✅ Barcha funksiya nomlari o'zbekcha
- ✅ Barcha output xabarlari ikki tilda

### Texnik O'zgarishlar / Technical
- O'zbek tilida funksiya nomlari: `_apkYasash()`, `_loyihaMalumotiniOlish()`
- Progress bar funksiyasi: `_progressBarniKorsatish()`
- Buyruq ishlatish funksiyasi: `_buyruqniIshgaTushirish()`
- Papka nusxalash: `_papkaniKochirish()`

## [1.0.0] - 2025-01-05

### Qo'shildi / Added
- Birinchi versiya chiqarildi
- APK qurish buyrug'i
- App Bundle (AAB) qurish buyrug'i
- Windows EXE qurish buyrug'i
- Barcha formatlarni qurish buyrug'i
- Muhitni tekshirish buyrug'i
- Aqlli Flutter yo'lini aniqlash
- Ish stoliga avtomatik saqlash (Desktop/FlutterBuilds)
- Qurish vaqtida jarayonni kuzatish
- Versiya bilan avtomatik fayl nomlash
- Cross-platform qo'llab-quvvatlash (Windows, macOS, Linux)
- Keng qamrovli xatolarni boshqarish
- Yechim bilan foydali xato xabarlari

### Imkoniyatlar / Features
- `flutterchi apk` - Android APK yasash
- `flutterchi bundle` - Android App Bundle yasash
- `flutterchi exe` - Windows EXE yasash
- `flutterchi all` / `hammasi` - Barcha formatlarni yasash
- `flutterchi check` / `tekshir` - Muhitni tekshirish
- `flutterchi help` / `yordam` - Yordam ko'rsatish

### Hujjatlar / Documentation
- To'liq README misollari bilan
- O'rnatish qo'llanmasi
- Muammolarni hal qilish bo'limi
- Foydalanish misollari
- Hissa qo'shish qo'llanmasi
- O'zbekcha va inglizcha qo'llab-quvvatlash

## [Rejalashtirilgan] / [Unreleased]

### Rejadagi Imkoniyatlar / Planned Features
- iOS qurish qo'llab-quvvatlanishi
- Maxsus chiqish papkasi opsiyasi
- Qurish konfiguratsiya fayli
- Obfuskatsiya qo'llab-quvvatlanishi
- Har bir ABI uchun ajratilgan APK
- Avtomatik versiya oshirish
- Qurish statistikasi
- CI/CD integratsiya yordamchilari
- Telegram bot integratsiyasi
- Firebase App Distribution integratsiyasi