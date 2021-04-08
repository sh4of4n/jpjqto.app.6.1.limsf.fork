// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'coming_soon/coming_soon.dart';
import 'common_library/utils/image_viewer.dart';
import 'pages/eLearning/elearning.dart';
import 'pages/eTestingSolution/etesting_solution.dart';
import 'pages/forgot_password/forgot_password.dart';
import 'pages/home/home.dart';
import 'pages/jalan_raya/jalan_raya.dart';
import 'pages/login/login.dart';
import 'pages/profile/profile.dart';
import 'pages/profile/take_profile_picture.dart';
import 'pages/register/register.dart';
import 'pages/rpk/rpk.dart';
import 'pages/settings/settings.dart';

class Routes {
  static const String authentication = '/Authentication';
  static const String clientAccount = '/client-account';
  static const String login = '/Login';
  static const String forgotPassword = '/forgot-password';
  static const String changePassword = '/change-password';
  static const String selectDrivingInstitute = '/select-driving-institute';
  static const String registerMobile = '/register-mobile';
  static const String registerVerification = '/register-verification';
  static const String registerForm = '/register-form';
  static const String home = '/';
  static const String settings = '/Settings';
  static const String profile = '/Profile';
  static const String profileTab = '/profile-tab';
  static const String updateProfile = '/update-profile';
  static const String registerUserToDi = '/register-user-to-di';
  static const String identityBarcode = '/identity-barcode';
  static const String imageViewer = '/image-viewer';
  static const String comingSoon = '/coming-soon';
  static const String startLearning = '/start-learning';
  static const String criteriaList = '/criteria-list';
  static const String rsmRpkTabs = '/rsm-rpk-tabs';
  static const String rpkDrawer = '/rpk-drawer';
  static const String takeProfilePicture = '/take-profile-picture';
  static const String operatorScanQR = '/operator-scan-qR';
  static const String learningEnterStudentIC = '/learning-enter-student-iC';
  static const String rpkCandidateDetails = '/rpk-candidate-details';
  static const String rpkPartIII = '/rpk-part-ii-i';
  static const String jrCandidateDetails = '/jr-candidate-details';
  static const String jrPartIII = '/jr-part-ii-i';
  static const all = <String>{
    authentication,
    clientAccount,
    login,
    forgotPassword,
    changePassword,
    selectDrivingInstitute,
    registerMobile,
    registerVerification,
    registerForm,
    home,
    settings,
    profile,
    profileTab,
    updateProfile,
    registerUserToDi,
    identityBarcode,
    imageViewer,
    comingSoon,
    startLearning,
    criteriaList,
    rsmRpkTabs,
    rpkDrawer,
    takeProfilePicture,
    operatorScanQR,
    learningEnterStudentIC,
    rpkCandidateDetails,
    rpkPartIII,
    jrCandidateDetails,
    jrPartIII,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.authentication, page: Authentication),
    RouteDef(Routes.clientAccount, page: ClientAccount),
    RouteDef(Routes.login, page: Login),
    RouteDef(Routes.forgotPassword, page: ForgotPassword),
    RouteDef(Routes.changePassword, page: ChangePassword),
    RouteDef(Routes.selectDrivingInstitute, page: SelectDrivingInstitute),
    RouteDef(Routes.registerMobile, page: RegisterMobile),
    RouteDef(Routes.registerVerification, page: RegisterVerification),
    RouteDef(Routes.registerForm, page: RegisterForm),
    RouteDef(Routes.home, page: Home),
    RouteDef(Routes.settings, page: Settings),
    RouteDef(Routes.profile, page: Profile),
    RouteDef(Routes.profileTab, page: ProfileTab),
    RouteDef(Routes.updateProfile, page: UpdateProfile),
    RouteDef(Routes.registerUserToDi, page: RegisterUserToDi),
    RouteDef(Routes.identityBarcode, page: IdentityBarcode),
    RouteDef(Routes.imageViewer, page: ImageViewer),
    RouteDef(Routes.comingSoon, page: ComingSoon),
    RouteDef(Routes.startLearning, page: StartLearning),
    RouteDef(Routes.criteriaList, page: CriteriaList),
    RouteDef(Routes.rsmRpkTabs, page: RsmRpkTabs),
    RouteDef(Routes.rpkDrawer, page: RpkDrawer),
    RouteDef(Routes.takeProfilePicture, page: TakeProfilePicture),
    RouteDef(Routes.operatorScanQR, page: OperatorScanQR),
    RouteDef(Routes.learningEnterStudentIC, page: LearningEnterStudentIC),
    RouteDef(Routes.rpkCandidateDetails, page: RpkCandidateDetails),
    RouteDef(Routes.rpkPartIII, page: RpkPartIII),
    RouteDef(Routes.jrCandidateDetails, page: JrCandidateDetails),
    RouteDef(Routes.jrPartIII, page: JrPartIII),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    Authentication: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => Authentication(),
        settings: data,
      );
    },
    ClientAccount: (data) {
      final args = data.getArgs<ClientAccountArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => ClientAccount(args.data),
        settings: data,
      );
    },
    Login: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => Login(),
        settings: data,
      );
    },
    ForgotPassword: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ForgotPassword(),
        settings: data,
      );
    },
    ChangePassword: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ChangePassword(),
        settings: data,
      );
    },
    SelectDrivingInstitute: (data) {
      final args = data.getArgs<SelectDrivingInstituteArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => SelectDrivingInstitute(args.diList),
        settings: data,
      );
    },
    RegisterMobile: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => RegisterMobile(),
        settings: data,
      );
    },
    RegisterVerification: (data) {
      final args = data.getArgs<RegisterVerificationArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => RegisterVerification(args.data),
        settings: data,
      );
    },
    RegisterForm: (data) {
      final args = data.getArgs<RegisterFormArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => RegisterForm(args.data),
        settings: data,
      );
    },
    Home: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => Home(),
        settings: data,
      );
    },
    Settings: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => Settings(),
        settings: data,
      );
    },
    Profile: (data) {
      final args = data.getArgs<ProfileArguments>(
        orElse: () => ProfileArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => Profile(
          userProfile: args.userProfile,
          isLoading: args.isLoading,
        ),
        settings: data,
      );
    },
    ProfileTab: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ProfileTab(),
        settings: data,
      );
    },
    UpdateProfile: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => UpdateProfile(),
        settings: data,
      );
    },
    RegisterUserToDi: (data) {
      final args = data.getArgs<RegisterUserToDiArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => RegisterUserToDi(args.data),
        settings: data,
      );
    },
    IdentityBarcode: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => IdentityBarcode(),
        settings: data,
      );
    },
    ImageViewer: (data) {
      final args = data.getArgs<ImageViewerArguments>(
        orElse: () => ImageViewerArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => ImageViewer(
          title: args.title,
          image: args.image,
        ),
        settings: data,
      );
    },
    ComingSoon: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ComingSoon(),
        settings: data,
      );
    },
    StartLearning: (data) {
      final args = data.getArgs<StartLearningArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => StartLearning(args.studentIC),
        settings: data,
      );
    },
    CriteriaList: (data) {
      final args = data.getArgs<CriteriaListArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => CriteriaList(
          args.studentIc,
          args.startDateTime,
          args.group,
          args.course,
          args.part,
        ),
        settings: data,
      );
    },
    RsmRpkTabs: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => RsmRpkTabs(),
        settings: data,
      );
    },
    RpkDrawer: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => RpkDrawer(),
        settings: data,
      );
    },
    TakeProfilePicture: (data) {
      final args = data.getArgs<TakeProfilePictureArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => TakeProfilePicture(args.camera),
        settings: data,
      );
    },
    OperatorScanQR: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => OperatorScanQR(),
        settings: data,
      );
    },
    LearningEnterStudentIC: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => LearningEnterStudentIC(),
        settings: data,
      );
    },
    RpkCandidateDetails: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => RpkCandidateDetails(),
        settings: data,
      );
    },
    RpkPartIII: (data) {
      final args = data.getArgs<RpkPartIIIArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => RpkPartIII(
          args.qNo,
          args.nric,
          args.name,
          args.testDate,
          args.groupId,
          args.testCode,
        ),
        settings: data,
      );
    },
    JrCandidateDetails: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => JrCandidateDetails(),
        settings: data,
      );
    },
    JrPartIII: (data) {
      final args = data.getArgs<JrPartIIIArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => JrPartIII(
          args.qNo,
          args.nric,
          args.name,
          args.testDate,
          args.groupId,
          args.testCode,
        ),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// ClientAccount arguments holder class
class ClientAccountArguments {
  final dynamic data;
  ClientAccountArguments({@required this.data});
}

/// SelectDrivingInstitute arguments holder class
class SelectDrivingInstituteArguments {
  final dynamic diList;
  SelectDrivingInstituteArguments({@required this.diList});
}

/// RegisterVerification arguments holder class
class RegisterVerificationArguments {
  final dynamic data;
  RegisterVerificationArguments({@required this.data});
}

/// RegisterForm arguments holder class
class RegisterFormArguments {
  final dynamic data;
  RegisterFormArguments({@required this.data});
}

/// Profile arguments holder class
class ProfileArguments {
  final dynamic userProfile;
  final dynamic isLoading;
  ProfileArguments({this.userProfile, this.isLoading});
}

/// RegisterUserToDi arguments holder class
class RegisterUserToDiArguments {
  final dynamic data;
  RegisterUserToDiArguments({@required this.data});
}

/// ImageViewer arguments holder class
class ImageViewerArguments {
  final String title;
  final NetworkImage image;
  ImageViewerArguments({this.title, this.image});
}

/// StartLearning arguments holder class
class StartLearningArguments {
  final dynamic studentIC;
  StartLearningArguments({@required this.studentIC});
}

/// CriteriaList arguments holder class
class CriteriaListArguments {
  final String studentIc;
  final String startDateTime;
  final String group;
  final String course;
  final String part;
  CriteriaListArguments(
      {@required this.studentIc,
      @required this.startDateTime,
      @required this.group,
      @required this.course,
      @required this.part});
}

/// TakeProfilePicture arguments holder class
class TakeProfilePictureArguments {
  final List<CameraDescription> camera;
  TakeProfilePictureArguments({@required this.camera});
}

/// RpkPartIII arguments holder class
class RpkPartIIIArguments {
  final String qNo;
  final String nric;
  final String name;
  final String testDate;
  final String groupId;
  final String testCode;
  RpkPartIIIArguments(
      {@required this.qNo,
      @required this.nric,
      @required this.name,
      @required this.testDate,
      @required this.groupId,
      @required this.testCode});
}

/// JrPartIII arguments holder class
class JrPartIIIArguments {
  final String qNo;
  final String nric;
  final String name;
  final String testDate;
  final String groupId;
  final String testCode;
  JrPartIIIArguments(
      {@required this.qNo,
      @required this.nric,
      @required this.name,
      @required this.testDate,
      @required this.groupId,
      @required this.testCode});
}
