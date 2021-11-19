import 'package:dartz/dartz.dart';

import '../entities/login_with_email_and_password_entity.dart';
import '../errors/login_with_email_and_password_errors.dart';

typedef LoginWithEmailAndPasswordResult = Future<Either<LoginWithEmailAndPasswordDomainError, LoginWithEmailAndPasswordEntity>>;
