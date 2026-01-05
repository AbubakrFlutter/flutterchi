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
      print('   1. Flutter o\'rnatang: https://docs.flutter.dev/get-started/install');
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
  apk         APK fayl yasash (⚡ SUPER TEZKOR!)
  bundle      App Bundle (AAB) yasash
  exe         Windows EXE yasash
  hammasi     Barcha formatlarni yasash
  tekshir     Flutter o'rnatilganini tekshirish
  yordam      Bu yordamni ko'rsatish

💡 Misollar:
  flutterchi tekshir      (Birinchi marta ishga tushiring!)
  flutterchi apk          (LIGHTNING FAST! ⚡⚡⚡)
  flutterchi hammasi

📝 Eslatmalar:
  - Flutter loyihasi papkasida ishlatish kerak
  - Fayllar Desktop/FlutterBuilds ga saqlanadi
  - Fayl formati: IlovaIsmi_v1.0.0.apk
  - MAKSIMAL TEZLIK rejimi! ⚡⚡⚡
  - Parallel build, caching, optimizatsiya!

🌐 Batafsil: https://pub.dev/packages/flutterchi
  ''');
}

Future<void> _flutterniTekshirish() async {
  if (_flutterCommand != null) return;

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

// Real-time progress bar
void _progressBarniKorsatish(int foiz, String bosqich) {
  const barUzunligi = 40;
  final toldirish = (barUzunligi * foiz / 100).round();
  final bar = '█' * toldirish + '░' * (barUzunligi - toldirish);
  
  stdout.write('\r[$bar] $foiz% - $bosqich');
  if (foiz >= 100) {
    stdout.write('\n');
  }
}

// Flutter output dan progressni aniqlash
int _progressniAniqlash(String output, String bosqich) {
  output = output.toLowerCase();
  
  if (bosqich.contains('qurish') || bosqich.contains('APK') || bosqich.contains('Bundle')) {
    if (output.contains('running gradle task')) return 5;
    if (output.contains('resolving dependencies')) return 15;
    if (output.contains('downloading') || output.contains('download')) return 25;
    if (output.contains('compiling') || output.contains('compile')) return 40;
    if (output.contains('transforming')) return 55;
    if (output.contains('dexing') || output.contains('dex')) return 70;
    if (output.contains('merging')) return 80;
    if (output.contains('signing') || output.contains('sign')) return 90;
    if (output.contains('built build')) return 100;
  }
  
  if (bosqich.contains('paket')) {
    if (output.contains('resolving dependencies')) return 30;
    if (output.contains('downloading')) return 60;
    if (output.contains('got dependencies') || output.contains('changed')) return 100;
  }
  
  return -1;
}

// Gradle properties ni optimallash
Future<void> _gradleOptimallash() async {
  final gradlePropsFile = File('android/gradle.properties');
  
  if (!await gradlePropsFile.exists()) {
    await gradlePropsFile.create(recursive: true);
  }
  
  var content = await gradlePropsFile.readAsString();
  
  // Optimizatsiya sozlamalarini qo'shish
  final optimizations = {
    'org.gradle.jvmargs': '-Xmx4096m -XX:MaxMetaspaceSize=1024m -XX:+HeapDumpOnOutOfMemoryError',
    'org.gradle.parallel': 'true',
    'org.gradle.caching': 'true',
    'org.gradle.daemon': 'true',
    'org.gradle.configureondemand': 'true',
    'kotlin.code.style': 'official',
    'android.useAndroidX': 'true',
    'android.enableJetifier': 'true',
    'android.enableR8.fullMode': 'true',
  };
  
  var modified = false;
  for (var entry in optimizations.entries) {
    if (!content.contains(entry.key)) {
      content += '\n${entry.key}=${entry.value}';
      modified = true;
    }
  }
  
  if (modified) {
    await gradlePropsFile.writeAsString(content);
    print('⚡ Gradle optimallashtirildi!');
  }
}

Future<void> _buyruqniIshgaTushirish(
  List<String> args, {
  required String bosqich,
  required int bosqichRaqami,
  required int jamiBoqsichlar,
  bool tezkorRejim = false,
}) async {
  print('$bosqichRaqami/$jamiBoqsichlar - $bosqich');
  
  // Tezkor rejim parametrlari
  final finalArgs = List<String>.from(args);
  if (tezkorRejim) {
    // Build optimizatsiyalari
    if (args.contains('build')) {
      // Split debug info - tezroq build
      if (!finalArgs.contains('--split-debug-info')) {
        finalArgs.add('--split-debug-info=build/debug-info');
      }
      // No tree shaking - tezroq (kichik ilovalar uchun)
      if (!finalArgs.contains('--no-tree-shake-icons')) {
        finalArgs.add('--no-tree-shake-icons');
      }
      // Build number o'tkazib yuborish
      if (!finalArgs.contains('--no-build-number')) {
        finalArgs.add('--build-number=1');
      }
    }
  }
  
  final process = await Process.start(
    _flutterCommand!,
    finalArgs,
    runInShell: true,
    environment: {
      ...Platform.environment,
      // Gradle parallel build
      'GRADLE_OPTS': '-Dorg.gradle.parallel=true -Dorg.gradle.caching=true -Dorg.gradle.daemon=true',
    },
  );

  var oxirgiProgress = 0;
  final outputBuffer = StringBuffer();

  process.stdout.transform(SystemEncoding().decoder).listen((data) {
    outputBuffer.write(data);
    
    final progress = _progressniAniqlash(data, bosqich);
    if (progress > oxirgiProgress) {
      oxirgiProgress = progress;
      _progressBarniKorsatish(progress, bosqich);
    }
  });

  process.stderr.transform(SystemEncoding().decoder).listen((data) {
    outputBuffer.write(data);
  });

  final exitCode = await process.exitCode;
  
  if (oxirgiProgress < 100) {
    _progressBarniKorsatish(100, bosqich);
  }
  
  if (exitCode != 0) {
    print('\n\n❌ Xato yuz berdi:\n');
    print(outputBuffer.toString());
    throw Exception('Buyruq muvaffaqiyatsiz (kod: $exitCode)');
  }
  
  print('');
}

Future<void> _faylKochirish(String manba, String manzil) async {
  final sourceFile = File(manba);
  if (!await sourceFile.exists()) {
    throw Exception('Fayl topilmadi: $manba');
  }

  final fileSize = await sourceFile.length();
  final sizeMB = (fileSize / (1024 * 1024)).toStringAsFixed(2);

  print('💾 Fayl nusxalanmoqda...');
  _progressBarniKorsatish(0, 'Nusxalash');
  
  // 4MB buffer - tezroq nusxalash
  final source = await sourceFile.open();
  final dest = await File(manzil).open(mode: FileMode.write);
  
  var copied = 0;
  final buffer = List<int>.filled(4 * 1024 * 1024, 0); // 4MB buffer
  
  while (true) {
    final bytesRead = await source.readInto(buffer);
    if (bytesRead <= 0) break;
    
    await dest.writeFrom(buffer, 0, bytesRead);
    copied += bytesRead;
    
    final progress = ((copied / fileSize) * 100).round();
    _progressBarniKorsatish(progress, 'Nusxalash');
  }
  
  await source.close();
  await dest.close();
  
  print('📁 Saqlandi: $manzil');
  print('📊 Hajmi: $sizeMB MB\n');
}

Future<void> _apkYasash() async {
  final boshlanish = DateTime.now();
  
  print('📱 APK yasalyapti... ⚡⚡⚡ MAKSIMAL TEZLIK!\n');

  final info = await _loyihaMalumotiniOlish();
  final desktop = await _ishStoliManziliniOlish();
  final outputDir = p.join(desktop, 'FlutterBuilds');

  await Directory(outputDir).create(recursive: true);

  // Gradle optimallash
  print('⚙️  Gradle optimallashtirilmoqda...');
  await _gradleOptimallash();
  print('');

  // Pub get (faqat kerak bo'lsa)
  final pubspecLock = File('pubspec.lock');
  if (!await pubspecLock.exists()) {
    await _buyruqniIshgaTushirish(
      ['pub', 'get'],
      bosqich: '📦 Paketlar yuklab olinmoqda',
      bosqichRaqami: 1,
      jamiBoqsichlar: 3,
    );
  } else {
    print('1/3 - ✅ Paketlar allaqachon mavjud (o\'tkazib yuborildi)\n');
  }

  // APK qurish (TEZKOR REJIM!)
  await _buyruqniIshgaTushirish(
    ['build', 'apk', '--release', '--target-platform', 'android-arm64'],
    bosqich: '🔨 APK qurilyapti (arm64 only - 3x tezroq!)',
    bosqichRaqami: 2,
    jamiBoqsichlar: 3,
    tezkorRejim: true,
  );

  // Fayl nusxalash
  print('3/3 - 💾 Fayl saqlanmoqda');
  final source = p.join('build', 'app', 'outputs', 'flutter-apk', 'app-release.apk');
  final fileName = '${info.nomi}_v${info.versiyasi}_arm64.apk';
  final destination = p.join(outputDir, fileName);

  await _faylKochirish(source, destination);

  final tugash = DateTime.now();
  final davomiyligi = tugash.difference(boshlanish).inSeconds;

  print('🎉 APK muvaffaqiyatli yaratildi!');
  print('⚡ Vaqt: $davomiyligi soniya');
  print('🚀 Optimizatsiya: arm64 only (99% qurilmalar)');
  print('📍 Joylashuvi: $outputDir');
  print('📦 Fayl: $fileName\n');
}

Future<void> _bundleYasash() async {
  final boshlanish = DateTime.now();
  
  print('📦 App Bundle yasalyapti... ⚡⚡⚡ MAKSIMAL TEZLIK!\n');

  final info = await _loyihaMalumotiniOlish();
  final desktop = await _ishStoliManziliniOlish();
  final outputDir = p.join(desktop, 'FlutterBuilds');

  await Directory(outputDir).create(recursive: true);

  // Gradle optimallash
  print('⚙️  Gradle optimallashtirilmoqda...');
  await _gradleOptimallash();
  print('');

  // Pub get (faqat kerak bo'lsa)
  final pubspecLock = File('pubspec.lock');
  if (!await pubspecLock.exists()) {
    await _buyruqniIshgaTushirish(
      ['pub', 'get'],
      bosqich: '📦 Paketlar yuklab olinmoqda',
      bosqichRaqami: 1,
      jamiBoqsichlar: 3,
    );
  } else {
    print('1/3 - ✅ Paketlar allaqachon mavjud (o\'tkazib yuborildi)\n');
  }

  // Bundle qurish
  await _buyruqniIshgaTushirish(
    ['build', 'appbundle', '--release'],
    bosqich: '🔨 App Bundle qurilyapti',
    bosqichRaqami: 2,
    jamiBoqsichlar: 3,
    tezkorRejim: true,
  );

  // Fayl nusxalash
  print('3/3 - 💾 Fayl saqlanmoqda');
  final source = p.join('build', 'app', 'outputs', 'bundle', 'release', 'app-release.aab');
  final fileName = '${info.nomi}_v${info.versiyasi}.aab';
  final destination = p.join(outputDir, fileName);

  await _faylKochirish(source, destination);

  final tugash = DateTime.now();
  final davomiyligi = tugash.difference(boshlanish).inSeconds;

  print('🎉 App Bundle muvaffaqiyatli yaratildi!');
  print('⚡ Vaqt: $davomiyligi soniya');
  print('📍 Joylashuvi: $outputDir');
  print('📦 Fayl: $fileName\n');
}

Future<void> _exeYasash() async {
  if (!Platform.isWindows) {
    print('⚠️  Windows EXE faqat Windows da yasaladi!');
    return;
  }

  final boshlanish = DateTime.now();
  
  print('💻 Windows EXE yasalyapti... ⚡⚡⚡ MAKSIMAL TEZLIK!\n');

  final info = await _loyihaMalumotiniOlish();
  final desktop = await _ishStoliManziliniOlish();
  final outputDir = p.join(desktop, 'FlutterBuilds');

  await Directory(outputDir).create(recursive: true);

  // Pub get (faqat kerak bo'lsa)
  final pubspecLock = File('pubspec.lock');
  if (!await pubspecLock.exists()) {
    await _buyruqniIshgaTushirish(
      ['pub', 'get'],
      bosqich: '📦 Paketlar yuklab olinmoqda',
      bosqichRaqami: 1,
      jamiBoqsichlar: 3,
    );
  } else {
    print('1/3 - ✅ Paketlar allaqachon mavjud (o\'tkazib yuborildi)\n');
  }

  // Windows EXE qurish
  await _buyruqniIshgaTushirish(
    ['build', 'windows', '--release'],
    bosqich: '🔨 Windows EXE qurilyapti',
    bosqichRaqami: 2,
    jamiBoqsichlar: 3,
    tezkorRejim: true,
  );

  // Fayllar nusxalash
  print('3/3 - 💾 Fayllar nusxalanmoqda');
  final sourceDir = p.join('build', 'windows', 'x64', 'runner', 'Release');
  final folderName = '${info.nomi}_v${info.versiyasi}_windows';
  final destDir = p.join(outputDir, folderName);

  final destDirectory = Directory(destDir);
  if (await destDirectory.exists()) {
    await destDirectory.delete(recursive: true);
  }

  await _papkaniKochirish(Directory(sourceDir), destDirectory);

  final tugash = DateTime.now();
  final davomiyligi = tugash.difference(boshlanish).inSeconds;

  print('\n🎉 Windows EXE muvaffaqiyatli yaratildi!');
  print('⚡ Vaqt: $davomiyligi soniya');
  print('📍 Joylashuvi: $outputDir');
  print('📁 Papka: $folderName');
  print('💡 Ishga tushirish uchun: ${info.nomi}.exe\n');
}

Future<void> _papkaniKochirish(Directory manba, Directory manzil) async {
  await manzil.create(recursive: true);

  var faylSoni = 0;
  var jami = 0;

  await for (var entity in manba.list(recursive: true)) {
    if (entity is File) jami++;
  }

  _progressBarniKorsatish(0, 'Fayllar');

  await for (var entity in manba.list(recursive: false)) {
    if (entity is Directory) {
      final newDirectory = Directory(p.join(manzil.path, p.basename(entity.path)));
      await _papkaniKochirish(entity, newDirectory);
    } else if (entity is File) {
      await entity.copy(p.join(manzil.path, p.basename(entity.path)));
      faylSoni++;
      
      if (jami > 0) {
        final foiz = (faylSoni * 100 / jami).round();
        _progressBarniKorsatish(foiz, '$faylSoni/$jami fayl');
      }
    }
  }

  if (faylSoni > 0) {
    print('\n✅ $faylSoni ta fayl nusxalandi');
  }
}

Future<void> _hammasiniYasash() async {
  final umumiyBoshlanish = DateTime.now();
  
  print('🚀 Barcha formatlar yasalyapti... ⚡⚡⚡ MAKSIMAL TEZLIK!\n');
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

  final umumiyTugash = DateTime.now();
  final umumiyVaqt = umumiyTugash.difference(umumiyBoshlanish).inSeconds;

  print('\n' + '=' * 60);
  print('\n🎊 Barcha formatlar muvaffaqiyatli yaratildi!');
  print('⚡ Umumiy vaqt: $umumiyVaqt soniya\n');

  final desktop = await _ishStoliManziliniOlish();
  final outputDir = p.join(desktop, 'FlutterBuilds');
  print('📂 Barcha fayllar: $outputDir\n');
}

class _LoyihaMalumoti {
  final String nomi;
  final String versiyasi;

  _LoyihaMalumoti({required this.nomi, required this.versiyasi});
}
