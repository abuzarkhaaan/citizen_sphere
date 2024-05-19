class BillModelClass {
  String? refNumber;
  String? company;
  String? consumerName;
  String? dueDate;
  String? month;
  String? status;
  String? category;
  String? amount;

  BillModelClass(
      {this.refNumber,
      this.company,
      this.consumerName,
      this.dueDate,
      this.month,
      this.status,
      this.category});

  BillModelClass.fromJson(Map<dynamic, dynamic> json) {
    company = json['company'];
    consumerName = json['consumer_name'];
    dueDate = json['due_date'];
    month = json['month'];
    status = json['status'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['company'] = this.company;
    data['consumer_name'] = this.consumerName;
    data['due_date'] = this.dueDate;
    data['month'] = this.month;
    data['status'] = this.status;
    data['amount'] = this.amount;
    return data;
  }
}
