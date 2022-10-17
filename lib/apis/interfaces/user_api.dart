import 'package:asset_tracker/apis/models/models.dart';

abstract class UserApi {
  Future<List<User>> getUsers();
  Future<User> getUser(String id);
  Future<User> addUser(User user);
  Future<User> updateUser(User user);
  Future<User> deleteUser(User user);
}
