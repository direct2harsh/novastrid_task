import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upload_form/bloc/upload_event.dart';
import 'package:upload_form/bloc/upload_state.dart';

class contentBloc extends Bloc<ContentEvent, bool> {
  contentBloc() : super(false) {
    on<UploadAllowDownloadEvent>((event, emit) {
      // Toggling the switch value
      event.switchValue = !event.switchValue;
      emit(event.switchValue);
    });
    // on((event, emit) => null);
  }
}
