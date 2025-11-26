class EditProfileInfo {
  final String fullName;
  final String phoneNumber;
  final String clinicName;
  final String clinicAddress;

  EditProfileInfo({
    required this.fullName,
    required this.phoneNumber,
    required this.clinicName,
    required this.clinicAddress,
  });

  factory EditProfileInfo.fromJson(Map<String, dynamic> json) =>
      EditProfileInfo(
        fullName: json['fullName'] ?? '',
        phoneNumber: json['phoneNumber'] ?? '',
        clinicName: json['clinicName'] ?? '',
        clinicAddress: json['clinicAddress'] ?? '',
      );

  Map<String, dynamic> toJson() => {
    'fullName': fullName,
    'phoneNumber': phoneNumber,
    'clinicName': clinicName,
    'clinicAddress': clinicAddress,
  };
}
