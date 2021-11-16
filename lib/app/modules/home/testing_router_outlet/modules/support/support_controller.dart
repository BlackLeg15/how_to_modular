class SupportController {
  Future<int> getValue() {
    return Future.delayed(const Duration(seconds: 4), () {
      return 10;
    });
  }
}
