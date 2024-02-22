import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Card(
        elevation: 6,
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
            FilledButton(onPressed: () {}, child: const Text('Iniciar sesión')),
            const Divider(
              thickness: 2,
              color: Color.fromARGB(255, 235, 141, 172),
            ),
            const Text('Última visita el día: 07/02/2024'),
          ],
        ),
      ),
    );
  }
}
