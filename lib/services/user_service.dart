import 'package:postgres/postgres.dart';
import 'package:uitraining/models/user.dart';
import 'package:uitraining/repositories/user_repository.dart';

class UserService {
  UserRepository? _userRepository;

  UserService._privateConstructor() {
    _userRepository = UserRepository();
  }

  factory UserService() => UserService._privateConstructor();

  Future<List<User>> getAllUsers() async {
    Result mesUsers = await _userRepository!.getUsers();
    return convertUsers(mesUsers);
  }

  List<User> convertUsers(Result rowsUser) {
    List<User> users = [];
    for (var i = 0; i < rowsUser.length; i++) {
      User u = User(
          id: BigInt.from(rowsUser[i][1] as int),
          prenom: rowsUser[i][2] as String,
          nom: rowsUser[i][0] as String);
      users.add(u);
    }

    return users;
  }
}
