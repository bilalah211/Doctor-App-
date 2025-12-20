class DoctorModel {
  String name;
  String image;
  String desc;
  String location;

  DoctorModel({
    required this.name,
    required this.image,
    required this.desc,
    required this.location,
  });
}

List<DoctorModel> doctors = [
  DoctorModel(
    name: 'Dr. Imran Orakzai',
    image: 'assets/images/doctor.png',
    desc: 'Medicine & Heart Specialist',
    location: 'Good Health Clinic',
  ),
  DoctorModel(
    name: 'Dr. Sarah Khan',
    image: 'assets/images/sarah.png',
    desc: 'Dermatologist specializing in skin treatments.',
    location: 'Saba Medical Centre',
  ),
];
