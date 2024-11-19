class DestinationModel {
  String? name;
  String? description;
  String? location;
  String? mapLocation;
  String? category;
  String? createdAt;
  String? updatedAt;
  String? pricePerPerson;
  String? photo;
  String? destinationId;

  DestinationModel(
      {this.name,
      this.description,
      this.location,
      this.mapLocation,
      this.category,
      this.createdAt,
      this.updatedAt,
      this.pricePerPerson,
      this.photo,
      this.destinationId});

  DestinationModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    location = json['location'];
    mapLocation = json['map_location'];
    category = json['category'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    pricePerPerson = json['pricePerPerson'];
    photo = json['photo'];
    destinationId = json['destination_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    data['location'] = location;
    data['map_location'] = mapLocation;
    data['category'] = category;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['pricePerPerson'] = pricePerPerson;
    data['photo'] = photo;
    data['destination_id'] = destinationId;
    return data;
  }
}
