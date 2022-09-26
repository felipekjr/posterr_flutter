class StringValidators {
  static bool hasNoSpecialCharacteres(String str) {
    return RegExp(r'^[ 0-9a-zA-ZáàâãéèêíïóôõöúçñÁÀÂÃÊÉÈÍÏÓÔÕÖÚÇ]+$').hasMatch(str);
  }
}