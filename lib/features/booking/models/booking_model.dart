class BookingModel {
  String? userId;
  String? bookingDate;
  String? paymentStatus;
  String? createdAt;
  String? updatedAt;
  String? bookerName;
  String? bookerPhoneNumber;
  String? bookingTime;
  String? numberOfPerson;
  String? notes;
  String? totalPayment;
  String? bookingId;
  String? destinationId;

  BookingModel({
    this.userId,
    this.bookingDate,
    this.paymentStatus,
    this.createdAt,
    this.updatedAt,
    this.bookerName,
    this.bookerPhoneNumber,
    this.bookingTime,
    this.numberOfPerson,
    this.notes,
    this.totalPayment,
    this.bookingId,
    this.destinationId,
  });

  BookingModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    bookingDate = json['booking_date'];
    paymentStatus = json['payment_status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    bookerName = json['booker_name'];
    bookerPhoneNumber = json['booker_phone_number'];
    bookingTime = json['booking_time'];
    numberOfPerson = json['number_of_person'];
    notes = json['notes'];
    totalPayment = json['total_payment'];
    bookingId = json['booking_id'];
    destinationId = json['destination_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['booking_date'] = bookingDate;
    data['payment_status'] = paymentStatus;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['booker_name'] = bookerName;
    data['booker_phone_number'] = bookerPhoneNumber;
    data['booking_time'] = bookingTime;
    data['number_of_person'] = numberOfPerson;
    data['notes'] = notes;
    data['total_payment'] = totalPayment;
    data['booking_id'] = bookingId;
    data['destination_id'] = destinationId;
    return data;
  }
}
