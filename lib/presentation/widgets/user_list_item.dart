import 'package:cred_app/application/providers/user_provider.dart';
import 'package:cred_app/data/models/user_model.dart';
import 'package:cred_app/presentation/pages/update_user_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserListItem extends ConsumerWidget {
  final User user;

  UserListItem({required this.user});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UpdateUserPage(user: user)),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.delete, color: Colors.red),
            onPressed: () => ref.read(userListProvider.notifier).deleteUser(user.id!),
          ),
        ],
      ),
    );
  }
}
