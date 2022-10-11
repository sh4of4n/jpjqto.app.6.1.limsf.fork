import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:device_info/device_info.dart';
// import 'package:flutter/painting.dart';

class ColorConstant {
  static final primaryColor = Color(0xffffcd0e);
  static const green = Colors.green;
  static const red = Colors.red;
  static const amberAccent = Colors.amberAccent;
}

final ColorScheme colorScheme = ColorScheme.light(
  primary: Color(0xFF501049),
  secondary: Color(0xFFE30425),
  surface: Color(0xFFFFFFFF),
  background: Color(0xFFF4E2ED),
  error: Color(0xFFB00020),
  onPrimary: Color(0xFFFFFFFF),
  onSecondary: Color(0xFFFFFFFF),
  onSurface: Color(0xFF000000),
  onError: Color(0xFFFD9726),
  onBackground: Color(0xFF000000),
  brightness: Brightness.light,
);

class FontTheme {
  TextTheme primaryFont = TextTheme(
    headline1: TextStyle(fontSize: 96, color: Color(0xff5c5c5c)),
    headline2: TextStyle(fontSize: 60, color: Color(0xff5c5c5c)),
    headline3: TextStyle(fontSize: 48, color: Color(0xff5c5c5c)),
    headline4: TextStyle(fontSize: 34, color: Color(0xff5c5c5c)),
    headline5: TextStyle(fontSize: 24, color: Color(0xff5c5c5c)),
    headline6: TextStyle(
        fontSize: 20, fontWeight: FontWeight.w600, color: Color(0xff5c5c5c)),
    subtitle1: TextStyle(fontSize: 16, color: Color(0xff5c5c5c)),
    subtitle2: TextStyle(fontSize: 14, color: Color(0xff5c5c5c)),
    bodyText1: TextStyle(fontSize: 16, color: Color(0xff5c5c5c)),
    bodyText2: TextStyle(fontSize: 14, color: Color(0xff5c5c5c)),
    button: TextStyle(fontSize: 14, color: Color(0xff5c5c5c)),
    caption: TextStyle(fontSize: 12, color: Color(0xff5c5c5c)),
    overline: TextStyle(fontSize: 10, color: Color(0xff5c5c5c)),
  );

  /* TextStyle appBarTextStyle = TextStyle(
    fontSize: ScreenUtil().setSp(70),
    fontWeight: FontWeight.w600,
  ); */
}

class ImagesConstant {
  String logo = 'assets/images/ePandu-logo.png';
  String logo2 = 'assets/images/ePandu-logo-2.png';
  String ePanduIcon = 'assets/images/epandu-icon.png';
  String feedSample = 'assets/images/feed-sample.jpg';
  String friend = 'assets/images/friend.png';
  String car = 'assets/images/car.png';
  String motor = 'assets/images/motor.png';
  String sos = 'assets/images/sos-icon.png';
  String menu = 'assets/images/menu-icon.png';
  String tyreShop = 'assets/images/tyre-shop-image.png';
  String jobIcon = 'assets/images/job.png';
  String enrollIcon = 'assets/images/enroll.png';
  String importantInfoIcon = 'assets/images/important-info.png';
  String kppIcon = 'assets/images/kpp01.png';
  String bookingIcon = 'assets/images/booking.png';
  String faqIcon = 'assets/images/faq.png';
  String classIcon = 'assets/images/classes.png';
  String paymentIcon = 'assets/images/payment.png';
  String attendanceIcon = 'assets/images/attendance.png';
  String chatIcon = 'assets/images/chat.png';
  String driverJob = 'assets/images/driver-job.png';
  String infoIcon = 'assets/images/info.png';
  String webinarIcon = 'assets/images/webinar.png';
  String pickupIcon = 'assets/images/pickup.png';
  String aboutIcon = 'assets/images/about.png';
  String contestIcon = 'assets/images/contest.png';
  String visaImage = 'assets/images/visa.png';
  String banksImage = 'assets/images/banks.png';
  String comingSoon = 'assets/images/coming-soon.png';
  String advertBanner = 'assets/images/advert-banner.png';
  String profileRed = 'assets/images/profile-red-flag.png';

  // emergency
  String ambulanceIcon = 'assets/images/ambulance.png';
  String policeIcon = 'assets/images/police.png';
  String bombaIcon = 'assets/images/bomba.png';
  String towingIcon = 'assets/images/towing.png';
  String workshopIcon = 'assets/images/workshop.png';
  String emergencyImage = 'assets/images/emergency-image.jpg';
  String workshopCar = 'assets/images/workshop-car.png';
  String workshopBike = 'assets/images/workshop-bike.png';
  String phoneButton = 'assets/images/phone-button.png';
  String directoryButton = 'assets/images/directory-button.png';

  // String avatar = 'images/avatar.jpg';
  // String loginBackground = 'assets/images/login_background.jpg';

  // value club
  String vClub = 'assets/images/v-club-icon.png';
  String vClubLogo = 'assets/images/v-club-logo.png';
  // String vClubBanner = 'assets/images/value-club-banner.png';
  String vClubBanner = 'assets/images/value-club-banner.jpeg';
  String airtime = 'assets/images/airtime.png';
  String billPayment = 'assets/images/bill-payment.png';
  String drivingSchools = 'assets/images/driving-schools.png';
  String higherEducation = 'assets/images/higher-education.png';
  String hochiak = 'assets/images/hochiak.png';
  String jobs = 'assets/images/jobs.png';
  String rideSharing = 'assets/images/ride-sharing.png';
  String tourism = 'assets/images/tourism.png';
  String workshops = 'assets/images/workshops.png';
  String promotionsIcon = 'assets/images/promotions.png';
  String selectInstituteBanner = 'assets/images/select-institute-banner.png';
  String locationIcon = 'assets/images/location-icon.png';
  String profileIcon = 'assets/images/profile-icon.png';
  String productsIcon = 'assets/images/products-icon.png';
  String reviewIcon = 'assets/images/review-icon.png';
  String checkList = 'assets/images/checklist.png';
}

/* class Common {
  Future<String> getDeviceIdentifier(BuildContext context) async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else {
      AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.androidId; // unique ID on Android
    }
  }

  static void printWrapped(String text) {
    final pattern = new RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }
} */
