class BookmarkModel {
  String? destinationId;
  String? createdAt;
  String? updatedAt;
  String? bookmarkId;
  String? userId;

  BookmarkModel(
      {this.destinationId,
      this.createdAt,
      this.updatedAt,
      this.bookmarkId,
      this.userId});

  BookmarkModel.fromJson(Map<String, dynamic> json) {
    destinationId = json['destination_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    bookmarkId = json['bookmark_id'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['destination_id'] = destinationId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['bookmark_id'] = bookmarkId;
    data['user_id'] = userId;
    return data;
  }
}
