import 'package:dartz/dartz.dart';

import '../../domain/errors/login_with_email_and_password_errors.dart';
import '../../domain/repositories/formmatter_repository.dart';
import '../services/formatter_repository.dart';

class FormatterRepositoryImpl implements FormatterRepository {
  final FormatterService _service;

  FormatterRepositoryImpl(this._service);

  @override
  Future<Either<LoginWithEmailAndPasswordError, String>> formatEmail(String email) async {
    try {
      final result = await _service.formatEmail(email);
      return Right(result);
    } on LoginWithEmailAndPasswordError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(UnknownLoginWithEmailInfraError('Unknown Login With E-mail Error: $stacktrace'));
    }
  }
}
