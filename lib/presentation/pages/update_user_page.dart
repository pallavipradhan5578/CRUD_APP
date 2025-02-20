import 'package:cred_app/data/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../application/providers/user_provider.dart';

class UpdateUserPage extends ConsumerWidget {
  final User user;
  UpdateUserPage({required this.user});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    nameController.text = user.name;
    emailController.text = user.email;

    return Scaffold(
      appBar: AppBar(title: Text('Update User')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final updatedUser = User(id: user.id, name: nameController.text, email: emailController.text);
                ref.read(userListProvider.notifier).updateUser(updatedUser);
                Navigator.pop(context);
              },
              child: Text('Update User'),
            ),
          ],
        ),
      ),
    );
  }
}
