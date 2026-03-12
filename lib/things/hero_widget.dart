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
                            'https://images.unsplash.com/photo-1667227283849-24396056348f?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fGdyYXklMjBiYWNrZ3JvdW5kfGVufDB8fDB8fHww'),
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
