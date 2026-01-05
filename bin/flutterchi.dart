#!/usr/bin/env dart

import 'dart:io';
import 'dart:async';
import 'package:yaml/yaml.dart';
import 'package:path/path.dart' as p;

String? _flutterCommand;

void main(List<String> args) async {
  print('');
  print('🚀 Flutterchi - Flutter Loyihalarni Qurishda Yordam Beruvchi');
  print('=' * 60);
  print('');

  if (args.isEmpty ||
      args[0] == 'help' ||
      args[0] == 'yordam' ||
      args[0] == '-h' ||
      args[0] == '--help') {
    _yordamKorsatish();
    return;
  }

  final command = args[0].toLowerCase();

  try {
    // Avval Flutter mavjudligini tekshirish
    await _flutterniTekshirish();

    switch (command) {
      case 'apk':
        await _apkYasash();
        break;
      case 'appbundle':
      case 'bundle':
      case 'aab':
        await _bundleYasash();
        break;
      case 'exe':
      case 'windows':
        await _exeYasash();
        break;
      case 'hammasi':
      case 'all':
        await _hammasiniYasash();
        break;
      case 'tekshir':
      case 'check':
      case 'doctor':
        await _muhitniTekshirish();
        break;
      default:
        print('❌ Noma\'lum buyruq: $command\n');
        _yordamKorsatish();
    }
  } catch (e) {
    print('\n❌ Xato: $e\n');

    if (e.toString().contains('Flutter not found') ||
        e.toString().contains('flutter') ||
        e.toString().contains('topilmadi') ||
        e.toString().contains('ProcessException')) {
      print('💡 Yechim:');
      print(
          '   1. Flutter o\'rnating: https://docs.flutter.dev/get-started/install');
      print('   2. Flutter ni PATH ga qo\'shing');
      print('   3. Terminalni qayta ishga tushiring');
      print('   4. Ishga tushiring: flutterchi tekshir\n');
    }

    exit(1);
  }
}

void _yordamKorsatish() {
  print('''
📚 Foydalanish:
  flutterchi <buyruq>

📋 Buyruqlar:
  apk         APK fayl yasash
  bundle      App Bundle (AAB) yasash
  exe         Windows EXE yasash
  hammasi     Barcha formatlarni yasash
  tekshir     Flutter o'rnatilganini tekshirish
  yordam      Bu yordamni ko'rsatish

💡 Misollar:
  flutterchi tekshir      (Birinchi marta ishga tushiring!)
  flutterchi apk
  flutterchi hammasi

📝 Eslatmalar:
  - Flutter loyihasi papkasida ishlatish kerak
  - Fayllar Desktop/FlutterBuilds ga saqlanadi
  - Fayl formati: IlovaIsmi_v1.0.0.apk

🌐 Batafsil: https://pub.dev/packages/flutterchi
  ''');
}

Future<void> _flutterniTekshirish() async {
  if (_flutterCommand != null) return;

  // PATH dan Flutter topishga urinish
  try {
    final result = await Process.run(
      Platform.isWindows ? 'where' : 'which',
      ['flutter'],
      runInShell: true,
    );

    if (result.exitCode == 0) {
      final output = result.stdout.toString().trim();
      if (output.isNotEmpty) {
        _flutterCommand = 'flutter';
        return;
      }
    }
  } catch (_) {}

  // Umumiy Flutter o'rnatilgan joylarni qidirish
  if (Platform.isWindows) {
    final paths = [
      'C:\\src\\flutter\\bin\\flutter.bat',
      'C:\\flutter\\bin\\flutter.bat',
      'C:\\Users\\${Platform.environment['USERNAME']}\\flutter\\bin\\flutter.bat',
      '${Platform.environment['USERPROFILE']}\\flutter\\bin\\flutter.bat',
      '${Platform.environment['LOCALAPPDATA']}\\flutter\\bin\\flutter.bat',
    ];

    for (final path in paths) {
      if (await File(path).exists()) {
        _flutterCommand = path;
        print('✅ Flutter topildi: $path\n');
        return;
      }
    }
  } else {
    final paths = [
      '${Platform.environment['HOME']}/flutter/bin/flutter',
      '/usr/local/flutter/bin/flutter',
      '/opt/flutter/bin/flutter',
    ];

    for (final path in paths) {
      if (await File(path).exists()) {
        _flutterCommand = path;
        print('✅ Flutter topildi: $path\n');
        return;
      }
    }
  }

  throw Exception('Flutter topilmadi!\n\n'
      'Iltimos:\n'
      '1. Flutter ni o\'rnating: https://docs.flutter.dev/get-started/install\n'
      '2. Flutter ni PATH muhit o\'zgaruvchisiga qo\'shing\n'
      '3. Terminalni qayta ishga tushiring va ishga tushiring: flutterchi tekshir');
}

