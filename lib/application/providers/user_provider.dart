import 'package:cred_app/data/models/user_model.dart';
import 'package:cred_app/data/repositories/user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userRepositoryProvider = Provider((ref) => UserRepository());
final userListProvider = StateNotifierProvider<UserNotifier, List<User>>((ref) {
  final repository = ref.watch(userRepositoryProvider);
  return UserNotifier(repository);
});

class UserNotifier extends StateNotifier<List<User>> {
  final UserRepository repository;
  UserNotifier(this.repository) : super([]) {
    loadUsers();
  }

  Future<void> loadUsers() async {
    state = await repository.getAllUsers();
  }

  Future<void> addUser(User user) async {
    await repository.createUser(user);
    loadUsers();
  }

  Future<void> updateUser(User user) async {
    await repository.updateUser(user);
    loadUsers();
  }

  Future<void> deleteUser(int id) async {
    await repository.deleteUser(id);
    loadUsers();
  }
}