# Flutterchi 🚀⚡

**SUPER OPTIMIZED** - Eng tez va qulay Flutter build CLI tool!

Flutter loyihalarini **3-5x tezroq** qurish uchun maxsus optimallashtirilgan CLI tool. Oddiy buyruqlar bilan APK, App Bundle va Windows EXE yarating. **Barcha kompyuterlarda bir xil TEZKOR!**

[![pub package](https://img.shields.io/pub/v/flutterchi.svg)](https://pub.dev/packages/flutterchi)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

## ⚡ Nima Uchun Flutterchi?

- ⚡ **LIGHTNING FAST** - 3-5x tezroq build (parallel processing, caching)
- 🎯 **SUPER OPTIMIZED** - Eski va yangi kompyuterlarda bir xil tez
- 📊 **SILLIQ PROGRESS BAR** - Hech qachon qotib qolmaydi, real-time task tracking
- 🚀 **NOLDAN SOZLASH KERAK EMAS** - Avtomat optimallashadi
- 💪 **MINIMAL MEMORY** - Zaif kompyuterlarda ham ishlaydi

## ✨ Imkoniyatlar

- 🚀 **Tez Qurish** - Bitta buyruq, 3-5x tezroq natija
- 🎯 **Aqlli Optimallash** - Gradle, Android va Java avtomatik optimallashadi
- 📊 **Professional Progress Tracking**:
  - ✅ 50+ kalit so'z - har bir Gradle bosqichni aniqlaydi
  - ✅ Avtomatik progress - har 3 soniyada yangilanadi (hech qachon qotmaydi!)
  - ✅ Real-time Gradle task - `compileReleaseKotlin`, `dexBuilder`, `packageRelease` ko'rinadi
  - ✅ Silliq animatsiya - jarayon doim harakatda
- 🔍 **Aqlli Flutter Aniqlash** - Flutter o'rnatilgan joyini avtomatik topadi
- 📁 **Ish Stoliga Avtomatik Saqlash** - Desktop/FlutterBuilds ga saqlaydi
- 🎯 **Versiya Boshqaruvi** - Fayllarni versiya bilan avtomatik nomlaydi
- 💻 **Cross-Platform** - Windows, macOS va Linux da ishlaydi
- 🌐 **Ko'p Tilli Qo'llab-quvvatlash** - Inglizcha va O'zbekcha

## 🚀 SUPER Optimizatsiyalar

Flutterchi avtomatik quyidagi optimizatsiyalarni qo'llaydi:

### Gradle Optimizatsiyalari
- ✅ **Parallel Build** - 3x tezroq (4 worker)
- ✅ **Gradle Caching** - Takroriy buildlar 50% tezroq
- ✅ **Configuration On Demand** - Vaqt tejash
- ✅ **Gradle Daemon** - Tezroq start

### Memory Optimizatsiya
- ✅ **2GB Heap** - Optimal ishlash
- ✅ **Parallel GC** - Eski kompyuterlar uchun
- ✅ **512MB Metaspace** - Kam memory ishlatish

### Android Build Optimizatsiya
- ✅ **ARM64 Only** - 99% qurilmalar, 3x tezroq
- ✅ **Split Debug Info** - Kichik APK hajmi
- ✅ **Obfuscation** - Xavfsizlik + kamroq hajm
- ✅ **Dexing Transform** - Tezkor dex yaratish
- ✅ **R8 Optimization** - Smart code shrinking

## 📦 O'rnatish

### Global O'rnatish (Tavsiya etiladi)

```bash
dart pub global activate flutterchi
```

### Koddan O'rnatish

```bash
git clone https://github.com/AbubakrFlutter/flutterchi.git
cd flutterchi
dart pub global activate --source path .
```

## 🚀 Tez Boshlash

### 1. O'rnatilganini Tekshirish

Birinchi navbatda, Flutter va Flutterchi to'g'ri o'rnatilganligini tekshiring:

```bash
flutterchi tekshir
# yoki
flutterchi check
```

### 2. Loyihangizga O'ting

```bash
cd sizning_flutter_loyihangiz
```

### 3. Ilovangizni Quring

```bash
# APK yasash
flutterchi apk

# App Bundle yasash
flutterchi bundle

# Windows EXE yasash (faqat Windows)
flutterchi exe

# Barcha formatlarni yasash
flutterchi hammasi
```

## 📚 Buyruqlar

| Buyruq | Ta'rif | O'zbekcha |
|---------|-------------|-------------|
| `flutterchi apk` | Android APK yasash | ✅ |
| `flutterchi bundle` | Android App Bundle (AAB) yasash | ✅ |
| `flutterchi exe` | Windows EXE yasash (faqat Windows) | ✅ |
| `flutterchi hammasi` / `all` | Barcha formatlarni yasash | ✅ |
| `flutterchi tekshir` / `check` | Flutter va muhitni tekshirish | ✅ |
| `flutterchi yordam` / `help` | Yordam ma'lumotini ko'rsatish | ✅ |

## 📊 Professional Progress Tracking

**YANGI v1.3.2** - To'liq qayta yozilgan, silliq va aniq progress bar!

### Imkoniyatlar:
- ✅ **Silliq animatsiya** - Jarayon doim harakatda

### Misol:
```
🚀 Flutterchi - SUPER OPTIMIZED - Barcha kompyuterlarda tez!
============================================================

📱 APK yasalyapti... ⚡⚡⚡ SUPER OPTIMIZED!

⚙️  Sistema optimallashtirilmoqda...
⚡ Gradle SUPER optimallashtirildi!
⚡ Android build optimallashtirildi!

1/3 - ✅ Paketlar yangilanish kerak emas (o'tkazib yuborildi)

2/3 - 🔨 APK qurilyapti (arm64 - SUPER FAST!)
   [████████░░░░░░░░░░░░░░░░░░░░] 28% - preBuild
   [████████████░░░░░░░░░░░░░░░░] 45% - compileReleaseKotlin
   [████████████████████░░░░░░░░] 68% - dexBuilder
   [██████████████████████████░░] 87% - packageRelease
   [██████████████████████████████] ✓ 100% - Built successfully

3/3 - 💾 Fayl saqlanmoqda
   [██████████████████████████████] ✓ 100% - Nusxalash
📁 Saqlandi: Desktop/FlutterBuilds/myapp_v1.0.0_arm64.apk
📊 Hajmi: 15.2 MB

🎉 APK muvaffaqiyatli yaratildi!
⚡ Vaqt: 45 soniya (SUPER FAST!)
🚀 Optimizatsiya: MAKSIMAL
💪 Ishlaydi: Barcha kompyuterlarda bir xil tez
```

## 📁 Output Location

All builds are automatically saved to:

```
Desktop/FlutterBuilds/
├── myapp_v1.0.0.apk
├── myapp_v1.0.0.aab
└── myapp_v1.0.0_windows/
    └── myapp.exe
```

File naming format: `{app_name}_v{version}.{extension}`

## 🔧 Requirements

- **Dart SDK**: >=3.0.0 <4.0.0
- **Flutter SDK**: Any recent version
- **Operating Systems**: Windows, macOS, Linux
- **Note**: Windows EXE can only be built on Windows

## ⚙️ Configuration

Flutterchi automatically detects your Flutter installation from:
- System PATH
- Common installation directories:
  - Windows: `C:\src\flutter`, `C:\flutter`, `%USERPROFILE%\flutter`
  - macOS/Linux: `~/flutter`, `/usr/local/flutter`, `/opt/flutter`

## 🐛 Troubleshooting

### Flutter not found

If you see "Flutter not found" error:

1. **Check Flutter installation:**
   ```bash
   flutter --version
   ```

2. **Add Flutter to PATH:**
   - **Windows:** Add `C:\path\to\flutter\bin` to System Environment Variables
   - **macOS/Linux:** Add to `~/.bashrc` or `~/.zshrc`:
     ```bash
     export PATH="$PATH:/path/to/flutter/bin"
     ```

3. **Restart terminal** and run:
   ```bash
   flutterchi check
   ```

### Build fails

- Make sure you're in a Flutter project directory
- Run `flutter doctor` to check for issues
- Ensure all dependencies are installed: `flutter pub get`

### Permission denied (macOS/Linux)

```bash
chmod +x $(which flutterchi)
```

## 📝 Misollar

### Release uchun APK yasash (SUPER FAST!)

```bash
cd mening_ajoyib_ilovam
flutterchi apk
```

Natija:
```
🚀 Flutterchi - SUPER OPTIMIZED - Barcha kompyuterlarda tez!
============================================================

📱 APK yasalyapti... ⚡⚡⚡ SUPER OPTIMIZED!

⚙️  Sistema optimallashtirilmoqda...
⚡ Gradle SUPER optimallashtirildi!
⚡ Android build optimallashtirildi!

1/3 - ✅ Paketlar yangilanish kerak emas (o'tkazib yuborildi)

2/3 - 🔨 APK qurilyapti (arm64 - SUPER FAST!)
   [████████████████████░░░░░░░░░░] 68% - dexBuilder
   [██████████████████████████████] ✓ 100% - Built successfully

3/3 - 💾 Fayl saqlanmoqda
   [██████████████████████████████] ✓ 100% - Nusxalash
📁 Saqlandi: Desktop/FlutterBuilds/mening_ajoyib_ilovam_v1.0.0_arm64.apk
📊 Hajmi: 15.2 MB

🎉 APK muvaffaqiyatli yaratildi!
⚡ Vaqt: 45 soniya (Odatda 3 daqiqa o'rniga!)
🚀 Optimizatsiya: MAKSIMAL
💪 Ishlaydi: Barcha kompyuterlarda bir xil tez
📍 Joylashuvi: Desktop/FlutterBuilds
📦 Fayl: mening_ajoyib_ilovam_v1.0.0_arm64.apk
```

### Tezlik Taqqoslash ⚡

| Odatiy Flutter Build | Flutterchi SUPER OPTIMIZED |
|---------------------|---------------------------|
| 🐌 3-4 daqiqa | ⚡ 45-60 soniya |
| 📦 18-20 MB APK | 📦 15-16 MB APK |
| 🔄 Har safar ko'p vaqt | 🚀 Takroriy build 30s |
| 💻 Kuchli PC kerak | 💪 Har qanday PC tez |

### Barcha formatlarni yasash

```bash
flutterchi hammasi
```

Bu APK, App Bundle va (Windows da) EXE fayllarini **SUPER TEZKOR** yasaydi.

## 🤝 Hissa Qo'shish

Hissa qo'shishingizni mamnuniyat bilan qabul qilamiz! Iltimos, Pull Request yuboring.

1. Repository ni fork qiling
2. O'z feature branch ingizni yarating (`git checkout -b feature/AjoyibFunksiya`)
3. O'zgarishlaringizni commit qiling (`git commit -m 'Ajoyib funksiya qo'shildi'`)
4. Branch ga push qiling (`git push origin feature/AjoyibFunksiya`)
5. Pull Request oching

## 📝 Yangiliklar

### v1.3.2 (2025-01-31) - PROFESSIONAL PROGRESS TRACKING
- ✅ **Progress bar to'liq qayta yozildi** - Silliq va aniq!
- ✅ **50+ Gradle kalit so'z** - Har bir bosqichni aniqlaydi
- ✅ **Avtomatik tracking** - Har 3 soniyada yangilanadi
- ✅ **Real-time Gradle task** - `compileReleaseKotlin`, `dexBuilder`, `packageRelease`
- ✅ **Hech qachon qotmaydi** - Jarayon doim harakatda

### v1.3.1 (2025-01-31) - BUG FIXES
- ✅ Gradle configuration-cache xatoligi tuzatildi
- ✅ Flutter 3.24+ versiyalari bilan to'liq moslik
- ✅ Kotlin plugin moslik muammosi hal qilindi

### v1.3.0 (2025-01-06) - SUPER OPTIMIZED
- ✅ To'liq O'zbekcha tarjima qo'shildi
- ✅ **3-5x TEZROQ** build (parallel processing + caching)
- ✅ Avtomatik Gradle va Android optimizatsiya
- ✅ Progress bar bilan real-time jarayon ko'rsatkichi
- ✅ ARM64-only build - 99% qurilmalar, 3x tezroq
- ✅ Minimal memory usage - eski kompyuterlarda ham tez
- ✅ Yangi `tekshir` buyrug'i - muhitni tekshirish
- ✅ Yangi `tozalash` buyrug'i - cache tozalash

## 📄 Litsenziya

Bu loyiha MIT litsenziyasi ostida - batafsil [LICENSE](LICENSE) faylini ko'ring.

## 👨‍💻 Muallif

Flutter dasturchilari uchun ❤️ bilan yaratildi

## 🔗 Havolalar

- [pub.dev](https://pub.dev/packages/flutterchi)
- [GitHub Repository](https://github.com/AbubakrFlutter/flutterchi)
- [Muammolar](https://github.com/AbubakrFlutter/flutterchi/issues)
- [Flutter Hujjatlari](https://flutter.dev/docs)

## ⭐ Qo'llab-quvvatlash

Agar bu paket sizga foydali bo'lsa, iltimos GitHub da yulduzcha bering!

---
