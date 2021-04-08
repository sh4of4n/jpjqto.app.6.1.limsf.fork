// import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:jpj_qto/common_library/utils/app_localizations.dart';
import 'package:jpj_qto/utils/constants.dart';
import 'package:jpj_qto/common_library/utils/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../router.gr.dart';

class SelectDrivingInstitute extends StatelessWidget {
  final diList;

  SelectDrivingInstitute(this.diList);

  final primaryColor = ColorConstant.primaryColor;
  final localStorage = LocalStorage();

  final RegExp exp =
      RegExp("\\[(.*?)\\]", multiLine: true, caseSensitive: true);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.amber.shade300,
            primaryColor,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomRight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 25.0),
          child: Column(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Image.asset(
                      ImagesConstant().logo,
                      width: ScreenUtil().setWidth(1000),
                      height: ScreenUtil().setHeight(600),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.all(10.0),
                alignment: Alignment.center,
                child: Text(
                    AppLocalizations.of(context).translate('select_di_desc'),
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
              ),
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: diList.length,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  // mainAxisSpacing: 15.0,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          localStorage.saveDiCode(diList[index].merchantNo);

                          ExtendedNavigator.of(context).replace(Routes.home);
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 10.0),
                          padding: EdgeInsets.symmetric(vertical: 5.0),
                          width: ScreenUtil().setWidth(600),
                          height: ScreenUtil().setHeight(700),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child:
                              /* Image.memory(
                            base64Decode(
                              diList[index].appBackgroundPhoto,
                            ),
                            width: ScreenUtil().setWidth(300),
                            height: ScreenUtil().setHeight(300),
                          ), */
                              Image.network(
                            diList[index]
                                .appBackgroundPhotoPath
                                .replaceAll(exp, '')
                                .split('\r\n')[0],
                            width: ScreenUtil().setWidth(300),
                            height: ScreenUtil().setHeight(300),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
