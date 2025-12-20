import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:responsiveui/model/available_doctor_model.dart';
import 'package:responsiveui/model/categories_model.dart';
import 'package:responsiveui/model/doctor_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  bool isShowSearch = false;
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Appbar Section
                _appBarSection(),
                SizedBox(height: 30),

                //Carousel Slider
                _doctorCardSection(),
                SizedBox(height: 10),

                //Categories Section
                _buildCategoriesSection(size),

                SizedBox(height: 30),

                //Available Doctor Section Text
                _buildAvailableDoctorSection(),
                SizedBox(height: 16),

                //Doctor Section Card
                _buildDoctorExperienceCard(size),
              ],
            ),
          ),
        ),
      ),

      //Bottom NavigationBar
      bottomNavigationBar: _buildNavigationBar(),
    );
  }

  //*----Navigation Bar----*//
  Widget _buildNavigationBar() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          navItem('assets/icons/home.png', 'Home', 0),
          navItem('assets/icons/doctor.png', 'Doctors', 1),
          navItem('assets/icons/assignment (2).png', 'Patients', 2),
          navItem('assets/icons/user (1).png', 'Profile', 3),
        ],
      ),
    );
  }

  //Navigation Bar Items
  Widget navItem(String icon, String name, int index) {
    bool isSelected = currentIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          currentIndex = index;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 250),
        padding: EdgeInsets.symmetric(
          horizontal: isSelected ? 20 : 0,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xff2979FF) : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Image.asset(
              icon,
              height: 20,
              color: isSelected ? Colors.white : Colors.black54,
            ),
            if (isSelected) ...[
              SizedBox(width: 8),
              Text(
                name,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  //*----Doctor Experience Card----*//
  Widget _buildDoctorExperienceCard(Size size) {
    return SizedBox(
      height: 235,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(width: 10),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: availableDoctors.length,
        itemBuilder: (context, index) {
          final doctor = availableDoctors[index];

          return Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                margin: EdgeInsets.symmetric(horizontal: 5),
                width: size.width * 0.60,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      spreadRadius: -3,
                      offset: Offset(-1, 2),
                      color: Colors.grey.shade400,
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            doctor.name,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            doctor.profession,
                            style: TextStyle(fontSize: 12),
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.amber, size: 16),
                              Icon(Icons.star, color: Colors.amber, size: 16),
                              Icon(Icons.star, color: Colors.amber, size: 16),
                              Icon(Icons.star, color: Colors.amber, size: 16),
                              Icon(Icons.star, color: Colors.amber, size: 16),
                            ],
                          ),
                          SizedBox(height: 20),

                          Text('Experience', style: TextStyle(fontSize: 14)),
                          Text(
                            doctor.experience,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(height: 20),

                          Text('Patients', style: TextStyle(fontSize: 14)),
                          Text(
                            doctor.patients,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: -15,
                      top: 30,
                      child: Image.asset(doctor.image, height: 150),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  //*----Available Doctor Section Text----*//
  Widget _buildAvailableDoctorSection() {
    return Row(
      children: [
        Text(
          'Available Doctor',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        Spacer(),
        Text(
          'See All',
          style: TextStyle(
            color: Colors.black54,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  //*----Categories Section----*//
  Widget _buildCategoriesSection(Size size) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Categories',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            Spacer(),
            Text(
              'See All',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        SizedBox(height: 15),

        SizedBox(
          height: 120,
          width: size.width,
          child: ListView.builder(
            itemCount: categories.length,

            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final category = categories[index];
              return Container(
                width: 100,
                margin: EdgeInsets.symmetric(horizontal: 6, vertical: 10),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      spreadRadius: -3,
                      offset: Offset(-1, 2),
                      color: Colors.grey.shade400,
                    ),
                  ],
                  color: category.color,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      category.image,
                      height: 50,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: 5),
                    Text(
                      category.name,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  //*----Doctors Card Section----*//
  Widget _doctorCardSection() {
    return CarouselSlider.builder(
      itemCount: doctors.length,
      itemBuilder: (context, index, realIndex) {
        return Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 25),

              decoration: BoxDecoration(
                color: Color(0xff2979FF),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    spreadRadius: -3,
                    offset: Offset(-1, 2),
                    color: Colors.black,
                  ),
                ],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Looking For your Desire\nSpecialist Doctor?',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Container(
                                  height: 45,
                                  width: 2,
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    doctors[index].name,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    doctors[index].desc,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(
                                    doctors[index].location,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Spacer(),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              right: 16,
              top: 10,
              height: 70,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  gradient: LinearGradient(
                    colors: [Colors.white, Color(0xff2979FF)],
                  ),
                  shape: BoxShape.circle,
                ),
                child: Image.asset(doctors[index].image, fit: BoxFit.cover),
              ),
            ),
          ],
        );
      },
      options: CarouselOptions(
        height: 180,
        enlargeCenterPage: true,
        viewportFraction: 0.8,
        autoPlay: false,
      ),
    );
  }

  //*----AppBar Section*----//
  Widget _appBarSection() {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Find your',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            Text(
              'Specialist',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ],
        ),

        Spacer(),
        //Search Field
        if (isShowSearch)
          SizedBox(
            width: 200,

            child: TextFormField(
              controller: _searchController,
              autofocus: true,
              decoration: InputDecoration(
                hintText: 'Search...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Colors.black12),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Colors.black12),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Colors.black12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Colors.black12),
                ),
                suffixIcon: InkWell(
                  onTap: () {
                    setState(() {
                      isShowSearch = false;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(
                      border: BoxBorder.all(color: Colors.black12),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.close, size: 16),
                  ),
                ),
              ),
            ),
          )
        else
          //Search Button
          InkWell(
            onTap: () {
              setState(() {
                isShowSearch = true;
              });
            },
            child: Image.asset(
              'assets/icons/search-interface-symbol.png',
              height: 22,
            ),
          ),

        SizedBox(width: 10),
        //Menu Button
        Image.asset('assets/icons/dots.png', height: 25),
      ],
    );
  }
}
