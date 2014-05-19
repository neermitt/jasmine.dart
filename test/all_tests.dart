// Copyright (C) 2013 - 2014 Jasmine Dart authors. Please see AUTHORS.md.
// https://github.com/neermitt/jasmine.dart
// All rights reserved.  Please see the LICENSE.md file.

library jasmine.test;

import 'package:unittest/unittest.dart';
import 'package:unittest/html_enhanced_config.dart';

import 'package:mock/mock.dart';

import 'package:jasmine/jasmine.dart';


part 'interface_tests.dart';

/**
 * Unit testing for Jasmine library.
 */



void main() {
  useHtmlEnhancedConfiguration();
  group('All Tests:', () {
    group('interface', testInterface);
  });
}