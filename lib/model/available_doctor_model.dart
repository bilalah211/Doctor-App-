class AvailableDoctorModel {
  String name;
  String profession;
  String experience;
  String patients;
  String image;

  AvailableDoctorModel({
    required this.name,
    required this.profession,
    required this.experience,
    required this.patients,
    required this.image,
  });
}

List<AvailableDoctorModel> availableDoctors = [
  AvailableDoctorModel(
    name: 'Dr. Warda Ahmad',
    profession: 'Medical Specialist',
    experience: '5 Years',
    patients: '2.5k',
    image: 'assets/images/asma.png',
  ),

  AvailableDoctorModel(
    name: 'Dr. Asma Ilyas',
    profession: 'Therapist',
    experience: '8 Years',
    patients: '1.8k',
    image: 'assets/images/asma.png',
  ),

  AvailableDoctorModel(
    name: 'Dr. Ishfaq Ahmad',
    profession: 'Neurologist',
    experience: '12 Years',
    patients: '3.8k',
    image: 'assets/images/dr ishfaq.png',
  ),
];
