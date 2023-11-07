import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:jpj_qto/common_library/services/model/etesting_model.dart';
import 'package:jpj_qto/common_library/services/repository/etesting_repository.dart';
import 'package:jpj_qto/common_library/services/response.dart';
import 'package:jpj_qto/component/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jpj_qto/common_library/utils/app_localizations.dart';
import 'package:jpj_qto/common_library/utils/custom_button.dart';
import 'package:jpj_qto/common_library/utils/custom_dialog.dart';
import 'package:jpj_qto/common_library/utils/uppercase_formatter.dart';
import 'package:jpj_qto/utils/local_storage.dart';
import '../../router.gr.dart';

@RoutePage(name: 'GetVehicleInfo')
class GetVehicleInfo extends StatefulWidget {
  final String type;
  const GetVehicleInfo({super.key, required this.type});

  @override
  _GetVehicleInfoState createState() => _GetVehicleInfoState();
}

class _GetVehicleInfoState extends State<GetVehicleInfo> {
  final _formKey = GlobalKey<FormBuilderState>();
  final localStorage = LocalStorage();
  final customDialog = CustomDialog();
  final groupIdFocus = FocusNode();
  final plateNoFocus = FocusNode();
  final carNoFocus = FocusNode();
  final merchantNoFocus = FocusNode();
  final etestingRepo = EtestingRepo();

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  bool showCameraIcon = true;
  List<MysikapVehicle> vehicleArr = [];
  @override
  void initState() {
    super.initState();
    localStorage.getPermitCode().then((value) {
      _formKey.currentState!.fields['permitNo']!.didChange(value);
    });
    // getMySikapVehicleListByStatusPart();
    //getSavedInfo();
  }

  @override
  void reassemble() {
    super.reassemble();
  }

  Future getMySikapVehicleListByStatusPart() async {
    EasyLoading.show(
      maskType: EasyLoadingMaskType.black,
    );
    var result = await etestingRepo.getMySikapVehicleListByStatusPart(
        status: 'CHECKED', part: widget.type == 'RPK' ? 'RPK' : '3');
    if (result.isSuccess) {
      if (mounted) {
        setState(() {
          vehicleArr = result.data;
        });
      }
    }
    EasyLoading.dismiss();
    return result;
  }

  @override
  void dispose() {
    groupIdFocus.dispose();
    plateNoFocus.dispose();
    carNoFocus.dispose();
    super.dispose();
  }

  _submit() async {
    // var key = "34462c45e6e50e1122e2c393";
    // var blockCipher = new BlockCipher(new DESEngine(), key);
    // var message = "3DpxxiwXxf8rHeVMSHh93k8eOtylWeb0xKM8OHhlB9ofv7PlBrdKhdu0x5N3EyO+GxgdZamrOZH0lvCYacAha8ee7iMFyzmnGi3njOFMwNhH1Rpc4x7jyC07MCsqLx2y";
    // var ciphertext = blockCipher.encodeB64(message);
    // var decoded = blockCipher.decodeB64(ciphertext);

    // print("key: $key");
    // print("message: $message");
    // print("ciphertext (base64): $ciphertext");
    // print("decoded ciphertext: $decoded");

    // String _decryptBase64 = await Flutter3des.decryptFromBase64(
    //   '3DpxxiwXxf8rHeVMSHh93k8eOtylWeb0xKM8OHhlB9ofv7PlBrdKhdu0x5N3EyO+GxgdZamrOZH0lvCYacAha8ee7iMFyzmnGi3njOFMwNhH1Rpc4x7jyC07MCsqLx2y',
    //   '34462c45e6e50e1122e2c393',
    //   iv: '737566f4',
    // );
    // print(_decryptBase64);

    // String key = '12345678'; // 8-byte
    // String message =
    //     '{"Table1":[{"group_id":"D","test_code":"22dfb8263b6174bf6aa2","nric_no":"C7263118IDN"}]}';
    // List<int> encrypted;
    // List<int> decrypted;
    // List<int> iv = hex.decode('737566f4');

    // key = '34462c45e6e50e1122e2c393'; // 24-byte
    // DES3 des3CBC = DES3(
    //   key: hex.decode('34462c45e6e50e1122e2c393'),
    //   mode: DESMode.CBC,
    //   iv: iv,
    //   paddingType: DESPaddingType.PKCS7,
    // );
    // print(message.codeUnits);
    // encrypted = des3CBC.encrypt(message.codeUnits);
    // decrypted = des3CBC.decrypt(encrypted);
    // print('Triple DES mode: CBC');
    // print('encrypted: $encrypted');
    // print('encrypted (hex): ${hex.encode(encrypted)}');
    // print('encrypted (base64): ${base64.encode(encrypted)}');
    // print('decrypted: $decrypted');
    // print('decrypted (hex): ${hex.encode(decrypted)}');
    // print('decrypted (utf8): ${utf8.decode(decrypted)}');

    if (_formKey.currentState?.saveAndValidate() ?? false) {
      FocusScope.of(context).requestFocus(FocusNode());
      localStorage
          .saveEnrolledGroupId(_formKey.currentState?.fields['groupId']?.value);
      localStorage.saveCarNo(
          _formKey.currentState?.fields['carNo']?.value.replaceAll(' ', ''));
      localStorage.savePlateNo(
          _formKey.currentState?.fields['plateNo']?.value.replaceAll(' ', ''));
      localStorage.saveMerchantDbCode(
          _formKey.currentState?.fields['permitNo']?.value.replaceAll(' ', ''));
      localStorage.saveType(widget.type);
      if (widget.type == "RPK") {
        context.router.pushAndPopUntil(const HomePageRpk(), predicate: (r) => false);
      } else if (widget.type == "Jalan Raya") {
        context.router.pushAndPopUntil(const Home(), predicate: (r) => false);
      }
    }
  }

