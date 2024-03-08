import 'package:flutter/material.dart';

class AccountData extends StatelessWidget {
  final String account;
  const AccountData({super.key, required this.account});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            'Ultimos movimientos de la cuenta $account',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(
            thickness: 2,
            color: Color.fromARGB(255, 235, 141, 172),
          ),
          const SizedBox(
            width: 100,
            child: Image(
                image: NetworkImage(
                    'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwallpaperaccess.com%2Ffull%2F3770400.jpg&f=1&nofb=1&ipt=c2705bc88de7bdd61d9e54e14a06ffb012ec2ff707a926d02bdce4bbde57fdd1&ipo=images')),
          )
        ],
      ),
    );
  }
}
