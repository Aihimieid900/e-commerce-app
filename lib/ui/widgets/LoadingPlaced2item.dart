import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class LoadingPlace2or1Item extends StatelessWidget {
  final int count;
  LoadingPlace2or1Item({this.count = 1});

  twoOrOneSpinner() {
    switch (count) {
      case 1:
        return CardForCircular();
        break;
      case 2:
        //  twoWidget();
        break;
      default:
        return CardForCircular();
    }
  }

  List<CardForCircular> getSpinnerWidgets() {
    List<CardForCircular> list = new List<CardForCircular>();
    for (var i = 0; i < count; i++) {
      list.add(new CardForCircular());
    }
    return list;
  }

  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: getSpinnerWidgets(),
    );
  }
}

class CardForCircular extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      child: Center(
        child: SleekCircularSlider(
            appearance: CircularSliderAppearance(
          size: 38,
          spinnerMode: true,
        )),
      ),
    );
  }
}
