import 'package:auto_route/auto_route_annotations.dart';
import 'package:jpj_qto/coming_soon/coming_soon.dart';
import 'package:jpj_qto/pages/eLearning/elearning.dart';
import 'package:jpj_qto/pages/forgot_password/forgot_password.dart';
import 'package:jpj_qto/pages/profile/profile.dart';
import 'package:jpj_qto/pages/register/register.dart';
import 'package:jpj_qto/pages/rpk/rpk.dart';
import 'pages/eTestingSolution/etesting_solution.dart';
import 'pages/home/home.dart';
import 'pages/jalan_raya/jalan_raya.dart';
import 'pages/login/login.dart';
import 'pages/profile/take_profile_picture.dart';
import 'pages/settings/settings.dart';
import 'package:jpj_qto/common_library/utils/image_viewer.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(page: Authentication, initial: true),
    MaterialRoute(page: ClientAccount),
    MaterialRoute(page: Login),
    MaterialRoute(page: ForgotPassword),
    MaterialRoute(page: ChangePassword),
    MaterialRoute(page: SelectDrivingInstitute),
    MaterialRoute(page: RegisterMobile),
    MaterialRoute(page: RegisterVerification),
    MaterialRoute(page: RegisterForm),
    MaterialRoute(page: Home),
    MaterialRoute(page: Settings),
    MaterialRoute(page: Profile),
    MaterialRoute(page: ProfileTab),
    MaterialRoute(page: UpdateProfile),
    MaterialRoute(page: RegisterUserToDi),
    MaterialRoute(page: IdentityBarcode),
    MaterialRoute(page: ImageViewer),
    MaterialRoute(page: ComingSoon),
    MaterialRoute(page: StartLearning),
    MaterialRoute(page: CriteriaList),
    MaterialRoute(page: RsmRpkTabs),
    MaterialRoute(page: RpkDrawer),
    MaterialRoute(page: TakeProfilePicture),
    MaterialRoute(page: OperatorScanQR),
    MaterialRoute(page: LearningEnterStudentIC),
    MaterialRoute(page: RpkCandidateDetails),
    MaterialRoute(page: RpkPartIII),
    MaterialRoute(page: JrCandidateDetails),
    MaterialRoute(page: JrPartIII),
  ],
)
class $Router {}
