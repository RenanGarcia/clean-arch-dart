import 'package:test/test.dart';

import 'package:clean_arch_dart/domain/vo/cpf.dart';

void main() {
  group('Cpf', () {
    test('Deve testar se o CPF é válido', () {
      List<String> validCpfs = ["763.410.050-16", "71428793860", "87748248800"];
      for (String cpf in validCpfs) {
        expect(Cpf(cpf), isA<Cpf>());
      }
    });

    test('Deve testar se o CPF é inválido', () {
      List<String?> invalidCpfs = [
        "",
        null,
        "123456",
        "1234567891011121314",
        "11111111111"
      ];
      for (String? cpf in invalidCpfs) {
        expect(() => Cpf(cpf), throwsA(isA<Exception>()));
      }
    });
  });
}
