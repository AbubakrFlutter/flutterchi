# Flutterchi Misollar / Examples

## Asosiy Foydalanish / Basic Usage

### 1. Muhitni Tekshirish / Check Environment

Flutterchi dan foydalanishdan oldin, Flutter o'rnatilganligini tekshiring:

```bash
flutterchi tekshir
# yoki / or
flutterchi check
```

Kutilayotgan natija / Expected output:
```
🚀 Flutterchi - Flutter Loyihalarni Qurishda Yordam Beruvchi
============================================================

🔍 Muhitni tekshiryapman...

✅ Flutter topildi: flutter

📋 Flutter doctor ishga tushiryapman...

Doctor summary (to see all details, run flutter doctor -v):
[✓] Flutter (Channel stable, 3.10.0, on macOS 13.0)
[✓] Android toolchain - develop for Android devices
[✓] Xcode - develop for iOS and macOS
[✓] Chrome - develop for the web
[✓] Android Studio (version 2023.1)
[✓] VS Code (version 1.85.0)
[✓] Connected device (3 available)

✅ Muhit tekshiruvi yakunlandi!
```

### 2. APK Yasash / Build APK

Flutter loyihangizga o'ting va APK yasang:

```bash
cd mening_flutter_ilovam
flutterchi apk
```

Natija / Output:
```
🚀 Flutterchi - Flutter Loyihalarni Qurishda Yordam Beruvchi
============================================================

📱 APK yasalyapti...

🧹 1/4 - Tozalanyapti...
[████████████████████████████████] 100% Tozalash

📦 2/4 - Paketlar yuklab olinmoqda...
[████████████████████████████████] 100% Paketlarni olish

🔨 3/4 - APK qurilyapti (bu biroz vaqt olishi mumkin)...
[████████████████████████████████] 100% APK qurish

💾 4/4 - Fayl nusxalanmoqda...
📁 Saqlandi: C:\Users\user\Desktop\FlutterBuilds\mening_flutter_ilovam_v1.0.0.apk
📊 Hajmi: 18.5 MB

🎉 APK muvaffaqiyatli yaratildi!
📍 Joylashuvi: C:\Users\user\Desktop\FlutterBuilds
📦 Fayl: mening_flutter_ilovam_v1.0.0.apk
```

### 3. App Bundle Yasash / Build App Bundle

```bash
flutterchi bundle
```

yoki / or

```bash
flutterchi aab
```

### 4. Windows EXE Yasash / Build Windows EXE (faqat Windows)

```bash
flutterchi exe
```

### 5. Barcha Formatlarni Yasash / Build All Formats

Bitta buyruq bilan APK, App Bundle va Windows EXE yasang:

```bash
flutterchi hammasi
# yoki / or
flutterchi all
```

Natija / Output:
```
🚀 Flutterchi - Flutter Loyihalarni Qurishda Yordam Beruvchi
============================================================

🚀 Barcha formatlar yasalyapti...

============================================================

1️⃣  APK yasash

📱 APK yasalyapti...
[APK qurish natijasi...]
🎉 APK muvaffaqiyatli yaratildi!

============================================================

2️⃣  App Bundle yasash

📦 App Bundle yasalyapti...
[AAB qurish natijasi...]
🎉 App Bundle muvaffaqiyatli yaratildi!

============================================================

3️⃣  Windows EXE yasash

💻 Windows EXE yasalyapti...
[EXE qurish natijasi...]
🎉 Windows EXE muvaffaqiyatli yaratildi!

============================================================

🎊 Barcha formatlar muvaffaqiyatli yaratildi!

📂 Barcha fayllar: C:\Users\user\Desktop\FlutterBuilds
```

## Kengaytirilgan Foydalanish / Advanced Usage

### Natija Tuzilmasini Tushunish / Understanding Output Structure

Qurish tugagandan so'ng, fayllar quyidagicha tartiblanadi:

```
Desktop/
└── FlutterBuilds/
    ├── mening_ilovam_v1.0.0.apk        # Android APK
    ├── mening_ilovam_v1.0.0.aab        # Android App Bundle
    └── mening_ilovam_v1.0.0_windows/   # Windows executable papkasi
        ├── mening_ilovam.exe           # Asosiy dastur
        ├── flutter_windows.dll         # Flutter runtime
        └── [boshqa DLL va ma'lumotlar]  # Qo'shimcha fayllar
```

### Fayl Nomlash Konvensiyasi / File Naming Convention

Fayllar `pubspec.yaml` asosida avtomatik nomlanadi:

```yaml
name: mening_ajoyib_ilovam
version: 2.1.0+5
```

Natija / Results in:
- `mening_ajoyib_ilovam_v2.1.0.apk`
- `mening_ajoyib_ilovam_v2.1.0.aab`
- `mening_ajoyib_ilovam_v2.1.0_windows/`

### Ish Jarayoni Misoli / Workflow Example

Yangi versiya chiqarish uchun to'liq ish jarayoni:

```bash
# 1. pubspec.yaml da versiyani yangilash
# version: 1.0.0 -> 1.0.1

# 2. Muhitni tekshirish
flutterchi tekshir

# 3. Barcha formatlarni yasash
flutterchi hammasi

# 4. Fayllar Desktop/FlutterBuilds da tayyor
# - APK ni Play Store Internal Testing ga yuklash
# - AAB ni Play Store Production ga yuklash
# - EXE ni Windows foydalanuvchilarga tarqatish
```

## Umumiy Stsenariylar / Common Scenarios

### Stsenariy 1: Birinchi Marta Sozlash / First Time Setup

```bash
# Flutterchi ni o'rnatish
dart pub global activate flutterchi

# O'rnatishni tekshirish
flutterchi tekshir

# Loyihaga o'tish
cd mening_loyiham

# APK yasash
flutterchi apk
```

### Stsenariy 2: Tez Release Qurish / Quick Release Build

```bash
cd mening_loyiham
flutterchi hammasi
# ☕ Kofe ichish uchun tanaffus qiling
# Barcha qurish Desktop/FlutterBuilds da tayyor bo'ladi
```

### Stsenariy 3: Faqat Android / Android Only

```bash
cd mening_loyiham
flutterchi apk      # Test uchun
flutterchi bundle   # Play Store uchun
```

### Stsenariy 4: Muammolarni Bartaraf Etish / Troubleshooting

```bash
# Flutter ni tekshirish
flutter doctor

# Flutterchi Flutter ni topa olishini tekshirish
flutterchi tekshir

# Agar muammolar davom etsa, avval qo'lda Flutter buyruqlarini sinab ko'ring
flutter clean
flutter pub get
flutter build apk

# Keyin yana Flutterchi ni sinab ko'ring
flutterchi apk
```

## Maslahatlar va Triklar / Tips and Tricks

### 1. Tez Versiya Tekshirish / Quick Version Check

Qurmasdan qaysi versiya qurilishini tekshiring:

```bash
cat pubspec.yaml | grep version
```

### 2. Muhim Qurishdan Oldin Tozalash / Clean Before Important Builds

```bash
flutter clean
flutterchi hammasi
```

### 3. Qurish Natijasini Tekshirish / Verify Build Output

```bash
cd ~/Desktop/FlutterBuilds
ls -lh
```

### 4. APK ni Darhol Sinab Ko'rish / Test APK Immediately

```bash
# APK yasagandan keyin
adb install ~/Desktop/FlutterBuilds/mening_ilovam_v1.0.0.apk
```

## Yordam Kerakmi? / Need Help?

- `flutterchi yordam` - Tez ma'lumot uchun
- [README.md](../README.md) - Batafsil hujjatlar uchun
- [GitHub Muammolar](https://github.com/AbubakrFlutter/flutterchi/issues) - Muammo yuzaga kelsa
- [Flutter Hujjatlari](https://flutter.dev/docs) - Flutter haqida