Future<void> _muhitniTekshirish() async {
  print('🔍 Muhitni tekshiryapman...\n');

  try {
    await _flutterniTekshirish();
    print('✅ Flutter topildi: $_flutterCommand\n');

    print('📋 Flutter doctor ishga tushiryapman...\n');
    final result = await Process.run(
      _flutterCommand!,
      ['doctor', '-v'],
      runInShell: true,
    );

    print(result.stdout);

    if (result.exitCode == 0) {
      print('\n✅ Muhit tekshiruvi yakunlandi!');
    } else {
      print('\n⚠️  Ba\'zi muammolar topildi. Iltimos, ularni qurish oldidan tuzating.');
    }
  } catch (e) {
    print('❌ Muhitni tekshirishda xato: $e');
  }
}

Future<_LoyihaMalumoti> _loyihaMalumotiniOlish() async {
  final pubspecFile = File('pubspec.yaml');

  if (!await pubspecFile.exists()) {
    throw Exception('pubspec.yaml topilmadi!\n'
        'Iltimos, flutterchi ni Flutter loyihasi papkasida ishga tushiring.\n'
        'Joriy papka: ${Directory.current.path}');
  }

  final content = await pubspecFile.readAsString();
  final yaml = loadYaml(content);

  final name = yaml['name'] ?? 'ilova';
  final version = yaml['version']?.toString().split('+')[0] ?? '1.0.0';

  return _LoyihaMalumoti(nomi: name, versiyasi: version);
}

Future<String> _ishStoliManziliniOlish() async {
  String? desktop;

  if (Platform.isWindows) {
    desktop = Platform.environment['USERPROFILE'];
    if (desktop != null) {
      desktop = p.join(desktop, 'Desktop');
    }
  } else if (Platform.isMacOS || Platform.isLinux) {
    desktop = Platform.environment['HOME'];
    if (desktop != null) {
      desktop = p.join(desktop, 'Desktop');
    }
  }

  if (desktop == null || !await Directory(desktop).exists()) {
    throw Exception('Ish stoli papkasi topilmadi!');
  }

  return desktop;
}

// Progress bar ko'rsatish
void _progressBarniKorsatish(int foiz, {String tavsif = ''}) {
  const barUzunligi = 40;
  final toldirish = (barUzunligi * foiz / 100).round();
  final bar = '█' * toldirish + '░' * (barUzunligi - toldirish);
  
  stdout.write('\r[$bar] $foiz% $tavsif');
  if (foiz == 100) {
    stdout.write('\n');
  }
}

Future<void> _buyruqniIshgaTushirish(
  List<String> args, {
  String? tavsif,
  bool progressBar = false,
}) async {
  if (tavsif != null) {
    print('⏳ $tavsif...');
  }

  final process = await Process.start(
    _flutterCommand!,
    args,
    runInShell: true,
  );

  var lastOutput = DateTime.now();
  var outputLines = <String>[];

  process.stdout.listen((data) {
    final text = String.fromCharCodes(data);
    outputLines.add(text);
    if (!progressBar) {
      stdout.add(data);
    }
    lastOutput = DateTime.now();
  });

  process.stderr.listen((data) {
    if (!progressBar) {
      stderr.add(data);
    }
    lastOutput = DateTime.now();
  });

  if (progressBar) {
    // Progress bar animatsiyasi
    var foiz = 0;
    final timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (foiz < 95) {
        foiz += 1;
        _progressBarniKorsatish(foiz, tavsif: tavsif ?? '');
      }
    });
    
    final exitCode = await process.exitCode;
    timer.cancel();
    _progressBarniKorsatish(100, tavsif: tavsif ?? '');
    
    if (exitCode != 0) {
      // Xato bo'lsa, output ni ko'rsatish
      print('\n');
      for (var line in outputLines) {
        print(line);
      }
      throw Exception('Buyruq muvaffaqiyatsiz yakunlandi (kod: $exitCode)');
    }
  } else {
    // Progress nuqtalari
    final progressTimer = Stream.periodic(const Duration(milliseconds: 500));
    final progressSub = progressTimer.listen((_) {
      final elapsed = DateTime.now().difference(lastOutput).inSeconds;
      if (elapsed < 2) {
        stdout.write('.');
      }
    });

    final exitCode = await process.exitCode;
    progressSub.cancel();

    if (exitCode != 0) {
      throw Exception('Buyruq muvaffaqiyatsiz yakunlandi (kod: $exitCode)');
    }
  }

  if (tavsif != null && !progressBar) {
    print('\n✅ $tavsif yakunlandi\n');
  }
}