  bool isJson(String str) {
    try {
      json.decode(str);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        EasyLoading.dismiss();
        return true;
      },
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Maklumat Kenderaan'),
          ),
          floatingActionButton: FloatingActionButton.extended(
            label: const Text('Scan QR Code'),
            onPressed: () async {
              var scanData = await context.router.push(QrScannerRoute());
              if (scanData != null) {
                try {
                  EasyLoading.show(
                    maskType: EasyLoadingMaskType.black,
                  );

                  String plateNo = '';
                  String groupId = '';
                  String merchantNo = '';
                  String carNo = '';
                  if (isJson(scanData.toString())) {
                    plateNo = jsonDecode(scanData.toString())['Table1'][0]
                        ['plate_no'];
                    groupId = jsonDecode(scanData.toString())['Table1'][0]
                        ['group_id'];
                    merchantNo = jsonDecode(scanData.toString())['Table1'][0]
                        ['merchant_no'];
                    carNo =
                        jsonDecode(scanData.toString())['Table1'][0]['car_no'];
                  } else {
                    Response decryptQrcode = await etestingRepo.decryptQrcode(
                      qrcodeJson: scanData.toString(),
                    );

                    if (!decryptQrcode.isSuccess) {
                      EasyLoading.dismiss();
                      if (!mounted) return;
                      await showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('JPJ QTO APP'),
                            content: SingleChildScrollView(
                              child: ListBody(
                                children: <Widget>[
                                  Text(decryptQrcode.message ?? ''),
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('OK'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );

                      return;
                    }

                    plateNo = decryptQrcode.data[0].plateNo;
                    groupId = decryptQrcode.data[0].groupId;
                    merchantNo = decryptQrcode.data[0].merchantNo;
                    carNo = decryptQrcode.data[0].carNo;
                  }

                  var vehicleResult =
                      await etestingRepo.isVehicleAvailableByUserId(
                    plateNo: plateNo,
                  );
                  EasyLoading.dismiss();
                  if (vehicleResult.data != 'True') {
                    await showDialog(
                      context: context,
                      barrierDismissible: false, // user must tap button!
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('JPJ QTO APP'),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: <Widget>[
                                Text(vehicleResult.message ?? ''),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: const Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );

                    return;
                  }

                  setState(() {
                    _formKey.currentState!.patchValue({
                      'groupId': groupId,
                      'permitNo': merchantNo,
                      'carNo': carNo,
                      'plateNo': plateNo,
                    });
                    showCameraIcon = true;
                  });
                } catch (e) {
                  EasyLoading.dismiss();
                  if (mounted) {
                    customDialog.show(
                      barrierDismissable: false,
                      context: context,
                      content:
                          AppLocalizations.of(context)!.translate('invalid_qr'),
                      customActions: [
                        TextButton(
                          onPressed: () {
                            context.router.pop();
                          },
                          child: const Text('Ok'),
                        ),
                      ],
                      type: DialogType.GENERAL,
                    );
                  }
                }
              }
            },
            icon: const Icon(Icons.qr_code_scanner),
          ),
          body: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: FormBuilder(
                key: _formKey,
                child: Column(
                  children: [
                    const ProfileWidget(),
                    // Container(
                    //   width: 1300.w,
                    //   margin: EdgeInsets.symmetric(vertical: 30.h),
                    //   child: FormBuilderField(
                    //     name: 'plateNo',
                    //     builder: (field) {
                    //       return DropdownSearch<MysikapVehicle>(
                    //         items: vehicleArr,
                    //         selectedItem: field.value != null
                    //             ? MysikapVehicle(
                    //                 plateNo: field.value.toString(),
                    //               )
                    //             : MysikapVehicle(
                    //                 plateNo: '',
                    //               ),
                    //         dropdownDecoratorProps: DropDownDecoratorProps(
                    //           dropdownSearchDecoration: InputDecoration(
                    //             labelText: AppLocalizations.of(context)!
                    //                 .translate('plate_no'),
                    //           ),
                    //         ),
                    //         validator: (MysikapVehicle? i) {
                    //           if (i == null) return field.errorText;
                    //           return null;
                    //         },
                    //         itemAsString: (MysikapVehicle u) => u.plateNo!,
                    //         compareFn: (i, s) => i.plateNo == s.plateNo,
                    //         onChanged: ((value) {
                    //           field.didChange(value!.plateNo);
                    //           _formKey.currentState!.fields['groupId']!
                    //               .didChange(value.groupId);
                    //           _formKey.currentState!.fields['carNo']!
                    //               .didChange(value.carNo);
                    //         }),
                    //         popupProps:
                    //             PopupPropsMultiSelection.modalBottomSheet(
                    //           isFilterOnline: true,
                    //           showSelectedItems: true,
                    //           showSearchBox: true,
                    //           itemBuilder: (context, item, isSelected) {
                    //             return Container(
                    //               margin: EdgeInsets.symmetric(horizontal: 8),
                    //               decoration: !isSelected
                    //                   ? null
                    //                   : BoxDecoration(
                    //                       border: Border.all(
                    //                           color: Theme.of(context)
                    //                               .primaryColor),
                    //                       borderRadius:
                    //                           BorderRadius.circular(5),
                    //                       color: Colors.white,
                    //                     ),
                    //               child: ListTile(
                    //                 selected: isSelected,
                    //                 title: Text(item.plateNo ?? ''),
                    //               ),
                    //             );
                    //           },
                    //         ),
                    //       );
                    //     },
                    //     validator: FormBuilderValidators.compose([
                    //       FormBuilderValidators.required(),
                    //     ]),
                    //   ),
                    // ),
                    Container(
                      width: 1300.w,
                      margin: EdgeInsets.symmetric(vertical: 30.h),
                      child: FormBuilderTextField(
                        name: 'plateNo',
                        readOnly: true,
                        inputFormatters: [UpperCaseTextFormatter()],
                        decoration: InputDecoration(
                          labelText: AppLocalizations.of(context)!
                              .translate('plate_no'),
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ]),
                      ),
                    ),
                    Container(
                      width: 1300.w,
                      margin: EdgeInsets.symmetric(vertical: 30.h),
                      child: FormBuilderTextField(
                        name: 'groupId',
                        readOnly: true,
                        inputFormatters: [UpperCaseTextFormatter()],
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ]),
                        decoration: InputDecoration(
                          labelText: AppLocalizations.of(context)!
                              .translate('group_id'),

                          // suffixIcon: IconButton(
                          //   icon: Icon(Icons.close),
                          //   onPressed: () {
                          //     _formKey.currentState!.fields['permitNo']
                          //         ?.reset();
                          //   },
                          // ),
                        ),
                        // validator: (value) {
                        //   if (value!.isEmpty) {
                        //     return 'Permit No is required.';
                        //   }
                        //   return null;
                        // },
                      ),
                    ),
                    Container(
                      width: 1300.w,
                      margin: EdgeInsets.symmetric(vertical: 30.h),
                      child: FormBuilderTextField(
                        name: 'carNo',
                        readOnly: true,
                        inputFormatters: [UpperCaseTextFormatter()],
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ]),
                        decoration: InputDecoration(
                          labelText:
                              AppLocalizations.of(context)!.translate('car_no'),
                          // suffixIcon: IconButton(
                          //   icon: Icon(Icons.close),
                          //   onPressed: () {
                          //     _formKey.currentState!.fields['carNo']?.reset();
                          //   },
                          // ),
                        ),
                        // validator: FormBuilderValidators.compose([
                        //   FormBuilderValidators.required(),
                        // ]),
                      ),
                    ),

                    Container(
                      width: 1300.w,
                      margin: EdgeInsets.symmetric(vertical: 30.h),
                      child: FormBuilderTextField(
                        name: 'permitNo',
                        readOnly: true,
                        inputFormatters: [UpperCaseTextFormatter()],
                        decoration: const InputDecoration(
                          labelText: 'Permit No',
                          // suffixIcon: IconButton(
                          //   icon: Icon(Icons.close),
                          //   onPressed: () {
                          //     _formKey.currentState!.fields['permitNo']
                          //         ?.reset();
                          //   },
                          // ),
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                              errorText: 'Permit No is required'),
                        ]),
                      ),
                    ),
                    // Visibility(
                    //   visible: showCameraIcon,
                    //   child: Container(
                    //     margin: EdgeInsets.symmetric(vertical: 100.h),
                    //     child: IconButton(
                    //       onPressed: () {
                    //         setState(() {
                    //           showQR = true;
                    //           showCameraIcon = false;
                    //         });
                    //       },
                    //       iconSize: 250,
                    //       icon: Icon(Icons.camera_alt),
                    //     ),
                    //   ),
                    // ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 30.h),
                      child: CustomButton(
                        onPressed: _submit,
                        buttonColor: Colors.blue,
                        title: 'Save',
                      ),
                    ),
                    // ElevatedButton(onPressed: () {}, child: Text('Submit')),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
