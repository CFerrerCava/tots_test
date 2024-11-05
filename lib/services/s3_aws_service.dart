import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tots_test/firebase_options.dart';
import 'dart:io' as io;

class FirebaseService {
  Future<void> initializeDefault() async {
    FirebaseApp app = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.android,
    );
    print('Initialized default app $app');
  }

  Future<String?> uploadFile(XFile? file) async {
    if (file == null) {
      DialogService().showDialog(description: 'no hay archivo');
      return null;
    }

    // Create a Reference to the file
    Reference ref = FirebaseStorage.instance
        .ref()
        .child('flutter-tests')
        .child(DateTime.now().millisecondsSinceEpoch.toString());

    final metadata = SettableMetadata(
      contentType: 'image/jpeg',
      customMetadata: {'picked-file-path': file.path},
    );

    await ref.putFile(io.File(file.path), metadata);
    String url = await ref.getDownloadURL();
    return url;
  }
}
