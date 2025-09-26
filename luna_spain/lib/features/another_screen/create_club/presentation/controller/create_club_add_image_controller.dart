import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CreateClubAddImageController extends GetxController {
  final ImagePicker _picker = ImagePicker();

  XFile? clubLogo;
  XFile? clubHeader;

  Future<void> pickClubLogo() async {
    final XFile? img = await _picker.pickImage(source: ImageSource.gallery);
    if (img != null) {
      clubLogo = img;
      update();
    }
  }

  Future<void> pickClubHeader() async {
    final XFile? img = await _picker.pickImage(source: ImageSource.gallery);
    if (img != null) {
      clubHeader = img;
      update();
    }
  }

  void removeClubLogo() {
    clubLogo = null;
    update();
  }

  void removeClubHeader() {
    clubHeader = null;
    update();
  }

  String? logoFileName() => _fileName(clubLogo);
  String? headerFileName() => _fileName(clubHeader);

  String? _fileName(XFile? file) {
    if (file == null) return null;
    final path = file.path;
    return path.split('/').last;
  }
}
