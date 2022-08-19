import 'package:flutter/material.dart';
import 'package:jpj_qto/utils/constants.dart';
import 'package:auto_route/auto_route.dart';

import '../../router.gr.dart';
import 'home_icon.dart';

class HomeSelect extends StatefulWidget {
  HomeSelect({Key? key}) : super(key: key);

  @override
  _HomeSelectState createState() => _HomeSelectState();
}

class _HomeSelectState extends State<HomeSelect> {
  final imageConstant = ImagesConstant();
  final primaryColor = ColorConstant.primaryColor;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white,
            primaryColor,
          ],
          stops: [0.45, 0.65],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.grey,
          elevation: 0,
          actions: <Widget>[
            IconButton(
              onPressed: () => context.router.push(
                CheckListRoute(),
              ),
              icon: Icon(Icons.check),
            ),
            IconButton(
              onPressed: () => context.router.push(
                ProfileTab(),
              ),
              icon: Icon(Icons.settings),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: <Widget>[
                SizedBox(height: 20),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                HomeIcon(
                                  component: GetVehicleInfo(type: 'RPK'),
                                  image: imageConstant.kppIcon,
                                  name: 'RPK',
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                HomeIcon(
                                  component: GetVehicleInfo(type: 'Jalan Raya'),
                                  image: imageConstant.kppIcon,
                                  name: 'Jalan Raya',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    )
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
