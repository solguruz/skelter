import 'package:flutter_test/flutter_test.dart';
import 'package:skelter/utils/extensions/primitive_types_extensions.dart';

void main() {
  group('String Extensions', () {
    group('RegexHelperExtension', () {
      // Test hasLetterAndNumber()
      test(
          'hasLetterAndNumber returns true for strings with both letters and '
          'numbers', () {
        expect('abc123'.hasLetterAndNumber(), isTrue);
        expect('123abc'.hasLetterAndNumber(), isTrue);
        expect('a1b2c3'.hasLetterAndNumber(), isTrue);
      });

      test('hasLetterAndNumber returns false for letters only or numbers only',
          () {
        expect('abc'.hasLetterAndNumber(), isFalse);
        expect('123'.hasLetterAndNumber(), isFalse);
        expect(''.hasLetterAndNumber(), isFalse);
      });

      // Test hasSpecialCharacter()
      test(
          'hasSpecialCharacter returns true for strings with special '
          'characters', () {
        expect('hello!'.hasSpecialCharacter(), isTrue);
        expect('test@test.com'.hasSpecialCharacter(), isTrue);
        expect('pass#word'.hasSpecialCharacter(), isTrue);
        expect('with spaces and !@#'.hasSpecialCharacter(), isTrue);
      });

      test(
          'hasSpecialCharacter returns false for strings without special '
          'characters', () {
        expect('hello'.hasSpecialCharacter(), isFalse);
        expect('test123'.hasSpecialCharacter(), isFalse);
        expect(''.hasSpecialCharacter(), isFalse);
        expect('with spaces'.hasSpecialCharacter(), isFalse);
      });

      // Test reversed getter
      test('reversed returns the string in reverse order', () {
        // Arrange & Act & Assert
        expect('hello'.reversed, equals('olleh'));
        expect('12345'.reversed, equals('54321'));
        expect('a'.reversed, equals('a'));
        expect(''.reversed, equals(''));
      });
    });

    group('StringNullCheck', () {
      // Test isNullOrEmpty()
      test('isNullOrEmpty returns true for null or empty strings', () {
        String? nullString;

        expect(nullString.isNullOrEmpty(), isTrue);
        expect(''.isNullOrEmpty(), isTrue);
        // Whitespace string is not considered empty
        expect('   '.isNullOrEmpty(), isFalse);
      });

      test('isNullOrEmpty returns false for non-empty strings', () {
        expect('hello'.isNullOrEmpty(), isFalse);
        expect('  a  '.isNullOrEmpty(), isFalse);
        expect('123'.isNullOrEmpty(), isFalse);
      });

      // Test haveContent()
      test('haveContent returns true for non-null and non-empty strings', () {
        expect('hello'.haveContent(), isTrue);
        expect('  a  '.haveContent(), isTrue);
        expect('123'.haveContent(), isTrue);
        // Whitespace string is considered to have content
        expect('   '.haveContent(), isTrue);
      });

      test('haveContent returns false for null or empty strings', () {
        String? nullString;

        expect(nullString.haveContent(), isFalse);
        expect(''.haveContent(), isFalse);
      });
    });
  });

  group('Numeric Type Extensions', () {
    group('Precision (double)', () {
      // Test toPrecision()
      test('toPrecision rounds to specified decimal places', () {
        expect(3.14159.toPrecision(2), equals(3.14));
        expect(2.71828.toPrecision(3), equals(2.718));
        expect(1.5.toPrecision(0), equals(2.0));
        expect(1.2345.toPrecision(1), equals(1.2));
        expect(9.999.toPrecision(2), equals(10.0));
      });

      // Test isWithinRange()
      test(
          'isWithinRange returns true for values within range '
          '(inclusive upper bound)', () {
        expect(5.5.isWithinRange(1.0, 10.0), isTrue);
        expect(1.1.isWithinRange(1.0, 2.0), isTrue);
        // Boundary cases (inclusive upper bound, exclusive lower bound)
        expect(
          10.0.isWithinRange(1.0, 10.0),
          isTrue,
        ); // Equal to upper bound (included)
        expect(
          1.0.isWithinRange(1.0, 10.0),
          isFalse,
        ); // Equal to lower bound (excluded)
        expect(
          1.0001.isWithinRange(1.0, 10.0),
          isTrue,
        ); // Just above lower bound
        expect(
          0.9999.isWithinRange(1.0, 10.0),
          isFalse,
        ); // Just below lower bound
      });

      test('isWithinRange returns false for values outside range', () {
        expect(0.5.isWithinRange(1.0, 10.0), isFalse);
        expect(10.5.isWithinRange(1.0, 10.0), isFalse);
      });
    });

    group('IntRange', () {
      // Test withRange()
      test('withRange returns true for values within range (inclusive)', () {
        expect(5.withRange(1, 10), isTrue);
        expect(1.withRange(1, 10), isTrue);
        expect(10.withRange(1, 10), isTrue);
      });

      test('withRange returns false for values outside range', () {
        expect(0.withRange(1, 10), isFalse);
        expect(11.withRange(1, 10), isFalse);
        expect((-1).withRange(0, 5), isFalse);
      });
    });
  });

  group('Collection Extensions', () {
    // Test distinct()
    test('distinct returns list with unique elements', () {
      final list = [1, 2, 2, 3, 3, 3, 4];
      final stringList = ['a', 'b', 'a', 'c', 'b'];
      final emptyList = <int>[];
      final listWithNulls = [1, null, 2, 2, null, 3];

      expect(list.distinct(), equals([1, 2, 3, 4]));
      expect(stringList.distinct(), equals(['a', 'b', 'c']));
      expect(emptyList.distinct(), isEmpty);
      expect(listWithNulls.distinct(), equals([1, null, 2, 3]));
    });

    test('distinct preserves order of first occurrence', () {
      final list = [3, 1, 2, 1, 3, 2, 4];

      expect(list.distinct(), equals([3, 1, 2, 4]));
    });
  });
}
