import 'package:flutter/material.dart';

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
      body: SizedBox(
        width: double.maxFinite,
        child: Card(
          elevation: 12,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.all(Radius.circular(20))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircleAvatar(
                maxRadius: 80,
                backgroundImage: AssetImage('images/empty_profile.png'),
              ),
              const Text(
                'User name',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              FilledButton(
                  onPressed: () {}, child: const Text('Iniciar sesión')),
              const Divider(
                thickness: 2,
                color: Color.fromARGB(255, 235, 141, 172),
              ),
              const Text('Information of the current user'),
            ],
          ),
        ),
      ),
    );
  }
}
