import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddProfilePictureController extends GetxController {
  final ImagePicker _picker = ImagePicker();

  XFile? profileImage;
  XFile? headerImage;

  Future<void> pickProfileImage() async {
    final XFile? img = await _picker.pickImage(source: ImageSource.gallery);
    if (img != null) {
      profileImage = img;
      update();
    }
  }

  Future<void> pickHeaderImage() async {
    final XFile? img = await _picker.pickImage(source: ImageSource.gallery);
    if (img != null) {
      headerImage = img;
      update();
    }
  }

  void removeProfileImage() {
    profileImage = null;
    update();
  }

  void removeHeaderImage() {
    headerImage = null;
    update();
  }

  String? profileFileName() => _fileName(profileImage);
  String? headerFileName() => _fileName(headerImage);

  String? _fileName(XFile? file) {
    if (file == null) return null;
    final path = file.path;
    return path.split('/').last;
  }
}
