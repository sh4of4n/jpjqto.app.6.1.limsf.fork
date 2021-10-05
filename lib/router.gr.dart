// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:camera/camera.dart' as _i17;
import 'package:flutter/material.dart' as _i2;
import 'package:flutter/material.dart';

import 'coming_soon/coming_soon.dart' as _i10;
import 'common_library/utils/image_viewer.dart' as _i9;
import 'pages/candidate_info/confirm_candidate_info.dart' as _i16;
import 'pages/eLearning/elearning.dart' as _i11;
import 'pages/eTestingSolution/etesting_solution.dart' as _i12;
import 'pages/forgot_password/forgot_password.dart' as _i4;
import 'pages/home/home.dart' as _i7;
import 'pages/jalan_raya/jalan_raya.dart' as _i15;
import 'pages/login/login.dart' as _i3;
import 'pages/profile/profile.dart' as _i8;
import 'pages/profile/take_profile_picture.dart' as _i13;
import 'pages/register/register.dart' as _i6;
import 'pages/rpk/rpk.dart' as _i14;
import 'pages/settings/settings.dart' as _i5;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    Authentication.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i3.Authentication();
        }),
    ClientAccount.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<ClientAccountArgs>();
          return _i3.ClientAccount(args.data);
        }),
    Login.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i3.Login();
        }),
    ForgotPassword.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i4.ForgotPassword();
        }),
    ChangePassword.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i5.ChangePassword();
        }),
    RegisterMobile.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i6.RegisterMobile();
        }),
    RegisterVerification.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<RegisterVerificationArgs>();
          return _i6.RegisterVerification(args.data);
        }),
    RegisterForm.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<RegisterFormArgs>();
          return _i6.RegisterForm(args.data);
        }),
    GetVehicleInfo.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i3.GetVehicleInfo();
        }),
    Home.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i7.Home();
        }),
    Settings.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i5.Settings();
        }),
    Profile.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args =
              data.argsAs<ProfileArgs>(orElse: () => const ProfileArgs());
          return _i8.Profile(
              userProfile: args.userProfile, isLoading: args.isLoading);
        }),
    ProfileTab.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i8.ProfileTab();
        }),
    UpdateProfile.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i8.UpdateProfile();
        }),
    RegisterUserToDi.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<RegisterUserToDiArgs>();
          return _i6.RegisterUserToDi(args.data);
        }),
    IdentityBarcode.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i8.IdentityBarcode();
        }),
    ImageViewer.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<ImageViewerArgs>(
              orElse: () => const ImageViewerArgs());
          return _i9.ImageViewer(title: args.title, image: args.image);
        }),
    ComingSoon.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i10.ComingSoon();
        }),
    StartLearning.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<StartLearningArgs>();
          return _i11.StartLearning(args.studentIC);
        }),
    CriteriaList.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<CriteriaListArgs>();
          return _i11.CriteriaList(args.studentIc, args.startDateTime,
              args.group, args.course, args.part);
        }),
    RsmRpkTabs.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i12.RsmRpkTabs();
        }),
    RpkDrawer.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i12.RpkDrawer();
        }),
    TakeProfilePicture.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<TakeProfilePictureArgs>();
          return _i13.TakeProfilePicture(args.camera);
        }),
    OperatorScanQR.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i12.OperatorScanQR();
        }),
    LearningEnterStudentIC.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i11.LearningEnterStudentIC();
        }),
    RpkCandidateDetails.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i14.RpkCandidateDetails();
        }),
    RpkPartIII.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<RpkPartIIIArgs>();
          return _i14.RpkPartIII(args.qNo, args.nric, args.rpkName,
              args.testDate, args.groupId, args.testCode, args.vehNo);
        }),
    JrCandidateDetails.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i15.JrCandidateDetails();
        }),
    JrPartIII.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<JrPartIIIArgs>();
          return _i15.JrPartIII(args.qNo, args.nric, args.jrName, args.testDate,
              args.groupId, args.testCode, args.vehNo);
        }),
    ConfirmCandidateInfo.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<ConfirmCandidateInfoArgs>(
              orElse: () => const ConfirmCandidateInfoArgs());
          return _i16.ConfirmCandidateInfo(
              part3Type: args.part3Type,
              nric: args.nric,
              candidateName: args.candidateName,
              qNo: args.qNo,
              groupId: args.groupId,
              testDate: args.testDate,
              testCode: args.testCode);
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(Authentication.name, path: '/'),
        _i1.RouteConfig(ClientAccount.name, path: '/client-account'),
        _i1.RouteConfig(Login.name, path: '/Login'),
        _i1.RouteConfig(ForgotPassword.name, path: '/forgot-password'),
        _i1.RouteConfig(ChangePassword.name, path: '/change-password'),
        _i1.RouteConfig(RegisterMobile.name, path: '/register-mobile'),
        _i1.RouteConfig(RegisterVerification.name,
            path: '/register-verification'),
        _i1.RouteConfig(RegisterForm.name, path: '/register-form'),
        _i1.RouteConfig(GetVehicleInfo.name, path: '/get-vehicle-info'),
        _i1.RouteConfig(Home.name, path: '/Home'),
        _i1.RouteConfig(Settings.name, path: '/Settings'),
        _i1.RouteConfig(Profile.name, path: '/Profile'),
        _i1.RouteConfig(ProfileTab.name, path: '/profile-tab'),
        _i1.RouteConfig(UpdateProfile.name, path: '/update-profile'),
        _i1.RouteConfig(RegisterUserToDi.name, path: '/register-user-to-di'),
        _i1.RouteConfig(IdentityBarcode.name, path: '/identity-barcode'),
        _i1.RouteConfig(ImageViewer.name, path: '/image-viewer'),
        _i1.RouteConfig(ComingSoon.name, path: '/coming-soon'),
        _i1.RouteConfig(StartLearning.name, path: '/start-learning'),
        _i1.RouteConfig(CriteriaList.name, path: '/criteria-list'),
        _i1.RouteConfig(RsmRpkTabs.name, path: '/rsm-rpk-tabs'),
        _i1.RouteConfig(RpkDrawer.name, path: '/rpk-drawer'),
        _i1.RouteConfig(TakeProfilePicture.name, path: '/take-profile-picture'),
        _i1.RouteConfig(OperatorScanQR.name, path: '/operator-scan-qR'),
        _i1.RouteConfig(LearningEnterStudentIC.name,
            path: '/learning-enter-student-iC'),
        _i1.RouteConfig(RpkCandidateDetails.name,
            path: '/rpk-candidate-details'),
        _i1.RouteConfig(RpkPartIII.name, path: '/rpk-part-ii-i'),
        _i1.RouteConfig(JrCandidateDetails.name, path: '/jr-candidate-details'),
        _i1.RouteConfig(JrPartIII.name, path: '/jr-part-ii-i'),
        _i1.RouteConfig(ConfirmCandidateInfo.name,
            path: '/confirm-candidate-info')
      ];
}

