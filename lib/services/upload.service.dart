import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:upload_form/bloc/upload_bloc.dart';
import 'package:upload_form/bloc/upload_event.dart';

void uploadFiles(BuildContext context) async {
  final result = await FilePicker.platform.pickFiles(
    allowMultiple: false,
    type: FileType.any,
  );
  if (result == null) return;
  var files = result.paths.map((path) => File(path!)).toList();
  Directory document = await getApplicationDocumentsDirectory();

// Saving the selected file to application document directory
// Loop is to handle multiple file. However for this case only one file is allowed.
  for (var file in files) {
    if (context.mounted) {
      BlocProvider.of<ContentFileBloc>(context)
          .add(FileUploadedEvent(basename(file.path)));
    }

    await file.copy(document.path + basename(file.path));
  }
}