Future<void> _faylKochirish(String manba, String manzil) async {
  final sourceFile = File(manba);
  if (!await sourceFile.exists()) {
    throw Exception('Fayl topilmadi: $manba');
  }

  final fileSize = await sourceFile.length();
  final sizeMB = (fileSize / (1024 * 1024)).toStringAsFixed(2);

  await sourceFile.copy(manzil);
  print('📁 Saqlandi: $manzil');
  print('📊 Hajmi: $sizeMB MB');
}

Future<void> _apkYasash() async {
  print('📱 APK yasalyapti...\n');

  final info = await _loyihaMalumotiniOlish();
  final desktop = await _ishStoliManziliniOlish();
  final outputDir = p.join(desktop, 'FlutterBuilds');

  await Directory(outputDir).create(recursive: true);

  print('🧹 1/4 - Tozalanyapti...');
  await _buyruqniIshgaTushirish(['clean'], tavsif: 'Tozalash', progressBar: true);
  
  print('\n📦 2/4 - Paketlar yuklab olinmoqda...');
  await _buyruqniIshgaTushirish(['pub', 'get'], tavsif: 'Paketlarni olish', progressBar: true);

  print('\n🔨 3/4 - APK qurilyapti (bu biroz vaqt olishi mumkin)...');
  await _buyruqniIshgaTushirish(['build', 'apk', '--release'], tavsif: 'APK qurish', progressBar: true);

  print('\n💾 4/4 - Fayl nusxalanmoqda...');
  final source = p.join('build', 'app', 'outputs', 'flutter-apk', 'app-release.apk');
  final fileName = '${info.nomi}_v${info.versiyasi}.apk';
  final destination = p.join(outputDir, fileName);

  await _faylKochirish(source, destination);

  print('\n🎉 APK muvaffaqiyatli yaratildi!');
  print('📍 Joylashuvi: $outputDir');
  print('📦 Fayl: $fileName\n');
}

Future<void> _bundleYasash() async {
  print('📦 App Bundle yasalyapti...\n');

  final info = await _loyihaMalumotiniOlish();
  final desktop = await _ishStoliManziliniOlish();
  final outputDir = p.join(desktop, 'FlutterBuilds');

  await Directory(outputDir).create(recursive: true);

  print('🧹 1/4 - Tozalanyapti...');
  await _buyruqniIshgaTushirish(['clean'], tavsif: 'Tozalash', progressBar: true);
  
  print('\n📦 2/4 - Paketlar yuklab olinmoqda...');
  await _buyruqniIshgaTushirish(['pub', 'get'], tavsif: 'Paketlarni olish', progressBar: true);

  print('\n🔨 3/4 - App Bundle qurilyapti (bu biroz vaqt olishi mumkin)...');
  await _buyruqniIshgaTushirish(['build', 'appbundle', '--release'],
      tavsif: 'Bundle qurish', progressBar: true);

  print('\n💾 4/4 - Fayl nusxalanmoqda...');
  final source = p.join('build', 'app', 'outputs', 'bundle', 'release', 'app-release.aab');
  final fileName = '${info.nomi}_v${info.versiyasi}.aab';
  final destination = p.join(outputDir, fileName);

  await _faylKochirish(source, destination);

  print('\n🎉 App Bundle muvaffaqiyatli yaratildi!');
  print('📍 Joylashuvi: $outputDir');
  print('📦 Fayl: $fileName\n');
}

