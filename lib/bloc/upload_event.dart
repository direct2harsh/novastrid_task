abstract class ContentEvent {}

class UploadAllowDownloadEvent extends ContentEvent {
  bool switchValue;
  UploadAllowDownloadEvent(this.switchValue);
}

class FileUploadedEvent extends ContentEvent {
  String fileName;
  FileUploadedEvent(this.fileName);
}
