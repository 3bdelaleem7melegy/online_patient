
class Doctor {
  String id;
  String name;
  String email;
  String phoneNumber;
  String imageUrl;
  String location;
  String Price ;
  // String Experience;
  String Special;

  Doctor({
    required this.email,
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.imageUrl,
    required this.location,
    // required this.Experience,
    required this.Price ,
    required this.Special,
  });

  factory Doctor.formJson(Map<String, dynamic> json) {
    return Doctor(
      email: json['email'],
      id: json['id'],
      name: json['name'],
      phoneNumber: json['phoneNumber'],
      imageUrl: json['imageUrl'],
      location: json['location'],
      // Experience: json['Experience'],
      Price : json['Price '],
      Special: json['Special'],
    );
  }

  Map<String, dynamic> toFireStore() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "phoneNumber": phoneNumber,
      "imageUrl": imageUrl,
      "location": location,
      // "Experience": Experience,
      // "Certificates": Certificates,
      "Special": Special,
      "Price":Price,
    };
  }
}