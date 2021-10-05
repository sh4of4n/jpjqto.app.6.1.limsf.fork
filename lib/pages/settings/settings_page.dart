import 'package:auto_route/auto_route.dart';
import 'package:jpj_qto/common_library/services/model/provider_model.dart';
import 'package:jpj_qto/common_library/services/repository/auth_repository.dart';
import 'package:jpj_qto/common_library/utils/custom_dialog.dart';
import 'package:jpj_qto/common_library/utils/loading_model.dart';
import 'package:jpj_qto/utils/constants.dart';
import 'package:jpj_qto/utils/language_options.dart';
import 'package:jpj_qto/utils/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:provider/provider.dart';
import 'package:jpj_qto/common_library/utils/app_localizations.dart';
import '../../router.gr.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String appVersion = '';
  int count = 0;
  final authRepo = AuthRepo();
  final customDialog = CustomDialog();
  double _defIconSize = 30;
  final primaryColor = ColorConstant.primaryColor;
  final localStorage = LocalStorage();
  String? _clientAcc = '';
  String? _merchantNo = '';

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    _getPackageInfo();
  }

  _getPackageInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    _clientAcc = await localStorage.getCaUid();
    _merchantNo = await localStorage.getMerchantDbCode();

    setState(() {
      appVersion = packageInfo.version;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
          ),
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          margin: EdgeInsets.all(12.0),
          child: ListView(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.language, size: _defIconSize),
                title: Consumer<LanguageModel>(
                  builder: (context, lang, child) {
                    return Text(
                      '${AppLocalizations.of(context)!.translate('language_lbl')} ${lang.language}',
                    );
                  },
                ),
                onTap: () => showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return LanguageOptions();
                  },
                ),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.lock, size: _defIconSize),
                title: Text(AppLocalizations.of(context)!
                    .translate('change_password_lbl')),
                onTap: () {
                  context.router.push(ChangePassword());
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.exit_to_app, size: _defIconSize),
                title:
                    Text(AppLocalizations.of(context)!.translate('logout_lbl')),
                onTap: _logout,
              ),
              Divider(),
              ListTile(
                onTap: () async {
                  count += 1;

                  if (count == 4) {
                    customDialog.show(
                      context: context,
                      title: Text(AppLocalizations.of(context)!
                          .translate('delete_account')),
                      content: AppLocalizations.of(context)!
                          .translate('confirm_delete_account'),
                      customActions: <Widget>[
                        FlatButton(
                          child: Text(AppLocalizations.of(context)!
                              .translate('yes_lbl')),
                          onPressed: _deleteAccount,
                        ),
                        FlatButton(
                          child: Text(AppLocalizations.of(context)!
                              .translate('no_lbl')),
                          onPressed: () {
                            count = 0;
                            context.router.pop();
                          },
                        ),
                      ],
                      type: DialogType.GENERAL,
                      barrierDismissable: true,
                    );
                  }
                },
                leading: Icon(Icons.apps, size: _defIconSize),
                title: Text(
                    AppLocalizations.of(context)!.translate('version_lbl')),
                subtitle: Text('V.$appVersion'),

                /* onTap: () async {
                    count += 1;

                    if (count == 4) {
                      customDialog.show(
                        barrierDismissable: false,
                        context: context,
                        title: AppLocalizations.of(context)
                            .translate('client_acc_title'),
                        content: AppLocalizations.of(context)
                            .translate('client_acc_desc'),
                        type: DialogType.SUCCESS,
                        onPressed: () async {
                          Navigator.pushNamedAndRemoveUntil(
                              context, CLIENT_ACC, (r) => false,
                              arguments: 'SETTINGS');
                          await authRepo.logout();
                        },
                      );
                    }
                  }, */
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.code, size: _defIconSize),
                title:
                    Text(AppLocalizations.of(context)!.translate('client_acc')),
                subtitle: Text(_clientAcc!),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.shopping_bag_rounded, size: _defIconSize),
                title: Text(
                    AppLocalizations.of(context)!.translate('merchant_no')),
                subtitle: Text(_merchantNo!),
              ),
            ],
          ),
        ),
        LoadingModel(isVisible: _isLoading, color: primaryColor),
      ],
    );
  }

  _logout() {
    customDialog.show(
        context: context,
        title: Text(AppLocalizations.of(context)!.translate('confirm_lbl')),
        content: AppLocalizations.of(context)!.translate('confirm_log_out'),
        customActions: <Widget>[
          FlatButton(
            child: Text(AppLocalizations.of(context)!.translate('yes_lbl')),
            onPressed: () async {
              // if (widget.data != null) widget.data.cancel();

              setState(() {
                _isLoading = true;
              });

              context.router.pop();
              await authRepo.logout(context: context, type: 'CLEAR');
              context.router.pushAndPopUntil(Login(), predicate: (r) => false);

              setState(() {
                _isLoading = false;
              });
            },
          ),
          FlatButton(
            child: Text(AppLocalizations.of(context)!.translate('no_lbl')),
            onPressed: () {
              context.router.pop();
            },
          ),
        ],
        type: DialogType.GENERAL);
  }

  _deleteAccount() async {
    context.router.pop();

    setState(() {
      _isLoading = true;
    });

    var result = await authRepo.deleteAppMemberAccount(context: context);

    if (result.isSuccess) {
      context.router.pushAndPopUntil(Login(), predicate: (r) => false);
    } else {
      customDialog.show(
        context: context,
        type: DialogType.ERROR,
        content: result.message.toString(),
        onPressed: () => context.router.pop(),
      );
    }

    setState(() {
      _isLoading = false;
    });
  }
}
