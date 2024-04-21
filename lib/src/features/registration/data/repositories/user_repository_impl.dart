 

import 'package:dartz/dartz.dart';
import 'package:leprekon_program/core/failures/failure.dart';
import 'package:leprekon_program/src/features/registration/data/datasources/remote_datasource.dart';
import 'package:leprekon_program/src/features/registration/domain/entities/user.dart';

import '../../domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository{
  final RemoteDataSource remoteDataSource;

  UserRepositoryImpl({required this.remoteDataSource});


@override
Future<Either<Failure,User>> signUp(String email, String password) async{
  try{
        final res = await remoteDataSource.signUp(email, password);

        return Right(User(email: res.email, password: res.password));


  } catch(e){
    print("UserRepository Error: $e");
    throw Exception("Failed to register user");
  }
    }
      }