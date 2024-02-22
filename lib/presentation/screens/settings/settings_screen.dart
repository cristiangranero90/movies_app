import 'package:flutter/material.dart';
import 'package:movies_app/presentation/screens/settings/account_data.dart';
import 'package:movies_app/presentation/screens/settings/user_card.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuración de la cuenta'),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: ListView(
        children: const [UserCard(), AccountData(account: 'Name of...')],
      ),
    );
  }
}
