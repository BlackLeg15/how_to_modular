abstract class LifecareException {
  String message;
  LifecareException({
    required this.message,
  });
  @override
  String toString() {
    return message;
  }
}
