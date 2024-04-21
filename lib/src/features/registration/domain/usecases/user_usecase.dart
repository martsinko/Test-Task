

import 'package:dartz/dartz.dart';
import 'package:leprekon_program/core/usecase/usecase.dart';
import 'package:leprekon_program/src/features/registration/domain/entities/user.dart';
import 'package:leprekon_program/src/features/registration/domain/repositories/user_repository.dart';

import '../../../../../core/failures/failure.dart';

class SignUpUseCase implements UseCase<void, RegsiterUserParams>{
final UserRepository userRepository;

SignUpUseCase({required this.userRepository});

@override
  Future<Either<Failure, void>> call(RegsiterUserParams params) async{
      final newUser = User(email: params.email, password: params.password);
      return await userRepository.signUp(newUser.email, newUser.password).
      then((result){
            return result.map((newUser) => right(unit));
      });
        }
          }
class RegsiterUserParams{
 final String email;
  final String password;

  RegsiterUserParams({required this.email, required this.password});
}