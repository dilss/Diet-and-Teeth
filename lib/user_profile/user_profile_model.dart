enum ProfileFormType { showInfo, editInfo }

class UserProfileModel {
  final String uid;
  final String name;
  final String surname;
  final String cellPhone;
  final String email;
  final String dateOfBirth;
  final String district;
  final String city;
  final String state;
  final String country;
  final String pictureUrl;

  UserProfileModel({
    this.uid,
    this.name = 'Nome',
    this.surname = 'Sobrenome',
    this.cellPhone = '(99) 99999-9999',
    this.email = '',
    this.dateOfBirth = '00/00/0000',
    this.district = 'Seu bairro',
    this.city = 'Sua cidade',
    this.state = 'Estado',
    this.country = 'País',
    this.pictureUrl = '',
  });

  UserProfileModel copyWith({
    String name,
    String surname,
    String cellPhone,
    String dateOfBirth,
    String district,
    String city,
    String state,
    String country,
    String pictureUrl,
  }) {
    return UserProfileModel(
      name: name ?? this.name,
      surname: surname ?? this.surname,
      cellPhone: cellPhone ?? this.cellPhone,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      district: district ?? this.district,
      city: city ?? this.city,
      state: state ?? this.state,
      country: country ?? this.country,
      pictureUrl: pictureUrl ?? this.pictureUrl,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'surname': surname,
      'cellPhone': cellPhone,
      'email': email,
      'dateOfBirth': dateOfBirth,
      'district': district,
      'city': city,
      'state': state,
      'country': country,
      'pictureUrl': pictureUrl,
    };
  }

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      uid: json['uid'],
      name: json['name'],
      surname: json['surname'],
      cellPhone: json['cellPhone'],
      email: json['email'],
      dateOfBirth: json['dateOfBirth'],
      district: json['district'],
      city: json['city'],
      state: json['state'],
      country: json['country'],
      pictureUrl: json['pictureUrl'],
    );
  }
}
