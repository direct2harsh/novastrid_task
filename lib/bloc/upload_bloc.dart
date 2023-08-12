

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upload_form/bloc/upload_event.dart';
import 'package:upload_form/bloc/upload_state.dart';

class contentBloc extends Bloc<ContentEvent, ContentState> {
  contentBloc() : super(UploadInitState()) {
    on<UploadAllowDownloadEvent>((event, emit) {
      // Toggling the switch value
      event.switchValue = !event.switchValue;
    });
    // on((event, emit) => null);
  }
}
