import 'package:ecommerce_app_ui_kit/src/models/review.dart';
import 'package:ecommerce_app_ui_kit/src/widgets/ReviewItemWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ReviewsListWidget extends StatelessWidget {
  List<ReviewsList> _reviewsList =[];

  ReviewsListWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 20),
      itemBuilder: (context, index) {
        return ReviewItemWidget(review: Provider.of<ReviewsList>(context).reviewsList.elementAt(index));
      },
      separatorBuilder: (context, index) {
        return Divider(
          height: 30,
        );
      },
      itemCount: Provider.of<ReviewsList>(context).reviewCount(),
      primary: false,
      shrinkWrap: true,
    );
  }
}
