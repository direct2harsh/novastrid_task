abstract class ContentEvent {}

class UploadAllowDownloadEvent extends ContentEvent {
  bool switchValue;
  UploadAllowDownloadEvent(this.switchValue);
}
