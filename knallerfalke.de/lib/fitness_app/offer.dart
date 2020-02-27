
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';

class Offer extends InheritedWidget {

  final List<Widget> offers;


  const Offer({
    Key key,
    @required this.offers,
    Widget child
  }): super(key: key, child: child);

  @override
  bool updateShouldNotify(Offer old) =>
      !IterableEquality().equals(offers, old.offers);

  static Offer of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<Offer>();

}