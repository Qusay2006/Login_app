import 'package:flutter/material.dart';

import 'textcolors.dart';

class HeroWidget extends StatelessWidget {
  const HeroWidget({super.key,required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return
            Stack(alignment: Alignment.center,
            children: [
              ClipRRect(borderRadius: BorderRadius.circular(49),
                child: Hero(tag: "Login",
                    child: Image(
                        image: NetworkImage(
                            'https://picsum.photos/200'),
                                width: 230,
                                    height: 210,)
                                         ),
              ),
              FittedBox(
                child: Padding(
                  padding: const EdgeInsets.all(19.0),
                  child: Text(title,style: extcolors.Herotext,)),
                ),
                       ],
          );
  }
}
