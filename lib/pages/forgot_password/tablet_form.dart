import 'package:auto_route/auto_route.dart';
import 'package:jpj_qto/common_library/utils/app_localizations.dart';
import 'package:jpj_qto/base/page_base_class.dart';
import 'package:jpj_qto/common_library/services/repository/auth_repository.dart';
import 'package:jpj_qto/utils/constants.dart';
import 'package:jpj_qto/utils/custom_snackbar.dart';
import 'package:jpj_qto/utils/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ForgotPasswordTabletForm extends StatefulWidget {
  @override
  _ForgotPasswordTabletFormState createState() =>
      _ForgotPasswordTabletFormState();
}

class _ForgotPasswordTabletFormState extends State<ForgotPasswordTabletForm>
    with PageBaseClass {
  final authRepo = AuthRepo();

  final _formKey = GlobalKey<FormState>();

  final FocusNode _phoneFocus = FocusNode();

  final primaryColor = ColorConstant.primaryColor;

  final localStorage = LocalStorage();

  bool _isLoading = false;

  String? _phone;
  String? _message = '';

  // var _height = ScreenUtil().setHeight(1200);

  // var _height = ScreenUtil.screenHeight / 4.5;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 1500),
      curve: Curves.elasticOut,
      width: double.infinity,
      // height: _height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0.0, 15.0),
            blurRadius: 15.0,
          ),
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0.0, -10.0),
            blurRadius: 10.0,
          ),
        ],
      ),
      child: Padding(
        padding:
            EdgeInsets.only(left: 50.w, right: 50.w, top: 48.h, bottom: 60.h),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 35.h,
              ),
              TextFormField(
                focusNode: _phoneFocus,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 16.0),
                  hintStyle: TextStyle(
                    color: primaryColor,
                  ),
                  labelText:
                      AppLocalizations.of(context)!.translate('phone_lbl'),
                  fillColor: Colors.grey.withOpacity(.25),
                  filled: true,
                  prefixIcon: Icon(Icons.account_circle),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return AppLocalizations.of(context)!
                        .translate('phone_required_msg');
                  }
                  return null;
                },
                onSaved: (value) {
                  if (value != _phone) {
                    _phone = value;
                  }
                },
              ),
              SizedBox(
                height: 40.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Wrap(
                  children: <Widget>[
                    Text(
                      AppLocalizations.of(context)!
                          .translate('forgot_password_msg'),
                      style: TextStyle(
                        fontSize: 30.sp,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      /* _message.isNotEmpty
                          ? Text(
                              _message,
                              style: TextStyle(color: Colors.red),
                            )
                          : SizedBox.shrink(), */
                      _submitButton(),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 40.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      context.router.pop();
                    },
                    child: Text(
                      AppLocalizations.of(context)!.translate('go_back_lbl'),
                      style: TextStyle(
                        fontSize: 35.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _submitButton() {
    return Container(
      child: _isLoading
          ? SpinKitFoldingCube(
              color: primaryColor,
            )
          : ButtonTheme(
              minWidth: 200.w,
              padding: EdgeInsets.symmetric(vertical: 20.h),
              buttonColor: primaryColor,
              shape: StadiumBorder(),
              child: ElevatedButton(
                onPressed: _submit,
                style: ElevatedButton.styleFrom(
                  onPrimary: Colors.white,
                  primary: Colors.grey[300],
                  minimumSize: Size(88, 36),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                  ),
                ),
                child: Text(
                  AppLocalizations.of(context)!.translate('submit_btn'),
                  style: TextStyle(
                    fontSize: 35.sp,
                  ),
                ),
              ),
            ),
    );
  }

  _submit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      FocusScope.of(context).requestFocus(new FocusNode());

      setState(() {
        // _height = ScreenUtil().setHeight(1200);
        _isLoading = true;
      });

      var result = await authRepo.ePanduJpjQtoLoginResetPwd(
        phone: _phone,
        password: '',
      );

      if (result.isSuccess) {
        context.router.pop();
        CustomSnackbar().show(
          context,
          message: result.message.toString(),
          type: MessageType.SUCCESS,
        );
      } else {
        if (result.message!.contains('timeout')) {
          setState(() {
            _message =
                AppLocalizations.of(context)!.translate('timeout_exception');
          });
        } else if (result.message!.contains('socket')) {
          setState(() {
            _message =
                AppLocalizations.of(context)!.translate('socket_exception');
          });
        } else {
          setState(() {
            _message = result.message;
          });
        }

        CustomSnackbar().show(
          context,
          message: _message,
          type: MessageType.ERROR,
        );

        setState(() {
          _isLoading = false;
        });
      }
    } else {
      setState(() {
        // _height = ScreenUtil().setHeight(1300);
      });
    }
  }
}
