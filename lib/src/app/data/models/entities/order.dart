class Order {
  String? place;
  String? orderNumber;
  String? amount;
  bool? isPaid;
  String? status;
  String? statusBackgroundColor;
  String? statusBorderColor;
  String? createdAt;
  String? statusColor;

  Order({
    this.place,
    this.orderNumber,
    this.amount,
    this.isPaid,
    this.status,
    this.statusBackgroundColor,
    this.statusBorderColor,
    this.createdAt,
    this.statusColor,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        place: json["place"],
        orderNumber: json["order_number"],
        amount: json["amount"],
        isPaid: json["is_paid"],
        status: json["status"],
        statusBackgroundColor: json["status_background_color"],
        statusBorderColor: json["status_border_color"],
        createdAt: json["created_at"],
        statusColor: json["statusColor"],
      );

  Map<String, dynamic> toJson() => {
        "place": place,
        "order_number": orderNumber,
        "amount": amount,
        "is_paid": isPaid,
        "status": status,
        "status_background_color": statusBackgroundColor,
        "status_border_color": statusBorderColor,
        "created_at": createdAt,
        "statusColor": statusColor,
      };
}
