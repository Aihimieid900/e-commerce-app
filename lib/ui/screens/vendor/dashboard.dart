import 'package:ecommerce_app_ui_kit/helpers/style/constants.dart';
import 'package:ecommerce_app_ui_kit/l10n/App_Localizations.dart';

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    var modelLang = AppLocalizations.of(context);
    List<DashboardButton> _listBtn = [
      DashboardButton(
        modelLang: modelLang,
        nameBtn: 'add_product',
        namePage: '/AddProduct',
        icon: Icons.folder,
      ),
      DashboardButton(
        modelLang: modelLang,
        nameBtn: 'add_category',
        namePage: '/AddCategory',
        icon: Icons.category,
      ),
      DashboardButton(
        modelLang: modelLang,
        nameBtn: 'add_tag',
        namePage: '/AddTag',
        icon: Icons.tab,
      ),
      DashboardButton(
        modelLang: modelLang,
        nameBtn: 'add_product',
        namePage: '/AddProduct',
        icon: Icons.folder,
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(modelLang.translate("dashboard")),
        actions: <Widget>[
          Container(
            width: 30,
            height: 30,
            margin: EdgeInsets.only(top: 12.5, bottom: 12.5, right: 20),
            child: InkWell(
              borderRadius: BorderRadius.circular(300),
              onTap: () {
                Navigator.of(context).pushNamed('/Tabs', arguments: 1);
              },
              child: CircleAvatar(
                backgroundImage: AssetImage('img/user2.jpg'),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                StaggeredGridView.countBuilder(
                  primary: false,
                  shrinkWrap: true,
                  crossAxisCount: 4,
                  itemCount: _listBtn.length,
                  itemBuilder: (BuildContext context, int index) {
                    Widget btn = _listBtn.elementAt(index);
                    return btn;
                  },
//                  staggeredTileBuilder: (int index) => new StaggeredTile.fit(index % 2 == 0 ? 1 : 2),
                  staggeredTileBuilder: (int index) => new StaggeredTile.fit(2),
                  mainAxisSpacing: 15.0,
                  crossAxisSpacing: 15.0,
                ),
                BackgroundInDashboard(
                  title: modelLang.translate("sales"),
                  height: 180,
                  icon: Icons.money_off,
                ),
                SizedBox(
                  height: 10,
                ),
//                BackgroundInDashboard(
//                  title: modelLang.translate("customers"),
//                  height: 80,
//                  icon: Icons.people,
//                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SquareCounterApi(),
                    SquareCounterApi(),
                    SquareCounterApi(),
                    SquareCounterApi(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SquareCounterApi extends StatelessWidget {
  @override
  build(BuildContext context) {
    return Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(10),
      child: Container(
//                width: 100,
//                height: 100,
          decoration: BoxDecoration(
            gradient: kGradientColor(context),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.people,
                    size: 22,
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text('customers', style: TextStyle(fontSize: 16)),
                  Text("100", style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
          )),
    );
  }
}

class BackgroundInDashboard extends StatelessWidget {
  final dynamic title;
  final double height;
  final IconData icon;
  BackgroundInDashboard({this.title, this.height, this.icon});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Theme.of(context).hintColor.withOpacity(0.10),
                  offset: Offset(0, 4),
                  blurRadius: 10)
            ],
            gradient: kGradientColor(context),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                icon,
                size: 32,
              ),
              SizedBox(
                width: 5,
              ),
              Text(title, style: TextStyle(fontSize: 18.0)),
            ],
          ),
        ),
      ],
    );
  }
}

class DashboardButton extends StatelessWidget {
  const DashboardButton(
      {@required this.modelLang, this.nameBtn, this.namePage, this.icon});
  final IconData icon;
  final String nameBtn;
  final String namePage;
  final AppLocalizations modelLang;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, namePage);
      },
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
//                width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
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
                  ]),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  icon,
                  size: 32,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(modelLang.translate(nameBtn),
                    style: TextStyle(fontSize: 18.0)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SimpleLineChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  SimpleLineChart(this.seriesList, {this.animate});

  /// Creates a [LineChart] with sample data and no transition.
  factory SimpleLineChart.withSampleData() {
    return new SimpleLineChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new charts.LineChart(seriesList, animate: animate);
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<LinearSales, String>> _createSampleData() {
    final data = [
      new LinearSales("0", "5"),
      new LinearSales("1", "25"),
      new LinearSales("2", "100"),
      new LinearSales("3", "75"),
    ];

    return [
      new charts.Series<LinearSales, String>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => int.parse(sales.sales),
        data: data,
      )
    ];
  }
}

/// Sample linear data type.
class LinearSales {
  final String year;
  final String sales;

  LinearSales(this.year, this.sales);
}