class Authentication extends _i1.PageRouteInfo {
  const Authentication() : super(name, path: '/');

  static const String name = 'Authentication';
}

class ClientAccount extends _i1.PageRouteInfo<ClientAccountArgs> {
  ClientAccount({required dynamic data})
      : super(name,
            path: '/client-account', args: ClientAccountArgs(data: data));

  static const String name = 'ClientAccount';
}

class ClientAccountArgs {
  const ClientAccountArgs({required this.data});

  final dynamic data;
}

class Login extends _i1.PageRouteInfo {
  const Login() : super(name, path: '/Login');

  static const String name = 'Login';
}

class ForgotPassword extends _i1.PageRouteInfo {
  const ForgotPassword() : super(name, path: '/forgot-password');

  static const String name = 'ForgotPassword';
}

class ChangePassword extends _i1.PageRouteInfo {
  const ChangePassword() : super(name, path: '/change-password');

  static const String name = 'ChangePassword';
}

class RegisterMobile extends _i1.PageRouteInfo {
  const RegisterMobile() : super(name, path: '/register-mobile');

  static const String name = 'RegisterMobile';
}

class RegisterVerification extends _i1.PageRouteInfo<RegisterVerificationArgs> {
  RegisterVerification({required dynamic data})
      : super(name,
            path: '/register-verification',
            args: RegisterVerificationArgs(data: data));

  static const String name = 'RegisterVerification';
}

class RegisterVerificationArgs {
  const RegisterVerificationArgs({required this.data});

  final dynamic data;
}

