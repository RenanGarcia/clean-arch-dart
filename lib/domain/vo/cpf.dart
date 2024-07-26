class Cpf {
  late String value;
  final int maxLength = 11;
  final int factorFirstDigit = 10;
  final int factorSecondDigit = 11;

  Cpf(String? cpf) {
    if (cpf == null || !validate(cpf)) {
      throw Exception('Invalid CPF');
    }
    value = cleanCharacters(cpf);
  }

  bool validate(String cpf) {
    if (cpf.isEmpty) return false;
    String cleanedCpf = cleanCharacters(cpf);
    if (!isValidLength(cleanedCpf)) return false;
    if (isAllDigitsEquals(cleanedCpf)) return false;
    int digit1 = calculateDigit(cleanedCpf, factorFirstDigit);
    int digit2 = calculateDigit(cleanedCpf, factorSecondDigit);
    return extractDigit(cleanedCpf) == '$digit1$digit2';
  }

  String cleanCharacters(String cpf) {
    return cpf.replaceAll(RegExp(r'\D'), '');
  }

  bool isValidLength(String cpf) {
    return cpf.length == maxLength;
  }

  bool isAllDigitsEquals(String cpf) {
    String firstDigit = cpf[0];
    for (int i = 1; i < cpf.length; i++) {
      if (cpf[i] != firstDigit) return false;
    }
    return true;
  }

  int calculateDigit(String cpf, int factor) {
    int total = 0;
    for (int i = 0; i < cpf.length - 1; i++) {
      if (factor > 1) {
        total += int.parse(cpf[i]) * factor--;
      }
    }
    int remainder = total % 11;
    return remainder < 2 ? 0 : 11 - remainder;
  }

  String extractDigit(String cpf) {
    return cpf.substring(maxLength - 2);
  }

  String getValue() {
    return value;
  }
}
