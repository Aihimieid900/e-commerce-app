import 'package:ecommerce_app_ui_kit/src/core/models/category.dart';
import 'package:ecommerce_app_ui_kit/src/core/models/route_argument.dart';
import 'package:ecommerce_app_ui_kit/src/ui/widgets/DrawerWidget.dart';
import 'package:ecommerce_app_ui_kit/src/ui/widgets/LoadingPlaced2item.dart';
import 'package:ecommerce_app_ui_kit/src/ui/widgets/SearchBarWidget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class CategoriesWidget extends StatefulWidget {
  @override
  _CategoriesWidgetState createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  CategoriesList _categoriesList = GetIt.I<CategoriesList>();
  SubCategoriesList _subCategoriesList = new SubCategoriesList();

  // void getCategories() async {
  //   isLoading = true;
  //   listCategories = await _categoriesList.getCategories();
  //   listSubCategories = _subCategoriesList.getSubCategory();
  //   setState(() {
  //     _categoriesList.list = listCategories;
  //     _subCategoriesList.list = listSubCategories;
  //     if (_categoriesList.list.isNotEmpty) isLoading = false;
  //   });
  // }
  int index;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //  context.read<SubCategoriesList>().getSubCategory();
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      // appBar:  AppBar(
      //   automaticallyImplyLeading: false,
      //   leading: new IconButton(
      //     icon: new Icon(Icons.sort, color: Theme.of(context).hintColor),
      //     onPressed: () => Navigator.of(context).pop(),
      //   ),
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   title: Text(
      //     'Categories',
      //     style: Theme.of(context).textTheme.display1,
      //   ),
      //   actions: <Widget>[
      //     new ShoppingCartButtonWidget(
      //         iconColor: Theme.of(context).hintColor, labelColor: Theme.of(context).accentColor),
      //     Container(
      //         width: 30,
      //         height: 30,
      //         margin: EdgeInsets.only(top: 12.5, bottom: 12.5, right: 20),
      //         child: InkWell(
      //           borderRadius: BorderRadius.circular(300),
      //           onTap: () {
      //             Navigator.of(context).pushNamed('/Tabs', arguments: 1);
      //           },
      //           child: CircleAvatar(
      //             backgroundImage: AssetImage('img/user2.jpg'),
      //           ),
      //         )),
      //   ],
      // ),
      body: Provider.of<CategoriesList>(context).isLoading()
          ? LoadingPlace2or1Item()
          : SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Wrap(
                runSpacing: 20,
                children: <Widget>[
                  SearchBarWidget(),
                  Wrap(
                    runSpacing: 30,
                    children: List.generate(
                        Provider.of<CategoriesList>(context).itemCount,
                        (index) {
                      Category category = Provider.of<CategoriesList>(context)
                          .list
                          .elementAt(index);
                      return index.isEven
                          ? buildEvenCategory(context, category)
                          : buildOddCategory(context, category);
                    }),
                  ),
                ],
              ),
//        child: buildOddCategory(context),
            ),
    );
  }

  subbCategory() {}
  Widget buildEvenCategory(BuildContext context, Category category) {
    var modelSub =Provider.of<CategoriesList>(context); 
    
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          width: 120,
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                          color: Theme.of(context).hintColor.withOpacity(0.10),
                          offset: Offset(0, 4),
                          blurRadius: 10)
                    ],
                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [
                          Theme.of(context).accentColor,
                          Theme.of(context).accentColor.withOpacity(0.2),
                        ])),
                child: Column(
                  children: <Widget>[
                    // Hero(
                    //   tag: category.id,
                    //   child: Text(
                    //       category.name,
                    //       style:TextStyle(color: Theme.of(context).primaryColor,
                    //       ),
                    //     ),
                    // ),
                    SizedBox(height: 5),
                    Text(
                      category.name,
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    )
                  ],
                ),
              ),
              Positioned(
                right: -40,
                bottom: -60,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(150),
                  ),
                ),
              ),
              Positioned(
                left: -30,
                top: -60,
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(150),
                  ),
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                    color: Theme.of(context).hintColor.withOpacity(0.10),
                    offset: Offset(0, 4),
                    blurRadius: 10)
              ],
            ),
            constraints: BoxConstraints(minHeight: 120),
            child:  Wrap(
                runAlignment: WrapAlignment.center,
                spacing: 10,
                runSpacing: 5,
                children: 
                modelSub.list.firstWhere((element) {
                  setState(() {
                    
                 index = modelSub.list.indexOf(element);
                  });
                  return element.id == category.id;}).subCategory.map((e) => 
                  Material(
                      borderRadius: BorderRadius.circular(30),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed('/Category',
                              arguments: RouteArgument(
                                  id: index, argumentsList: [category]));
                        },
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                                color: Theme.of(context)
                                    .hintColor
                                    .withOpacity(0.2)),
                          ),
                          child: Text(
                            e.name,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                      ),
                    )
                
                ).toList(),
                // List.(modelSub.list..itemCount, (index) {
                //   SubCategory subCategory = modelSub.list.elementAt(index);
                //   //  if( category.id == subCategory.parent)
                //   if (Provider.of<CategoriesList>(context, listen: false)
                //       .list
                //       .every((element) => element.id == subCategory.parent))
                //     return Material(
                //       borderRadius: BorderRadius.circular(30),
                //       child: InkWell(
                //         onTap: () {
                //           Navigator.of(context).pushNamed('/Category',
                //               arguments: RouteArgument(
                //                   id: index, argumentsList: [category]));
                //         },
                //         borderRadius: BorderRadius.circular(20),
                //         child: Container(
                //           padding:
                //               EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                //           decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(30),
                //             border: Border.all(
                //                 color: Theme.of(context)
                //                     .hintColor
                //                     .withOpacity(0.2)),
                //           ),
                //           child: Text(
                //             subCategory.name,
                //             style: Theme.of(context).textTheme.bodyText1,
                //           ),
                //         ),
                //       ),
                //     );
                //   else
                //     return Text(
                //       subCategory.name,
                //       style: Theme.of(context).textTheme.bodyText1,
                //     );
                // }),
              ),
            
          ),
        )
      ],
    );
  }

  Widget buildOddCategory(BuildContext context, Category category) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                    color: Theme.of(context).hintColor.withOpacity(0.10),
                    offset: Offset(0, 4),
                    blurRadius: 10)
              ],
            ),
            constraints: BoxConstraints(minHeight: 120),
            child: Consumer<SubCategoriesList>(
              builder: (context, modelSub, child) => Wrap(
                runAlignment: WrapAlignment.center,
                spacing: 10,
                runSpacing: 5,
                children: List.generate(modelSub.itemCount, (index) {
                  SubCategory subCategory = modelSub.list.elementAt(index);

                  return Material(
                    borderRadius: BorderRadius.circular(30),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed('/Category',
                            arguments: RouteArgument(
                                id: index, argumentsList: [category]));
                      },
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                              color:
                                  Theme.of(context).hintColor.withOpacity(0.2)),
                        ),
                        child: Text(
                          subCategory.name,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 120,
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                          color: Theme.of(context).hintColor.withOpacity(0.10),
                          offset: Offset(0, 4),
                          blurRadius: 10)
                    ],
                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [
                          Theme.of(context).accentColor,
                          Theme.of(context).accentColor.withOpacity(0.2),
                        ])),
                child: Column(
                  children: <Widget>[
                    // Hero(
                    //   tag: category.id,
                    //   child: Text(
                    //       category.name,
                    //       style:TextStyle(color: Theme.of(context).primaryColor,
                    //       ),
                    //     ),
                    // ),
                    SizedBox(height: 5),
                    Text(
                      category.name,
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    )
                  ],
                ),
              ),
              Positioned(
                right: -40,
                bottom: -60,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(150),
                  ),
                ),
              ),
              Positioned(
                left: -30,
                top: -60,
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(150),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}