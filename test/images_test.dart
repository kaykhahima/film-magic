import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:film_magic/resources/resources.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.coverPhoto).existsSync(), isTrue);
  });
}
