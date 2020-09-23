class Note {
  String id;
  String image;
  String dob;
  String name;
  String gender;
  String company;
  String email;
  String phone;
  String address;

  Note(
    this.id,
    this.image,
    this.dob,
    this.name,
    this.gender,
    this.company,
    this.email,
    this.phone,
    this.address,
  );

  Note.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    image = json['picture'];
    dob = json['birthday'];
    name = json['name'];
    gender = json['gender'];
    company = json['company'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
  }
}
