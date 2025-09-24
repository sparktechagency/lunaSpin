import 'package:get/get.dart';
import 'package:luna_spain/features/setting/presentation/screen/notification_settings_screen.dart';
import '../../features/auth/change_password/presentation/screen/change_password_screen.dart';
import '../../features/auth/forgot password/presentation/screen/create_password.dart';
import '../../features/auth/forgot password/presentation/screen/forgot_password.dart';
import '../../features/auth/forgot password/presentation/screen/verify_screen.dart';
import '../../features/auth/forgot password/presentation/screen/check_inbox_screen.dart';
import '../../features/auth/sign in/presentation/screen/sign_in_screen.dart';
import '../../features/auth/sign up/presentation/screen/sign_up_screen.dart';
import '../../features/auth/sign up/presentation/screen/verify_user.dart';
import '../../features/auth/sign up/presentation/screen/confirm_account_screen.dart';
import '../../features/auth/sign up/presentation/screen/account_confirmed_screen.dart';
import '../../features/message/presentation/screen/chat_screen.dart';
import '../../features/message/presentation/screen/message_screen.dart';
import '../../features/notifications/presentation/screen/notifications_screen.dart';
import '../../features/onboarding_screen/screen/onboarding_screen.dart';
import '../../features/onboarding_screen/screen/sign_in_sign_up_screen.dart';
import '../../features/profile/presentation/screen/edit_profile.dart';
import '../../features/profile/presentation/screen/profile_screen.dart';
import '../../features/profile/presentation/screen/profile_empty_screen.dart';
import '../../features/profile/presentation/screen/following_screen.dart';
import '../../features/profile/presentation/screen/followers_screen.dart';
import '../../features/profile/presentation/screen/drawer_screen.dart';
import '../../features/setting/presentation/screen/privacy_policy_screen.dart';
import '../../features/setting/presentation/screen/setting_screen.dart';
import '../../features/setting/presentation/screen/terms_of_services_screen.dart';
import '../../features/setting/presentation/screen/settings_privacy_screen.dart';
import '../../features/setting/presentation/screen/privacy_settings_screen.dart';
import '../../features/setting/presentation/screen/close_account_screen.dart';
import '../../features/setting/presentation/screen/settings_privacy_screen.dart';
import '../../features/splash/splash_screen.dart';
import '../../features/another_screen/profile_details/presentation/screens/add_profile_details_screen.dart';
import '../../features/another_screen/profile_details/presentation/screens/add_profile_picture_screen.dart';

class AppRoutes {
  static const String test = "/test_screen.dart";
  static const String splash = "/splash_screen.dart";
  static const String onboarding = "/onboarding_screen.dart";
  static const String signUp = "/sign_up_screen.dart";
  static const String verifyUser = "/verify_user.dart";
  static const String signIn        = '/sign-in';
  static const String forgotPassword = "/forgot_password.dart";
  static const String verifyEmail = "/verify_screen.dart";
  static const String createPassword = "/create_password.dart";
  static const String changePassword = "/change_password_screen.dart";
  static const String notifications = "/notifications_screen.dart";
  static const String chat = "/chat_screen.dart";
  static const String message = "/message_screen.dart";
  static const String profile = "/profile_screen.dart";
  static const String editProfile = "/edit_profile.dart";
  static const String profileEmpty = "/profile_empty_screen.dart";
  static const String privacyPolicy = "/privacy_policy_screen.dart";
  static const String termsOfServices = "/terms_of_services_screen.dart";
  static const String setting = "/setting_screen.dart";
  static const String languageScreen = "/language_screen.dart";
  static const String signInSignUp = "/sign_in_sign_up_screen.dart";
  static const String confirmAccount = "/confirm_account_screen.dart";
  static const String checkInbox = "/check_inbox_screen.dart";
  static const String accountConfirmed = "/account_confirmed_screen.dart";
  static const String addProfileDetails = "/add_profile_details_screen.dart";
  static const String addProfilePicture = "/add_profile_picture_screen.dart";
  static const String following = "/following_screen.dart";
  static const String followers = "/followers_screen.dart";
  static const String drawer = "/drawer_screen.dart";
  static const String settingsPrivacy = "/settings_privacy_screen.dart";
  static const String privacySettings = "/privacy_settings_screen.dart";
  static const String notificationSettings = "/notification_settings.dart";
  static const String closeAccount = "/close_account_screen.dart";

  static List<GetPage> routes = [
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(name: onboarding, page: () => const OnboardingScreen()),
    GetPage(name: signUp, page: () => SignUpScreen()),
    GetPage(name: verifyUser, page: () => const VerifyUser()),
    GetPage(name: signIn, page: () => const SignInScreen()),
    GetPage(name: forgotPassword, page: () => ForgotPasswordScreen()),
    GetPage(name: verifyEmail, page: () => const VerifyScreen()),
    GetPage(name: createPassword, page: () => CreatePassword()),
    GetPage(name: changePassword, page: () => ChangePasswordScreen()),
    GetPage(name: notifications, page: () => const NotificationScreen()),
    GetPage(name: chat, page: () => const ChatListScreen()),
    GetPage(name: message, page: () => const MessageScreen()),
    GetPage(name: profile, page: () => const ProfileScreen()),
    GetPage(name: profileEmpty, page: () => const ProfileEmptyScreen()),
    GetPage(name: editProfile, page: () => EditProfile()),
    GetPage(name: privacyPolicy, page: () => const PrivacyPolicyScreen()),
    GetPage(name: termsOfServices, page: () => const TermsOfServicesScreen()),
    GetPage(name: setting, page: () => const SettingScreen()),
    GetPage(name: signInSignUp, page: () => const SignInSignUpScreen()),
    GetPage(name: confirmAccount, page: () => const ConfirmAccountScreen()),
    GetPage(name: checkInbox, page: () => const CheckInboxScreen()),
    GetPage(name: accountConfirmed, page: () => const AccountConfirmedScreen()),
    GetPage(name: addProfileDetails, page: () => const AddProfileDetailsScreen()),
    GetPage(name: addProfilePicture, page: () => const AddProfilePictureScreen()),
    GetPage(name: following, page: () => const FollowingScreen()),
    GetPage(name: followers, page: () => const FollowersScreen()),
    GetPage(name: drawer, page: () => const DrawerScreen()),
    GetPage(name: settingsPrivacy, page: () => const SettingsPrivacyScreen()),
    GetPage(name: privacySettings, page: () => const PrivacySettingsScreen()),
    GetPage(name: notificationSettings, page: () => const NotificationSettingsScreen()),
    GetPage(name: closeAccount, page: () => const CloseAccountScreen()),
  ];
}