class RegisterForm extends _i1.PageRouteInfo<RegisterFormArgs> {
  RegisterForm({required dynamic data})
      : super(name, path: '/register-form', args: RegisterFormArgs(data: data));

  static const String name = 'RegisterForm';
}

class RegisterFormArgs {
  const RegisterFormArgs({required this.data});

  final dynamic data;
}

class GetVehicleInfo extends _i1.PageRouteInfo {
  const GetVehicleInfo() : super(name, path: '/get-vehicle-info');

  static const String name = 'GetVehicleInfo';
}

class Home extends _i1.PageRouteInfo {
  const Home() : super(name, path: '/Home');

  static const String name = 'Home';
}

class Settings extends _i1.PageRouteInfo {
  const Settings() : super(name, path: '/Settings');

  static const String name = 'Settings';
}

class Profile extends _i1.PageRouteInfo<ProfileArgs> {
  Profile({dynamic userProfile, dynamic isLoading})
      : super(name,
            path: '/Profile',
            args: ProfileArgs(userProfile: userProfile, isLoading: isLoading));

  static const String name = 'Profile';
}

class ProfileArgs {
  const ProfileArgs({this.userProfile, this.isLoading});

  final dynamic userProfile;

  final dynamic isLoading;
}

class ProfileTab extends _i1.PageRouteInfo {
  const ProfileTab() : super(name, path: '/profile-tab');

  static const String name = 'ProfileTab';
}

class UpdateProfile extends _i1.PageRouteInfo {
  const UpdateProfile() : super(name, path: '/update-profile');

  static const String name = 'UpdateProfile';
}

class RegisterUserToDi extends _i1.PageRouteInfo<RegisterUserToDiArgs> {
  RegisterUserToDi({required dynamic data})
      : super(name,
            path: '/register-user-to-di',
            args: RegisterUserToDiArgs(data: data));

  static const String name = 'RegisterUserToDi';
}

class RegisterUserToDiArgs {
  const RegisterUserToDiArgs({required this.data});

  final dynamic data;
}

class IdentityBarcode extends _i1.PageRouteInfo {
  const IdentityBarcode() : super(name, path: '/identity-barcode');

  static const String name = 'IdentityBarcode';
}

class ImageViewer extends _i1.PageRouteInfo<ImageViewerArgs> {
  ImageViewer({String? title, _i2.NetworkImage? image})
      : super(name,
            path: '/image-viewer',
            args: ImageViewerArgs(title: title, image: image));

  static const String name = 'ImageViewer';
}

class ImageViewerArgs {
  const ImageViewerArgs({this.title, this.image});

  final String? title;

  final _i2.NetworkImage? image;
}

class ComingSoon extends _i1.PageRouteInfo {
  const ComingSoon() : super(name, path: '/coming-soon');

  static const String name = 'ComingSoon';
}

class StartLearning extends _i1.PageRouteInfo<StartLearningArgs> {
  StartLearning({required dynamic studentIC})
      : super(name,
            path: '/start-learning',
            args: StartLearningArgs(studentIC: studentIC));

  static const String name = 'StartLearning';
}

class StartLearningArgs {
  const StartLearningArgs({required this.studentIC});

  final dynamic studentIC;
}

class CriteriaList extends _i1.PageRouteInfo<CriteriaListArgs> {
  CriteriaList(
      {required String studentIc,
      required String startDateTime,
      required String group,
      required String course,
      required String part})
      : super(name,
            path: '/criteria-list',
            args: CriteriaListArgs(
                studentIc: studentIc,
                startDateTime: startDateTime,
                group: group,
                course: course,
                part: part));

  static const String name = 'CriteriaList';
}

class CriteriaListArgs {
  const CriteriaListArgs(
      {required this.studentIc,
      required this.startDateTime,
      required this.group,
      required this.course,
      required this.part});

  final String studentIc;

  final String startDateTime;

  final String group;

  final String course;

  final String part;
}

class RsmRpkTabs extends _i1.PageRouteInfo {
  const RsmRpkTabs() : super(name, path: '/rsm-rpk-tabs');

  static const String name = 'RsmRpkTabs';
}

class RpkDrawer extends _i1.PageRouteInfo {
  const RpkDrawer() : super(name, path: '/rpk-drawer');

  static const String name = 'RpkDrawer';
}

