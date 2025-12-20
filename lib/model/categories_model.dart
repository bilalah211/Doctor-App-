import 'dart:ui';

class CategoriesModel {
  String name;
  String image;
  Color color;

  CategoriesModel({
    required this.name,
    required this.image,
    required this.color,
  });
}

List<CategoriesModel> categories = [
  CategoriesModel(
    name: 'Cardiologist',
    image: 'assets/categories/card.png',
    color: Color(0xffFFCDD2),
  ),
  CategoriesModel(
    name: 'Dermatologist',
    image: 'assets/categories/derma.png',
    color: Color(0xffB2EBF2),
  ),
  CategoriesModel(
    name: 'Pediatrician',
    image: 'assets/categories/pediatrician.png',
    color: Color(0xffFFE0B2),
  ),
  CategoriesModel(
    name: 'Dentist',
    image: 'assets/categories/dentist.png',
    color: Color(0xffBBDEFB),
  ),
  CategoriesModel(
    name: 'Ophthalmologist',
    image: 'assets/categories/eye-test.png',
    color: Color(0xffB3E5FC),
  ),
  CategoriesModel(
    name: 'Family Medicine',
    image: 'assets/categories/medicine.png',
    color: Color(0xffC5CAE9),
  ),
  CategoriesModel(
    name: 'Neurologist',
    image: 'assets/categories/people-activity.png',
    color: Color(0xffE1BEE7),
  ),
];
