import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class LoadingPlace2Item extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        CardForCircular(),
        CardForCircular(),
      ],
    );
  }
}

class CardForCircular extends StatelessWidget {
  const CardForCircular({
    Key key,
  }) : super(key: key);

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
