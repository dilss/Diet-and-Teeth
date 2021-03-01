enum ProfileFormType { showInfo, editInfo }

class UserProfileModel {
  final String name;
  final String surname;
  final String cellPhone;
  final String zipCode;
  final String address;
  final int number;
  final String district;
  final String city;
  final String state;
  final String country;
  final bool isLoading;
  final bool submitted;
  final ProfileFormType formType;

  UserProfileModel({
    this.name = '',
    this.surname = '',
    this.cellPhone = '',
    this.zipCode = '',
    this.address = '',
    this.number = 0,
    this.district = '',
    this.city = '',
    this.state = '',
    this.country = '',
    this.isLoading = false,
    this.submitted = false,
    this.formType = ProfileFormType.showInfo,
  });

  UserProfileModel copyWith({
    String name,
    String surname,
    String cellPhone,
    String zipCode,
    String address,
    int number,
    String district,
    String city,
    String state,
    String country,
    bool isLoading,
    bool submitted,
    ProfileFormType formType,
  }) {
    return UserProfileModel(
      name: name ?? this.name,
      surname: surname ?? this.surname,
      cellPhone: cellPhone ?? this.cellPhone,
      zipCode: zipCode ?? this.zipCode,
      address: address ?? this.address,
      number: number ?? this.number,
      district: district ?? this.district,
      city: city ?? this.city,
      state: state ?? this.state,
      country: country ?? this.country,
      isLoading: isLoading ?? this.isLoading,
      submitted: submitted ?? this.submitted,
      formType: formType ?? this.formType,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'surname': surname,
      'cellPhone': cellPhone,
      'zipCode': zipCode,
      'address': address,
      'number': number,
      'distric': district,
      'city': city,
      'state': state,
      'country': country,
      'isLoading': isLoading,
      'submitted': submitted,
      'formType': formType,
    };
  }

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      name: json['name'],
      surname: json['surname'],
      cellPhone: json['cellPhone'],
      zipCode: json['zipCode'],
      address: json['address'],
      number: json['number'],
      district: json['district'],
      city: json['city'],
      state: json['state'],
      country: json['country'],
      isLoading: json['isLoading'],
      submitted: json['submitted'],
      formType: json['formType'],
    );
  }
  String get buttonText {
    return formType == ProfileFormType.showInfo ? 'Editar' : 'Salvar';
  }
}
