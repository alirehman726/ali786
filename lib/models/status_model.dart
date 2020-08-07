class StatusModel {
  String docid;
  String imageURL;
  String title;
  String message;

  StatusModel({this.docid, this.imageURL, this.title, this.message});

  toMap() {
    Map<String, dynamic> map = Map();

    map['docid'] = docid;
    map['imageURL'] = imageURL;
    map['title'] = title;
    map['message'] = message;
    return map;
  }
}
