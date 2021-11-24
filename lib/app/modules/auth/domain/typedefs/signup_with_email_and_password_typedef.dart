import 'package:dartz/dartz.dart';

import '../entities/signup_with_email_and_password_entity.dart';
import '../errors/signup_with_email_and_password_errors.dart';

typedef SignupWithEmailAndPasswordResult = Future<Either<SignupWithEmailAndPasswordError, SignupWithEmailAndPasswordEntity>>;
