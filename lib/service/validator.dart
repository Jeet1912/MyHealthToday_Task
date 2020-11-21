class Validators {
  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return int.tryParse(s) != null;
  }

  bool isLess(int n) {
    if (n < 288) {
      return true;
    } else {
      return false;
    }
  }
}
