import 'package:get/get.dart';

class ClubNotificationSettingsController extends GetxController {
  // Legacy toggles (unused in new UI but kept for compatibility)
  bool pushEnabled = true;
  bool emailEnabled = true;
  bool smsEnabled = false;

  void togglePush(bool value) { pushEnabled = value; update(); }
  void toggleEmail(bool value) { emailEnabled = value; update(); }
  void toggleSms(bool value) { smsEnabled = value; update(); }

  // ============ New radio-group based settings ============
  // 3-option groups: 0 = Off, 1 = From profiles I follow, 2 = From everyone
  int likesOnYourPosts = 2;
  int commentsOnYourPosts = 2;
  int likesCommentsOnTagged = 2;

  // 2-option groups: 0 = Off, 1 = On
  int newFollowers = 1;
  int acceptedFollowRequests = 1;
  int messageRequests = 1;
  int clubCommunityMessages = 1;
  int clubClassBookingUpdates = 1;
  int birthdays = 0;

  // Setters
  void setLikesOnYourPosts(int v) { likesOnYourPosts = v; update(); }
  void setCommentsOnYourPosts(int v) { commentsOnYourPosts = v; update(); }
  void setLikesCommentsOnTagged(int v) { likesCommentsOnTagged = v; update(); }

  void setNewFollowers(int v) { newFollowers = v; update(); }
  void setAcceptedFollowRequests(int v) { acceptedFollowRequests = v; update(); }
  void setMessageRequests(int v) { messageRequests = v; update(); }
  void setClubCommunityMessages(int v) { clubCommunityMessages = v; update(); }
  void setClubClassBookingUpdates(int v) { clubClassBookingUpdates = v; update(); }
  void setBirthdays(int v) { birthdays = v; update(); }
}
