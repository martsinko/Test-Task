
import 'package:firebase_auth/firebase_auth.dart';
import '../models/user_model.dart';

abstract class RemoteDataSource{
  Future<UserModel> signUp(String email, String password);
}

 class RemoteDataSourceImpl implements RemoteDataSource{
final FirebaseAuth _firebaseAuth;

RemoteDataSourceImpl({required FirebaseAuth firebaseAuth})
  : _firebaseAuth = firebaseAuth;

@override
Future<UserModel> signUp(String email, String password) async{
 try{
      UserCredential user = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, 
        password: password);

        UserModel userModel = UserModel(
          email: user.user!.email ?? '', 
          password: password);
             return userModel;
              } catch(e, stackTrace){
                  print('Помилка Firebase: $e\n$stackTrace');
                  throw Exception("Не вдалося зареєструвати користувача");
      }
        }
          }