class TakeProfilePicture extends _i1.PageRouteInfo<TakeProfilePictureArgs> {
  TakeProfilePicture({required List<_i17.CameraDescription>? camera})
      : super(name,
            path: '/take-profile-picture',
            args: TakeProfilePictureArgs(camera: camera));

  static const String name = 'TakeProfilePicture';
}

class TakeProfilePictureArgs {
  const TakeProfilePictureArgs({required this.camera});

  final List<_i17.CameraDescription>? camera;
}

class OperatorScanQR extends _i1.PageRouteInfo {
  const OperatorScanQR() : super(name, path: '/operator-scan-qR');

  static const String name = 'OperatorScanQR';
}

class LearningEnterStudentIC extends _i1.PageRouteInfo {
  const LearningEnterStudentIC()
      : super(name, path: '/learning-enter-student-iC');

  static const String name = 'LearningEnterStudentIC';
}

class RpkCandidateDetails extends _i1.PageRouteInfo {
  const RpkCandidateDetails() : super(name, path: '/rpk-candidate-details');

  static const String name = 'RpkCandidateDetails';
}

class RpkPartIII extends _i1.PageRouteInfo<RpkPartIIIArgs> {
  RpkPartIII(
      {required String? qNo,
      required String? nric,
      required String? rpkName,
      required String? testDate,
      required String? groupId,
      required String? testCode,
      required String? vehNo})
      : super(name,
            path: '/rpk-part-ii-i',
            args: RpkPartIIIArgs(
                qNo: qNo,
                nric: nric,
                rpkName: rpkName,
                testDate: testDate,
                groupId: groupId,
                testCode: testCode,
                vehNo: vehNo));

  static const String name = 'RpkPartIII';
}

class RpkPartIIIArgs {
  const RpkPartIIIArgs(
      {required this.qNo,
      required this.nric,
      required this.rpkName,
      required this.testDate,
      required this.groupId,
      required this.testCode,
      required this.vehNo});

  final String? qNo;

  final String? nric;

  final String? rpkName;

  final String? testDate;

  final String? groupId;

  final String? testCode;

  final String? vehNo;
}

class JrCandidateDetails extends _i1.PageRouteInfo {
  const JrCandidateDetails() : super(name, path: '/jr-candidate-details');

  static const String name = 'JrCandidateDetails';
}

class JrPartIII extends _i1.PageRouteInfo<JrPartIIIArgs> {
  JrPartIII(
      {required String? qNo,
      required String? nric,
      required String? jrName,
      required String? testDate,
      required String? groupId,
      required String? testCode,
      required String? vehNo})
      : super(name,
            path: '/jr-part-ii-i',
            args: JrPartIIIArgs(
                qNo: qNo,
                nric: nric,
                jrName: jrName,
                testDate: testDate,
                groupId: groupId,
                testCode: testCode,
                vehNo: vehNo));

  static const String name = 'JrPartIII';
}

class JrPartIIIArgs {
  const JrPartIIIArgs(
      {required this.qNo,
      required this.nric,
      required this.jrName,
      required this.testDate,
      required this.groupId,
      required this.testCode,
      required this.vehNo});

  final String? qNo;

  final String? nric;

  final String? jrName;

  final String? testDate;

  final String? groupId;

  final String? testCode;

  final String? vehNo;
}

class ConfirmCandidateInfo extends _i1.PageRouteInfo<ConfirmCandidateInfoArgs> {
  ConfirmCandidateInfo(
      {String? part3Type,
      String? nric,
      String? candidateName,
      String? qNo,
      String? groupId,
      String? testDate,
      String? testCode})
      : super(name,
            path: '/confirm-candidate-info',
            args: ConfirmCandidateInfoArgs(
                part3Type: part3Type,
                nric: nric,
                candidateName: candidateName,
                qNo: qNo,
                groupId: groupId,
                testDate: testDate,
                testCode: testCode));

  static const String name = 'ConfirmCandidateInfo';
}

class ConfirmCandidateInfoArgs {
  const ConfirmCandidateInfoArgs(
      {this.part3Type,
      this.nric,
      this.candidateName,
      this.qNo,
      this.groupId,
      this.testDate,
      this.testCode});

  final String? part3Type;

  final String? nric;

  final String? candidateName;

  final String? qNo;

  final String? groupId;

  final String? testDate;

  final String? testCode;
}
