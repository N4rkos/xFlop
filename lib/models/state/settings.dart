import 'dart:convert';

import 'package:flop_edt_app/models/cache/cache_provider.dart';
import 'package:flop_edt_app/models/resources/tutor.dart';

class Settings {
  String promo;
  String department;
  String groupe;
  Tutor tutor;
  bool isGridDisplay;
  bool isTutor;

  static Future<Settings> getConfiguration() async {
    var cache = await CacheProvider.instance;
    var value = cache.getValue('settings');
    if (value == null) return null;
    var cached = jsonDecode(value);
    return Settings.fromJSON(cached);
  }

  saveConfiguration() async {
    CacheProvider cache = await CacheProvider.instance;
    await cache.addJSON('settings', this.toJSON);
  }

  Settings({
    this.promo,
    this.department,
    this.groupe,
    this.isTutor: false,
    this.tutor,
    this.isGridDisplay: false
  });

  factory Settings.fromJSON(Map<String, dynamic> json) => Settings(
        department: json['department'],
        promo: json['promo'],
        groupe: json['groupe'],
        isTutor: json['isTutor'],
        isGridDisplay: json['isGridDisplay'],
        tutor: json['tutor'] == null ? null : Tutor.fromJSON(json['tutor']),
      );

  Map<String, dynamic> get toMap => {
        'promo': this.promo,
        'department': this.department,
        'groupe': this.groupe,
        'isTutor': this.isTutor,
        'tutor': this.tutor?.toMap,
        'isGridDisplay': this.isGridDisplay,
      };

  String get toJSON => jsonEncode(this.toMap);

  @override
  String toString() {
    return this.toJSON;
  }
}
