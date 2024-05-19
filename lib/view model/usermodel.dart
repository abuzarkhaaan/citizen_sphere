class UserModel {
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? mobileNumber;
  String? userId;
  String? cnic;
  String? city;
  String? birthday;
  String? bloodGroup;
  String? weight;
  String? height;
  String? age;
  String? disease;
  String? cnicFront;
  String? cnicBack;

  UserModel({
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.mobileNumber,
    this.userId,
    this.cnic,
    this.city,
    this.birthday,
    this.bloodGroup,
    this.weight,
    this.height,
    this.age,
    this.disease,
    this.cnicFront,
    this.cnicBack,
  });

  UserModel.fromJSON(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    password = json['password'];
    mobileNumber = json['mobile_number'];
    userId = json['uid'];
    cnic = json['cnic'];
    city = json['city'];
    birthday = json['birthday'];
    bloodGroup = json['blood_group'];
    weight = json['weight'];
    height = json['height'];
    age = json['age'];
    disease = json['disease'];
    cnicFront = json['cnic_front'];
    cnicBack = json['cnic_back'];
  }

  Map<String, dynamic> toJSON() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['password'] = password;
    data['mobile_number'] = mobileNumber;
    data['uid'] = userId;
    data['cnic'] = cnic;
    data['city'] = city;
    data['birthday'] = birthday;
    data['weight'] = weight;
    data['height'] = height;
    data['age'] = age;
    data['disease'] = disease;
    data['cnic_front'] = cnicFront;
    data['cnic_back'] = cnicBack;

    return data;
  }
}