Future<void> _exeYasash() async {
  if (!Platform.isWindows) {
    print('⚠️  Windows EXE faqat Windows da yasaladi!');
    return;
  }

  print('💻 Windows EXE yasalyapti...\n');

  final info = await _loyihaMalumotiniOlish();
  final desktop = await _ishStoliManziliniOlish();
  final outputDir = p.join(desktop, 'FlutterBuilds');

  await Directory(outputDir).create(recursive: true);

  print('🧹 1/4 - Tozalanyapti...');
  await _buyruqniIshgaTushirish(['clean'], tavsif: 'Tozalash', progressBar: true);
  
  print('\n📦 2/4 - Paketlar yuklab olinmoqda...');
  await _buyruqniIshgaTushirish(['pub', 'get'], tavsif: 'Paketlarni olish', progressBar: true);

  print('\n🔨 3/4 - Windows EXE qurilyapti (bu biroz vaqt olishi mumkin)...');
  await _buyruqniIshgaTushirish(['build', 'windows', '--release'],
      tavsif: 'Windows EXE qurish', progressBar: true);

  print('\n💾 4/4 - Fayllar nusxalanmoqda...');
  final sourceDir = p.join('build', 'windows', 'x64', 'runner', 'Release');
  final folderName = '${info.nomi}_v${info.versiyasi}_windows';
  final destDir = p.join(outputDir, folderName);

  // Eski papkani o'chirish (agar mavjud bo'lsa)
  final destDirectory = Directory(destDir);
  if (await destDirectory.exists()) {
    await destDirectory.delete(recursive: true);
  }

  // Yangi papkaga nusxalash
  await _papkaniKochirish(Directory(sourceDir), destDirectory);

  print('\n🎉 Windows EXE muvaffaqiyatli yaratildi!');
  print('📍 Joylashuvi: $outputDir');
  print('📁 Papka: $folderName');
  print('💡 Ishga tushirish uchun: ${info.nomi}.exe\n');
}

Future<void> _papkaniKochirish(Directory manba, Directory manzil) async {
  await manzil.create(recursive: true);

  var faylSoni = 0;
  var jami = 0;

  // Birinchi jami fayllar sonini sanash
  await for (var entity in manba.list(recursive: true)) {
    if (entity is File) jami++;
  }

  await for (var entity in manba.list(recursive: false)) {
    if (entity is Directory) {
      final newDirectory =
          Directory(p.join(manzil.path, p.basename(entity.path)));
      await _papkaniKochirish(entity, newDirectory);
    } else if (entity is File) {
      await entity.copy(p.join(manzil.path, p.basename(entity.path)));
      faylSoni++;
      
      // Progress bar ko'rsatish
      if (jami > 0) {
        final foiz = (faylSoni * 100 / jami).round();
        _progressBarniKorsatish(foiz, tavsif: '$faylSoni/$jami fayl');
      }
    }
  }

  if (faylSoni > 0) {
    print('\n✅ $faylSoni ta fayl nusxalandi');
  }
}

Future<void> _hammasiniYasash() async {
  print('🚀 Barcha formatlar yasalyapti...\n');
  print('=' * 60);

  print('\n1️⃣  APK yasash\n');
  await _apkYasash();

  print('\n' + '=' * 60);
  print('\n2️⃣  App Bundle yasash\n');
  await _bundleYasash();

  if (Platform.isWindows) {
    print('\n' + '=' * 60);
    print('\n3️⃣  Windows EXE yasash\n');
    await _exeYasash();
  }

  print('\n' + '=' * 60);
  print('\n🎊 Barcha formatlar muvaffaqiyatli yaratildi!\n');

  final desktop = await _ishStoliManziliniOlish();
  final outputDir = p.join(desktop, 'FlutterBuilds');
  print('📂 Barcha fayllar: $outputDir\n');
}

class _LoyihaMalumoti {
  final String nomi;
  final String versiyasi;

  _LoyihaMalumoti({required this.nomi, required this.versiyasi});
}
