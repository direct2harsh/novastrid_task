import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

void uploadFiles() async {
  final result = await FilePicker.platform.pickFiles(
    allowMultiple: true,
    type: FileType.any,
  );
  if (result == null) return;
  var files = result.paths.map((path) => File(path!)).toList();
  Directory document = await getApplicationDocumentsDirectory();

// Saving the selected file to application document directory
  for (var file in files) {
    await file.copy(document.path + basename(file.path));
  }
}
