// import 'dart:async';

// import 'package:flutter/foundation.dart';
// import 'package:hive/hive.dart';
// import 'package:path_provider/path_provider.dart';

// class HiveStorage implements IStorageService {
//   final _box = Completer<Box>();

//   Future<void> setup() async {
//     try {
//       _box.complete(await Hive.openBox('lifecare_box'));
//     } catch (e) {
//       debugPrint(e.toString());
//     }
//   }

//   @override
//   Future<void> init() async {
//     var appDir = await getApplicationDocumentsDirectory();
//     var path = appDir.path;
//     Hive.init(path);
//     await setup();
//   }

//   @override
//   Future<dynamic> read(String tag, {defaultValue}) async {
//     final box = await _box.future;
//     var data = await box.get(tag, defaultValue: defaultValue);
//     return data;
//   }

//   @override
//   Future<bool> write(String tag, value) async {
//     try {
//       final box = await _box.future;
//       await box.put(tag, value);
//       return true;
//     } catch (e) {
//       debugPrint(e.toString());
//       return false;
//     }
//   }

//   @override
//   Future<bool> delete(String tag) async {
//     try {
//       final box = await _box.future;
//       await box.delete(tag);
//       return true;
//     } catch (e) {
//       debugPrint(e.toString());
//       return false;
//     }
//   }

//   @override
//   Future<bool> deleteAll() async {
//     try {
//       final box = await _box.future;
//       await box.clear();
//       return true;
//     } catch (e) {
//       debugPrint(e.toString());
//       return false;
//     }
//   }
// }

// abstract class IStorageService {
//   Future init();
//   Future<dynamic> read(String key);
//   Future<bool> write(String key, value);
//   Future<bool> delete(String key);
//   Future<bool> deleteAll();
// }
