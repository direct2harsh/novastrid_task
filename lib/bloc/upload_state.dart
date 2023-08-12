abstract class ContentState {}

class UploadInitState extends ContentState {}

class UploadDownloadButtonState extends ContentState {
  bool switchValue = false;
  UploadDownloadButtonState(this.switchValue);
}
