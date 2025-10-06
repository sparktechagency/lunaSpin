import 'package:get/get.dart';
import 'package:luna_spain/features/another_screen/all_classes/presentation/screens/booked_class_details_screen.dart';
import 'package:luna_spain/features/another_screen/all_classes/presentation/screens/booked_class_screen.dart';
import 'package:luna_spain/features/another_screen/all_classes/presentation/screens/cancel_booking_screen.dart';
import 'package:luna_spain/features/another_screen/booking_settings_screen/presentation/screens/payment_settings_screen.dart';
import 'package:luna_spain/features/another_screen/booking_settings_screen/presentation/screens/waiting_list_setting_screen.dart';
import 'package:luna_spain/features/another_screen/club_management/presentation/screens/close_club_screen.dart';
import 'package:luna_spain/features/another_screen/club_management/presentation/screens/club_notification_setting_screen.dart';
import 'package:luna_spain/features/another_screen/club_management/presentation/screens/club_privacy_screen.dart';
import 'package:luna_spain/features/another_screen/club_management/presentation/screens/create_text_post_screen.dart';
import 'package:luna_spain/features/another_screen/club_management/presentation/screens/edit_club_screen.dart';
import 'package:luna_spain/features/another_screen/club_management/presentation/screens/post_draft_screen.dart';
import 'package:luna_spain/features/another_screen/club_management/presentation/screens/premium_features_screen.dart';
import 'package:luna_spain/features/another_screen/create_club/presentation/screens/club_profile_screen.dart';
import 'package:luna_spain/features/another_screen/club_management/presentation/screens/club_management_screen.dart';
import 'package:luna_spain/features/another_screen/club_management/presentation/screens/naw_club_post_screen.dart';
import 'package:luna_spain/features/another_screen/club_management/presentation/screens/create_image_post_screen.dart';
import 'package:luna_spain/features/another_screen/manage_class/presentation/screens/create_new_class_confirm_class_screen.dart';
import 'package:luna_spain/features/another_screen/manage_class/presentation/screens/create_new_class_created_screen.dart';
import 'package:luna_spain/features/another_screen/manage_class/presentation/screens/create_new_class_date_time_screen.dart';
import 'package:luna_spain/features/another_screen/manage_class/presentation/screens/create_new_class_overview_screen.dart';
import 'package:luna_spain/features/another_screen/manage_class/presentation/screens/create_new_class_screen.dart';
import 'package:luna_spain/features/another_screen/manage_class/presentation/screens/create_new_class_ticket_and_cost_screen.dart';
import 'package:luna_spain/features/another_screen/manage_class/presentation/screens/manage_classes_screen.dart';
import 'package:luna_spain/features/another_screen/user_home/presentation/screens/image_post_comment_screen.dart';
import 'package:luna_spain/features/message/presentation/screen/luna_chat_screen.dart';
import '../../features/setting/presentation/screen/notification_settings_screen.dart';
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
import '../../features/splash/splash_screen.dart';
import '../../features/another_screen/profile_details/presentation/screens/add_profile_details_screen.dart';
import '../../features/another_screen/profile_details/presentation/screens/add_profile_picture_screen.dart';
import '../../features/another_screen/all_drawer_screens/presentation/screens/likes_screen.dart';
import '../../features/another_screen/all_drawer_screens/presentation/screens/user_profile_screen.dart';
import '../../features/another_screen/user_home/presentation/screens/home_screen.dart';
import '../../features/another_screen/create_club/presentation/screens/create_new_club_screen.dart';
import '../../features/another_screen/create_club/presentation/screens/create_club_details_screen.dart';
import '../../features/another_screen/create_club/presentation/screens/create_club_add_image_screen.dart';
import '../../features/search/presentation/screens/search_screen.dart';
import '../../features/search/presentation/screens/search_result_screen.dart';
import '../../features/another_screen/all_drawer_screens/presentation/screens/leave_club_screen.dart';
import '../../features/another_screen/all_drawer_screens/presentation/screens/search_club_profile_screen.dart';
import 'package:luna_spain/features/another_screen/all_classes/presentation/screens/available_classes_screen.dart';
import 'package:luna_spain/features/another_screen/all_classes/presentation/screens/class_details_screen.dart';
import 'package:luna_spain/features/another_screen/all_classes/presentation/screens/checkout_screen.dart';
import 'package:luna_spain/features/another_screen/all_classes/presentation/screens/confirm_and_pay_screen.dart';
import 'package:luna_spain/features/another_screen/all_classes/presentation/screens/booking_complete_screen.dart';

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
  static const String search = "/search_screen.dart";
  static const String searchResults = "/search_result_screen.dart";
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
  static const String likes = "/likes_screen.dart";
  static const String userProfile = "/user_profile_screen.dart";
  static const String userHome = "/user_home_screen.dart";
  static const String createNewClub = "/create_new_club_screen.dart";
  static const String createClubDetails = "/create_club_details_screen.dart";
  static const String createClubAddImage = "/create_club_add_image_screen.dart";
  static const String clubProfile = "/club_profile_screen.dart";
  static const String clubManagement = "/club_management_screen.dart";
  static const String nawClubPost = "/naw_club_post_screen.dart";
  static const String createTextPost = "/create_text_post_screen.dart";
  static const String postDraft = "/post_draft_screen";
  static const String createImagePost = "/create_image_post_screen.dart";
  static const String imagePostComments = "/image_post_comment_screen.dart";
  static const String leaveClub = "/leave_club_screen.dart";
  static const String searchClubProfile = "/search_club_profile_screen.dart";
  static const String availableClasses = "/available_classes_screen.dart";
  static const String classDetails = "/class_details_screen.dart";
  static const String checkout = "/checkout_screen.dart";
  static const String confirmAndPay = "/confirm_and_pay_screen.dart";
  static const String bookingComplete = "/booking_complete_screen.dart";
  static const String bookedClasses = "/booked_classes_screen.dart";
  static const String bookedClassDetails = "/booked_class_details_screen.dart";
  static const String cancelBooking = "/cancel_booking_screen.dart";
  static const String editClub = "/edit_club_screen.dart";
  static const String clubNotificationSettings = "/club_notification_settings_screen.dart";
  static const String premiumFeatures = "/premium_features_screen.dart";
  static const String clubPrivacy = "/club_privacy_screen.dart";
  static const String closeClub = "/close_club_screen.dart";
  static const String manageClasses = "/manage_classes_screen.dart";
  static const String createNewClass = "/create_new_class_screen.dart";
  static const String createNewClassTicketAndCost = "/create_new_class_ticket_and_cost_screen.dart";
  static const String createNewClassDateTime = "/create_new_class_date_time_screen.dart";
  static const String createNewClassConfirmClass = "/create_new_class_confirm_class_screen.dart";
  static const String createNewClassCreated = "/create_new_class_created_screen.dart";
  static const String createNewClassOverview = "/create_new_class_overview_screen.dart";
  static const String paymentSettings = "/payment_settings_screen.dart";
  static const String waitingListSettings = "/waiting_list_settings_screen.dart";
  static const String lunaChat = "/luna_chat_screen.dart";

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
    GetPage(name: search, page: () => const SearchScreen()),
    GetPage(name: searchResults, page: () => const SearchResultScreen()),
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
    GetPage(name: likes, page: () => const LikesScreen()),
    GetPage(name: userProfile, page: () =>  UserProfileScreen()),
    GetPage(name: userHome, page: () => const HomeScreen()),
    GetPage(name: createNewClub, page: () => const CreateNewClubScreen()),
    GetPage(name: createClubDetails, page: () => const CreateClubDetailsScreen()),
    GetPage(name: createClubAddImage, page: () => const CreateClubAddImageScreen()),
    GetPage(name: clubProfile, page: () => const ClubProfileScreen()),
    GetPage(name: clubManagement, page: () => const ClubManagementScreen()),
    GetPage(name: nawClubPost, page: () => const NawClubPostScreen()),
    GetPage(name: createTextPost, page: () => const CreateTextPostScreen()),
    GetPage(name: createImagePost, page: () => const CreateImagePostScreen()),
    GetPage(name: imagePostComments, page: () => const ImagePostCommentScreen()),
    GetPage(name: postDraft, page: ()=>PostDraftScreen()),
    GetPage(name: leaveClub, page: () => const LeaveClubScreen()),
    GetPage(name: searchClubProfile, page: () => const SearchClubProfileScreen()),
    GetPage(name: availableClasses, page: () => const AvailableClassesScreen()),
    GetPage(name: classDetails, page: () => const ClassDetailsScreen()),
    GetPage(name: checkout, page: () => const CheckoutScreen()),
    GetPage(name: confirmAndPay, page: () => const ConfirmAndPayScreen()),
    GetPage(name: bookingComplete, page: () => const BookingCompleteScreen()),
    GetPage(name: bookedClasses, page: () => const BookedClassesScreen()),
    GetPage(name: bookedClassDetails, page: () => const BookedClassDetailsScreen()),
    GetPage(name: cancelBooking, page: () => const CancelBookingScreen()),
    GetPage(name: editClub, page: () => const EditClubScreen()),
    GetPage(name: clubNotificationSettings, page: () => const ClubNotificationSettingScreen()),
    GetPage(name: premiumFeatures, page: () => const PremiumFeaturesScreen()),
    GetPage(name: clubPrivacy, page: () => const ClubPrivacyScreen()),
    GetPage(name: closeClub, page: () => const CloseClubScreen()),
    GetPage(name: manageClasses, page: () => ManageClassesScreen()),
    GetPage(name: createNewClass, page: () => const CreateNewClassScreen()),
    GetPage(name: createNewClassTicketAndCost, page: () => const CreateNewClassTicketAndCostScreen()),
    GetPage(name: createNewClassDateTime, page: () =>  CreateNewClassDateAndTimeScreen()),
    GetPage(name: createNewClassConfirmClass, page: () =>  CreateNewClassConfirmClassScreen()),
    GetPage(name: createNewClassCreated, page: () =>  CreateNewClassClassCreatedScreen()),
    GetPage(name: createNewClassOverview, page: () =>  CreateNewClassOverviewScreen()),
    GetPage(name: paymentSettings, page: () => const PaymentSettingScreen()),
    GetPage(name: waitingListSettings, page: () => const WaitingListSettingScreen()),
    GetPage(name: lunaChat, page: () => const LunaChatScreen()),
 
 
 
 
  ];
}
