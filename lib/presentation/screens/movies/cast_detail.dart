import 'package:flutter/material.dart';

class CastDetail extends StatelessWidget {
  const CastDetail({super.key, required this.image, required this.name});

  final String? image;
  final String name;
  static const String base = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(
                (image == null)
                    ? 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fimage.pngaaa.com%2F569%2F2189569-middle.png&f=1&nofb=1&ipt=3c1107b27e4001075d9ff05ebe1fe88d443ce79f5ab20ec4f004392acf213fef&ipo=images'
                    : 'https://image.tmdb.org/t/p/w500/${image!}',
              ),
            ),
            const SizedBox(
              width: 50,
            )
          ],
        ),
        Text(
          name,
          softWrap: true,
          maxLines: 2,
          overflow: TextOverflow.fade,
        )
      ],
    );
  }
}
