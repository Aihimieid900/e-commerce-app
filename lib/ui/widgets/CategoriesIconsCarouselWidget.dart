import 'package:ecommerce_app_ui_kit/config/ui_icons.dart';
import 'package:ecommerce_app_ui_kit/models/category.dart';
import 'package:ecommerce_app_ui_kit/ui/widgets/CategoryIconWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesIconsCarouselWidget extends StatefulWidget {
  // CategoriesList categoriesList;
  String heroTag;
  ValueChanged<int> onChanged;

  CategoriesIconsCarouselWidget(
      {Key key,
      // this.categoriesList,
      this.heroTag,
      this.onChanged})
      : super(key: key);

  @override
  _CategoriesIconsCarouselWidgetState createState() =>
      _CategoriesIconsCarouselWidgetState();
}

class _CategoriesIconsCarouselWidgetState
    extends State<CategoriesIconsCarouselWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: 80,
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor.withOpacity(1),
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(60),
                  topRight: Radius.circular(60)),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/Categories');
              },
              icon: Icon(
                UiIcons.settings_2,
                size: 28,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          Expanded(
            child: Container(
                margin: EdgeInsets.only(left: 0),
                decoration: BoxDecoration(
                  color: Theme.of(context).accentColor.withOpacity(1),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(60),
                      topLeft: Radius.circular(60)),
                ),
                child: Consumer<CategoriesList>(
                  builder: (context, categoriesList, child) => ListView.builder(
                    itemCount: categoriesList.list.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      double _marginLeft = 0;
                      (index == 0) ? _marginLeft = 12 : _marginLeft = 0;
                      return CategoryIconWidget(
                          heroTag: widget.heroTag,
                          marginLeft: _marginLeft,
                          category: categoriesList.list.elementAt(index),
                          onPressed: (int id) {
                            setState(() {
                              categoriesList.selectById(id);
                              widget.onChanged(id);
                            });
                          });
                    },
                    scrollDirection: Axis.horizontal,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
