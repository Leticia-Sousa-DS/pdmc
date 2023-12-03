import 'package:flutter/material.dart';
import 'package:nossa_lista_de_desenhos/components/cartoon.dart';

class CartoonInherited extends InheritedWidget {
   CartoonInherited({
    super.key,
    required Widget child,
  }) : super(child: child);

  final List<Cartoon> cartoonList = [
    Cartoon('Scooby Doo', 'assets/images/scooby_doo.jpeg', 5,),
    Cartoon('Meninas Superpoderosas','assets/images/meninas_superpoderosas.jpeg',4,),
    Cartoon('Johnny Bravo','assets/images/johnny_bravo.jpeg',3,),
    Cartoon('Caverna do Dragão','assets/images/caverna_do_dragao.jpeg',5,),
    Cartoon('Corrida Maluca','assets/images/corrida_maluca.jpg',5,),
  ];

  void newCartoon(String name, String photo, int rating){
    cartoonList.add(Cartoon(name, photo, rating));
  }

  static CartoonInherited of(BuildContext context) {
    final CartoonInherited? result = context.dependOnInheritedWidgetOfExactType<CartoonInherited>();
    assert(result != null, 'No CartoonInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(CartoonInherited old) {
    return old.cartoonList.length != cartoonList.length;
  }
}
