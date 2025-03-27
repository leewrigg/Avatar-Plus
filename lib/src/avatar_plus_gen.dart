import 'dart:convert';

import 'package:avatar_plus/avatar_plus.dart';
import 'package:crypto/crypto.dart';

class AvatarPlusGen {
  static const _svgStart =
      '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 231 231">';
  static const _svgEnd = '</svg>';

  static const _env = 'env';
  static const _clo = 'clo';
  static const _head = 'head';
  static const _mouth = 'mouth';
  static const _eyes = 'eyes';
  static const _top = 'top';

  // Private constructor with initialization logic
  AvatarPlusGen._internal();

  // Static instance variable, initially created
  static final AvatarPlusGen _instance = AvatarPlusGen._internal();

  // Static getter to return the singleton instance
  static AvatarPlusGen get instance => _instance;

  //  AvatarPlusUtils instance
  final AvatarPlusUtils avatarPlusUtils = AvatarPlusUtils.instance;

  /// required String string,  random string to use as a start of svg generation
  /// bool trBackground  = true; Set background color to transparent
  String generate(String string, {bool trBackground = false}) {
    string += '';

    String hash = '';
    if (string.isEmpty) return hash;

    List<int> bytes1 = utf8.encode(string);
    Digest sha256Hash = sha256.convert(bytes1);
    String sha256Numbers =
        sha256Hash.toString().replaceAll(RegExp(r'[^0-9]'), '');

    hash = sha256Numbers.substring(0, 12);

    Map<dynamic, dynamic> p = {};

    p[_env] = hash[0] + '' + hash[1];
    p[_env] = ((47 / 100) * int.parse(p[_env])).round().toString() + '';

    p[_clo] = hash[2] + '' + hash[3];
    p[_clo] = ((47 / 100) * int.parse(p[_clo])).round().toString() + '';

    p[_head] = hash[4] + '' + hash[5];
    p[_head] = ((47 / 100) * int.parse(p[_head])).round().toString() + '';

    p[_mouth] = hash[6] + '' + hash[7];
    p[_mouth] = ((47 / 100) * int.parse(p[_mouth])).round().toString() + '';

    p[_eyes] = hash[8] + '' + hash[9];
    p[_eyes] = ((47 / 100) * int.parse(p[_eyes])).round().toString() + '';

    p[_top] = hash[10] + '' + hash[11];
    p[_top] = ((47 / 100) * int.parse(p[_top])).round().toString() + '';

    for (var part in p.keys) {
      var nr = p[part];

      if (int.parse(nr) > 31) {
        nr = (int.parse(nr) - 32).toString() + '';
        if (nr.length == 1) nr = '0' + nr;
        p[part] = nr + 'C';
      } else if (int.parse(nr) > 15) {
        nr = (int.parse(nr) - 16).toString() + '';
        if (nr.length == 1) nr = '0' + nr;
        p[part] = nr + 'B';
      } else {
        if ((nr + '').length == 1)
          p[part] = '0' + nr + 'A';
        else
          p[part] = nr + 'A';
      }
    }

    Map<dynamic, dynamic> _final = {};

    for (var part in p.keys) {
      var partV = p[part].substring(0, 2);
      var theme = p[part].substring(2, 3);

      _final[part] = avatarPlusUtils.getFinal(part, partV, theme);
    }

    if (trBackground) _final[_env] = '';

    return (_svgStart +
        // Background
        _final[_env] +
        _final[_head] +
        _final[_clo] +
        _final[_top] +
        _final[_eyes] +
        _final[_mouth] +
        _svgEnd);
  }

  /// Generates an avatar using individual feature integers.
  /// Each feature cycles between 0 and 47 using modulo.
  String generateFromValues(AvatarPlusValues values) {
    // Ensure all values are within the valid range (00-47)
    String padWithTheme(int value) {
      int modValue = value % 48; // Ensure the value is within 0-47
      String theme;

      if (modValue > 31) {
        modValue -= 32;
        theme = 'C';
      } else if (modValue > 15) {
        modValue -= 16;
        theme = 'B';
      } else {
        theme = 'A';
      }

      return modValue.toString().padLeft(2, '0') + theme;
    }

    Map<String, String?> p = {
      _env: values.env == null ? null : padWithTheme(values.env!),
      _clo: values.clo == null ? null : padWithTheme(values.clo!),
      _head: values.head == null ? null : padWithTheme(values.head!),
      _mouth: values.mouth == null ? null : padWithTheme(values.mouth!),
      _eyes: values.eyes == null ? null : padWithTheme(values.eyes!),
      _top: values.top == null ? null : padWithTheme(values.top!),
    };

    Map<String, String> _final = {};
    for (final part in p.keys) {
      _final[part] = p[part] == null
          ? ''
          : avatarPlusUtils.getFinal(
              part, p[part]!.substring(0, 2), p[part]!.substring(2, 3));
    }

    return '$_svgStart'
        '${_final[_env]}${_final[_head]}${_final[_clo]}'
        '${_final[_top]}${_final[_eyes]}${_final[_mouth]}'
        '$_svgEnd';
  }
}
