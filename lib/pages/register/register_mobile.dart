import 'package:auto_route/auto_route.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:jpj_qto/common_library/utils/app_localizations.dart';
import 'package:jpj_qto/common_library/services/model/auth_model.dart';
import 'package:jpj_qto/common_library/services/repository/auth_repository.dart';
import 'package:jpj_qto/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../router.gr.dart';

class RegisterMobile extends StatefulWidget {
  @override
  _RegisterMobileState createState() => _RegisterMobileState();
}

class _RegisterMobileState extends State<RegisterMobile> {
  final primaryColor = ColorConstant.primaryColor;
  final authRepo = AuthRepo();
  final _formKey = GlobalKey<FormState>();

  String? _countryCode = '+60';
  String _phone = '';
  String? _message = '';
  bool _isLoading = false;
  final image = ImagesConstant();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth < 600) {
        return defaultLayout();
      }
      return tabLayout();
    });
  }

  defaultLayout() {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white,
              primaryColor,
            ],
            stops: [0.45, 0.85],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Image.asset(image.logo2, height: 90.h),
            elevation: 0,
            backgroundColor: Colors.transparent,
            iconTheme: IconThemeData(
              color: Colors.black, //change your color here
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 20.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 130.w),
                  child: Text(
                    AppLocalizations.of(context)!
                        .translate('enter_your_mobile_no'),
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 110.w),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            CountryCodePicker(
                              onChanged: (value) {
                                setState(() {
                                  _countryCode = value.code;
                                });
                              },
                              padding: EdgeInsets.only(top: 62.h),
                              initialSelection: 'MY',
                              favorite: ['+60', 'MY'],
                              showFlagMain: true,
                              alignLeft: false,
                              enabled: false,
                              textStyle: TextStyle(
                                fontSize: 58.sp,
                                color: Color(0xff808080),
                              ),
                            ),
                            Container(
                              width: 800.w,
                              margin: EdgeInsets.only(left: 10.w),
                              child: TextFormField(
                                style: TextStyle(
                                  fontSize: 58.sp,
                                  color: Color(0xff808080),
                                ),
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(0, 0, 0, -60.h),
                                  /* hintStyle: TextStyle(
                                      color: Colors.blue,
                                    ), */
                                  hintText: AppLocalizations.of(context)!
                                      .translate('phone_lbl'),
                                  // fillColor: Colors.grey.withOpacity(.25),
                                  // filled: true,
                                  /*  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.blue, width: 1.3),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.blue, width: 1.3),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.blue[700], width: 1.6),
                                      // borderRadius: BorderRadius.circular(0),
                                      borderRadius: BorderRadius.circular(30),
                                    ), */
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return AppLocalizations.of(context)!
                                        .translate('phone_required_msg');
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  if (value != _phone) {
                                    _phone = value;
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          _message!.isNotEmpty
                              ? Container(
                                  margin: EdgeInsets.symmetric(vertical: 20.h),
                                  alignment: Alignment.center,
                                  width: 1300.w,
                                  child: Text(
                                    _message!,
                                    style: TextStyle(color: Colors.red),
                                  ),
                                )
                              : Container(
                                  margin: EdgeInsets.symmetric(vertical: 20.h),
                                ),
                          Container(
                            child: _isLoading
                                ? SpinKitFoldingCube(
                                    color: Colors.blue,
                                  )
                                : ElevatedButton(
                                    onPressed: _next,
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      backgroundColor: Colors.blue,
                                      minimumSize: Size(88, 36),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(18.0),
                                        ),
                                      ),
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 30),
                                    ),
                                    child: Text(
                                      AppLocalizations.of(context)!
                                          .translate('next_btn'),
                                      style: TextStyle(
                                        fontSize: 56.sp,
                                      ),
                                    ),
                                  ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  tabLayout() {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white,
              primaryColor,
            ],
            stops: [0.45, 0.85],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Image.asset(image.logo2, height: 90.h),
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 20.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 130.w),
                  child: Text(
                    AppLocalizations.of(context)!
                        .translate('enter_your_mobile_no'),
                    style: TextStyle(
                      fontSize: 35.sp,
                    ),
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 130.w),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            CountryCodePicker(
                              onChanged: (value) {
                                setState(() {
                                  _countryCode = value.code;
                                });
                              },
                              padding: EdgeInsets.only(top: 62.h),
                              initialSelection: 'MY',
                              favorite: ['+60', 'MY'],
                              showFlagMain: true,
                              alignLeft: false,
                              enabled: false,
                              textStyle: TextStyle(
                                fontSize: 40.sp,
                                color: Color(0xff808080),
                              ),
                            ),
                            Container(
                              width: 800.w,
                              margin: EdgeInsets.only(left: 10.w),
                              child: TextFormField(
                                style: TextStyle(
                                  fontSize: 40.sp,
                                  color: Color(0xff808080),
                                ),
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(0, 0, 0, -60.h),
                                  /* hintStyle: TextStyle(
                                      color: Colors.blue,
                                    ), */
                                  hintText: AppLocalizations.of(context)!
                                      .translate('phone_lbl'),
                                  // fillColor: Colors.grey.withOpacity(.25),
                                  // filled: true,
                                  /*  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.blue, width: 1.3),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.blue, width: 1.3),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.blue[700], width: 1.6),
                                      // borderRadius: BorderRadius.circular(0),
                                      borderRadius: BorderRadius.circular(30),
                                    ), */
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return AppLocalizations.of(context)!
                                        .translate('phone_required_msg');
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  if (value != _phone) {
                                    _phone = value;
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          _message!.isNotEmpty
                              ? Container(
                                  margin: EdgeInsets.symmetric(vertical: 20.h),
                                  alignment: Alignment.center,
                                  width: 1300.w,
                                  child: Text(
                                    _message!,
                                    style: TextStyle(color: Colors.red),
                                  ),
                                )
                              : Container(
                                  margin: EdgeInsets.symmetric(vertical: 20.h),
                                ),
                          Container(
                            child: _isLoading
                                ? SpinKitFoldingCube(
                                    color: Colors.blue,
                                  )
                                : ButtonTheme(
                                    // padding: EdgeInsets.all(0.0),
                                    shape: StadiumBorder(),
                                    child: ElevatedButton(
                                      onPressed: _next,
                                      style: ElevatedButton.styleFrom(
                                        foregroundColor: Colors.white,
                                        backgroundColor: Colors.blue,
                                        minimumSize: Size(88, 36),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16),
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(2)),
                                        ),
                                      ),
                                      child: Text(
                                        AppLocalizations.of(context)!
                                            .translate('next_btn'),
                                        style: TextStyle(
                                          fontSize: 35.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _next() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      FocusScope.of(context).requestFocus(new FocusNode());

      String mobileNo = '';

      // print(_phone.substring(0, 1));
      if (_phone.substring(0, 1) == '0')
        mobileNo = _phone.substring(1);
      else
        mobileNo = _phone;

      // print(_countryCode + mobileNo);

      setState(() {
        _isLoading = true;
      });

      var result = await authRepo.requestVerificationCode(
        context: context,
        phoneCountryCode: _countryCode,
        phone: mobileNo,
      );

      if (result.isSuccess) {
        context.router.push(
          RegisterVerification(
            data: SignUpArguments(
              phoneCountryCode: _countryCode,
              phone: mobileNo,
              verificationCode: result.data.toString(),
            ),
          ),
        );
      } else {
        setState(() {
          _message = result.message;
        });
      }

      setState(() {
        _isLoading = false;
      });
    }
  }
}
