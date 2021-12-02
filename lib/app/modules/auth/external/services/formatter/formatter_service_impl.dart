import '../../../infra/services/formatter_repository.dart';

class FormatterServiceImpl implements FormatterService {
  @override
  Future<String> formatEmail(String email) async {
    return email.trim();
  }
}
