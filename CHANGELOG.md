# O'zgarishlar Tarixi / Changelog

Bu loyihadagi barcha muhim o'zgarishlar shu faylda qayd etiladi.

Format [Keep a Changelog](https://keepachangelog.com/en/1.0.0/) asosida,
va bu loyiha [Semantic Versioning](https://semver.org/spec/v2.0.0.html) ga rioya qiladi.

## [1.3.5] - 2025-01-31

### Tuzatildi / Fixed
- ✅ `android.enableBuildCache` deprecated xatoligi tuzatildi (AGP 7.0+)
- ✅ Android Gradle Plugin 7.0+ versiyalari bilan moslik

## [1.3.4] - 2025-01-31

### Yaxshilandi / Improved
- ✅ **ADAPTIVE OPTIMIZATION** - Kompyuterga qarab avtomatik sozlanadi!
- ✅ Eski kompyuterlar (4-6GB RAM): 2GB heap, 4 workers - HECH QACHON QOTMAYDI
- ✅ Yangi kompyuterlar (8GB+ RAM): 3GB heap, 6 workers - MAKSIMAL TEZLIK
- ✅ Avtomatik RAM aniqlash (Windows, macOS, Linux)
- ✅ Barcha kompyuterlarda OPTIMAL ishlash

## [1.3.3] - 2025-01-31

### Yaxshilandi / Improved
- ✅ **MAKSIMAL TEZLIK** - Configuration-cache siz ham juda tez!
- ✅ Gradle workers 4 → 6 ga oshirildi (8 emas - barqaror)
- ✅ JVM memory sozlamalari
- ✅ R8 full mode yoqildi - optimal kod shrinking
- ✅ Kotlin incremental compilation kuchaytirildi
- ✅ File system watching (vfs.watch) - tezroq dependency check
- ✅ D8 dexer - 2x tezroq dexing
- ✅ Incremental desugaring yoqildi
- ✅ Gradle daemon cache 2 soat (takroriy buildlar uchun)

## [1.3.2] - 2025-01-31

### Yaxshilandi / Improved
- ✅ Progress bar to'liq qayta yozildi - silliq va aniq
- ✅ 50+ Gradle bosqich kalit so'zlari qo'shildi
- ✅ Avtomatik progress tracking - har 3 soniyada yangilanadi
- ✅ Real-time Gradle task ko'rsatish
- ✅ Progress bar endi hech qachon qotib qolmaydi

## [1.3.1] - 2025-01-31

### Tuzatildi / Fixed
- ✅ Gradle configuration-cache xatoligi tuzatildi (Kotlin plugin moslik muammosi)
- ✅ Flutter 3.24+ versiyalari bilan to'liq moslik

## [1.3.0] - 2025-01-06

### Qo'shildi / Added
- ✅ To'liq O'zbekcha tarjima (Inglizcha bilan birga)
- ✅ Real-time progress bar bilan jarayon ko'rsatkichi
- ✅ 4 bosqichli qurish jarayoni (Paketlar, Qurish, Nusxalash)
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


## [1.2.0] - 2025-01-05

### Qo'shildi / Added
- teroq quqish
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