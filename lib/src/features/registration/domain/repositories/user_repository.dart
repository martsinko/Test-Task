
import 'package:dartz/dartz.dart';
import 'package:leprekon_program/core/failures/failure.dart';

import '../entities/user.dart';

abstract class UserRepository{
  Future<Either<Failure, User>> signUp(String email, String password);
}