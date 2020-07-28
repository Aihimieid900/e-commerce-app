import 'package:ecommerce_app_ui_kit/l10n/App_Localizations.dart';
import 'package:ecommerce_app_ui_kit/models/review.dart';
import 'package:ecommerce_app_ui_kit/helpers/style/constants.dart';
import 'package:ecommerce_app_ui_kit/ui/widgets/ReviewItemWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'LoadingPlaced2item.dart';

// ignore: must_be_immutable
class ReviewsListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var modelLang = AppLocalizations.of(context);

    return Consumer<ReviewsList>(
      builder: (context, value, child) => value.isLoading()
          ? LoadingPlace2or1Item()
          : ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 20),
              itemBuilder: (context, index) {
                return value.reviewCount() == 0
                    ? Text(
                        modelLang.translate("product_not_have_review"),
                        textAlign: TextAlign.center,
                        style: kStyleTextNoItem,
                      )
                    : ReviewItemWidget(
                        review: value.reviewsList.elementAt(index));
              },
              separatorBuilder: (context, index) {
                return Divider(
                  height: 30,
                );
              },
              itemCount: value.reviewCount() == 0 ? 1 : value.reviewCount(),
              primary: false,
              shrinkWrap: true,
            ),
    );
  }
}
