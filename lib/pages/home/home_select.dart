import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            // IconButton(
            //   onPressed: () => context.router.push(
            //     CheckListRoute(),
            //   ),
            //   icon: Icon(Icons.check),
            // ),
            IconButton(
              onPressed: () => context.router.push(
                ProfileTab(),
              ),
              icon: Icon(Icons.settings),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Ink(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(1.0, 2.0),
                        blurRadius: 5.0,
                        spreadRadius: 2.0,
                      ),
                    ],
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(15.0),
                    onTap: () {
                      context.router.push(
                        CheckListRoute(),
                      );
                    },
                    child: Container(
                      width: ScreenUtil().setWidth(650),
                      height: ScreenUtil().setHeight(650),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Center(
                            child: Image.network(
                              'https://cdn-icons-png.flaticon.com/512/1533/1533031.png',
                              width: ScreenUtil().setWidth(450),
                              height: ScreenUtil().setHeight(450),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            'Checklist',
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(60),
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    HomeIcon(
                      component: GetVehicleInfo(type: 'RPK'),
                      image: imageConstant.kppIcon,
                      name: 'RPK',
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    HomeIcon(
                      component: GetVehicleInfo(type: 'Jalan Raya'),
                      image: imageConstant.kppIcon,
                      name: 'Jalan Raya',
                    ),
                    // Expanded(
                    //   child: Ink(
                    //     decoration: BoxDecoration(
                    //       color: Colors.white,
                    //       borderRadius: BorderRadius.circular(15.0),
                    //       boxShadow: [
                    //         BoxShadow(
                    //           color: Colors.black12,
                    //           offset: Offset(1.0, 2.0),
                    //           blurRadius: 5.0,
                    //           spreadRadius: 2.0,
                    //         ),
                    //       ],
                    //     ),
                    //     child: Column(
                    //       mainAxisAlignment: MainAxisAlignment.center,
                    //       children: <Widget>[
                    //         Center(
                    //           child: Image.asset(
                    //             imageConstant.kppIcon,
                    //             // width: ScreenUtil().setWidth(450),
                    //             // height: ScreenUtil().setHeight(450),
                    //           ),
                    //         ),
                    //         SizedBox(height: 10.0),
                    //         Text(
                    //           'RPK',
                    //           style: TextStyle(
                    //             fontSize: ScreenUtil().setSp(60),
                    //             fontWeight: FontWeight.w500,
                    //             color: Colors.black,
                    //           ),
                    //           textAlign: TextAlign.center,
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                SizedBox(
                  height: 8.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    HomeIcon(
                      component: null,
                      image: imageConstant.kppIcon,
                      name: 'RSM',
                    ),
                    Expanded(child: SizedBox()),
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
