import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upload_form/bloc/upload_event.dart';


class ContentSwitchBloc extends Bloc<ContentEvent, bool> {
  ContentSwitchBloc() : super(false) {
    on<UploadAllowDownloadEvent>((event, emit) {
      // Toggling the switch value
      event.switchValue = !event.switchValue;
      emit(event.switchValue);
    });
  }
}

class ContentFileBloc extends Bloc<ContentEvent, String> {
  ContentFileBloc() : super("") {
    on<FileUploadedEvent>((event, emit) {
      emit(event.fileName);
    });
  }
}
