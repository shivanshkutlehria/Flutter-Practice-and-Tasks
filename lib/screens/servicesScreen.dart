import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

enum View { StateCard, districtCard, pincodeCard, productCard }

class breadcrumbItem {
  final String label;
  final View targetView;

  breadcrumbItem({required this.label, required this.targetView});
}

class ServicesScreen extends StatefulWidget {
  @override
  _ServicesScreenState createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  bool? isAvailable;
  String? selectedDivision;
  final List<String> divisions = [
    'none',
    'PharmaHopers',
    'WebHopers',
    'bcd',
    'acd'
  ];
  View currentSection = View.StateCard;
  Widget _buildSectionView() {
    switch (currentSection) {
      case View.StateCard:
        return _buildStateCard();
      case View.districtCard:
        return _buildDistrictCard();
      case View.pincodeCard:
        return _buildPincodeCard();
      case View.productCard:
        return _buildProductCard();
    }
  }

  List<breadcrumbItem> breadcrumb = [];

  String? selectedState;
  String? selectedDistrict;
  String? selectedPincode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 4,
                    blurRadius: 6,
                    offset: Offset(0, -4),
                  ),
                ],
              ),
              child: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                leading: Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
                titleSpacing: 0,
                title: Text(
                  'Search Service Areas',
                  style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                actions: [
                  Container(
                      margin: EdgeInsets.only(right: 15),
                      padding:
                          EdgeInsets.symmetric(vertical: 2, horizontal: 14),
                      decoration: BoxDecoration(
                        color: Colors.deepPurpleAccent,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.add_circle_outline,
                            size: 14,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            'Allot',
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ))
                ],
              ),
            )),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Find Services Areas of Our Company',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
                fontSize: 17,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Text('Select Service Type:',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.grey,
                    )),
                const SizedBox(
                  width: 20,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isAvailable = true;
                          selectedDivision = 'none';
                        });
                      },
                      child: Row(
                        children: [
                          Container(
                            height: 12,
                            width: 12,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: isAvailable == true
                                    ? const Color.fromARGB(255, 22, 101, 238)
                                    : Colors.white,
                                border: Border.all(
                                  color: isAvailable == true
                                      ? const Color.fromARGB(255, 46, 151, 237)
                                      : Colors.grey,
                                  width: 2,
                                )),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Available',
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isAvailable = false;
                          selectedDivision = 'none';
                        });
                      },
                      child: Row(
                        children: [
                          Container(
                            height: 12,
                            width: 12,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: isAvailable == false
                                    ? const Color.fromARGB(255, 22, 101, 238)
                                    : Colors.white,
                                border: Border.all(
                                  color: isAvailable == false
                                      ? const Color.fromARGB(255, 46, 151, 237)
                                      : Colors.grey,
                                  width: 2,
                                )),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Allotted',
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          if (isAvailable == true) ...[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(
                    'Select Division:',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Container(
                    width: 140,
                    height: 25,
                    padding: EdgeInsets.fromLTRB(10, 1, 4, 1),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade500),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                      value: selectedDivision,
                      isDense: true,
                      style: GoogleFonts.inter(
                        fontSize: 9,
                        color: Colors.grey.shade500,
                      ),
                      items: divisions.map((String Division) {
                        return DropdownMenuItem<String>(
                          value: Division,
                          child: Text(
                            Division,
                            style: GoogleFonts.inter(
                                fontSize: 13, color: Colors.grey.shade700),
                          ),
                        );
                      }).toList(),
                      icon: Icon(
                        Icons.expand_more_outlined,
                        color: Colors.grey.shade500,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedDivision = newValue;
                        });
                      },
                    )),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 85,
                      height: 25,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        color: Colors.deepPurpleAccent,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.search,
                            size: 14,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            'Search',
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
          if (isAvailable == true) ...[
            SizedBox(
              height: 15,
            ),
            if (selectedDivision != 'none') ...[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: _buildBreadCrumb(),
              ),
              _buildSectionView(),
            ]
          ],
          if (isAvailable == false) ...[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(
                    'Select Division:',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Container(
                    width: 140,
                    height: 28,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                      value: selectedDivision,
                      isDense: true,
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        color: Colors.grey.shade700,
                      ),
                      items: divisions.map((String Division) {
                        return DropdownMenuItem<String>(
                          value: Division,
                          child: Text(
                            Division,
                            style: GoogleFonts.inter(
                                fontSize: 13, color: Colors.grey.shade700),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedDivision = newValue;
                          selectedState = null;
                          selectedDistrict = null;
                          selectedPincode = null;
                          currentSection = View.StateCard;
                          breadcrumb = [];
                        });
                      },
                    )),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 80,
                      height: 28,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        color: Colors.deepPurpleAccent,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.search,
                            size: 13,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            'Search',
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (selectedDivision != null && selectedDivision != 'none') ...[
              SizedBox(
                height: 15,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(5.00, 5.00, 5.00, 5.00),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                        spreadRadius: 1,
                      )
                    ]),
                child: Text(
                  "HELLO",
                  style: GoogleFonts.inter(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              )
            ]
          ]
        ]));
  }

  Widget _buildStateCard() {
    //State card
    return Container(
      margin: EdgeInsets.fromLTRB(15.00, 15.00, 15.00, 15.00),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 4),
              spreadRadius: 1,
            )
          ]),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'WebHopers Academy',
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              )
            ],
          ),
          SizedBox(
            height: 18,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: EdgeInsets.only(bottom: 15),
                  decoration: BoxDecoration(
                      border: Border(
                    bottom: BorderSide(width: 1, color: Colors.grey.shade300),
                  )),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Andaman and Nicobar Islands',
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 1),
                            decoration: BoxDecoration(
                              color: Colors.greenAccent.shade100,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              'Free',
                              style: GoogleFonts.inter(
                                color: Colors.green,
                                fontWeight: FontWeight.w500,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedState = 'Andaman and Nicobar Islands';
                              currentSection = View.districtCard;
                              breadcrumb = [
                                breadcrumbItem(
                                    label: selectedDivision ?? 'Division',
                                    targetView: View.StateCard),
                                breadcrumbItem(
                                    label: selectedState ?? 'State',
                                    targetView: View.StateCard)
                              ];
                            });
                          },
                          child: Container(
                              height: 20,
                              width: 80,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border(
                                      bottom: BorderSide(
                                    color: Colors.deepPurple,
                                    width: 1,
                                  ))),
                              child: Row(
                                children: [
                                  Text(
                                    'Get Districts',
                                    style: GoogleFonts.inter(
                                      fontSize: 11,
                                      color: Colors.deepPurple,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_outlined,
                                    color: Colors.deepPurple,
                                    size: 11,
                                  )
                                ],
                              )))
                    ],
                  )),
              SizedBox(
                height: 18,
              ),
              Container(
                  padding: EdgeInsets.only(bottom: 15),
                  decoration: BoxDecoration(
                      border: Border(
                    bottom: BorderSide(width: 1, color: Colors.grey.shade300),
                  )),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Andaman and Nicobar Islands',
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 1),
                            decoration: BoxDecoration(
                              color: Colors.greenAccent.shade100,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              'Free',
                              style: GoogleFonts.inter(
                                color: Colors.green,
                                fontWeight: FontWeight.w500,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
              SizedBox(
                height: 18,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildDistrictCard() {
    //District Card
    return Container(
      margin: EdgeInsets.fromLTRB(15.00, 15.00, 15.00, 15.00),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 4),
              spreadRadius: 1,
            )
          ]),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'WebHopers Academy',
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              )
            ],
          ),
          SizedBox(
            height: 18,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: EdgeInsets.only(bottom: 15),
                  decoration: BoxDecoration(
                      border: Border(
                    bottom: BorderSide(width: 1, color: Colors.grey.shade300),
                  )),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Kangra',
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 1),
                            decoration: BoxDecoration(
                              color: Colors.greenAccent.shade100,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              'Free',
                              style: GoogleFonts.inter(
                                color: Colors.green,
                                fontWeight: FontWeight.w500,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedDistrict = 'Kangra';
                              currentSection = View.pincodeCard;
                              breadcrumb = [
                                breadcrumbItem(
                                    label: selectedDivision ?? 'Division',
                                    targetView: View.StateCard),
                                breadcrumbItem(
                                    label: selectedState ?? 'State',
                                    targetView: View.StateCard),
                                breadcrumbItem(
                                    label: selectedDistrict ?? 'District',
                                    targetView: View.districtCard)
                              ];
                            });
                          },
                          child: Container(
                              height: 20,
                              width: 85,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border(
                                      bottom: BorderSide(
                                    color: Colors.deepPurple,
                                    width: 1,
                                  ))),
                              child: Row(
                                children: [
                                  Text(
                                    'Get Pincodes',
                                    style: GoogleFonts.inter(
                                      fontSize: 11,
                                      color: Colors.deepPurple,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_outlined,
                                    color: Colors.deepPurple,
                                    size: 11,
                                  )
                                ],
                              )))
                    ],
                  )),
              SizedBox(
                height: 18,
              ),
              Container(
                  padding: EdgeInsets.only(bottom: 15),
                  decoration: BoxDecoration(
                      border: Border(
                    bottom: BorderSide(width: 1, color: Colors.grey.shade300),
                  )),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Chamba',
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 1),
                            decoration: BoxDecoration(
                              color: Colors.greenAccent.shade100,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              'Free',
                              style: GoogleFonts.inter(
                                color: Colors.green,
                                fontWeight: FontWeight.w500,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
              SizedBox(
                height: 18,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildPincodeCard() {
    //Get pincodes
    return Container(
      margin: EdgeInsets.fromLTRB(15.00, 15.00, 15.00, 15.00),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 4),
              spreadRadius: 1,
            )
          ]),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'WebHopers Academy',
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              )
            ],
          ),
          SizedBox(
            height: 18,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: EdgeInsets.only(bottom: 15),
                  decoration: BoxDecoration(
                      border: Border(
                    bottom: BorderSide(width: 1, color: Colors.grey.shade300),
                  )),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '263645',
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 1),
                            decoration: BoxDecoration(
                              color: Colors.greenAccent.shade100,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              'Free',
                              style: GoogleFonts.inter(
                                color: Colors.green,
                                fontWeight: FontWeight.w500,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedPincode = '172635';
                              currentSection = View.productCard;
                              breadcrumb = [
                                breadcrumbItem(
                                    label: selectedDivision ?? 'Division',
                                    targetView: View.StateCard),
                                breadcrumbItem(
                                    label: selectedState ?? 'State',
                                    targetView: View.StateCard),
                                breadcrumbItem(
                                    label: selectedDistrict ?? 'District',
                                    targetView: View.districtCard),
                                breadcrumbItem(
                                    label: selectedPincode ?? 'Pincode',
                                    targetView: View.pincodeCard),
                              ];
                            });
                          },
                          child: Container(
                              height: 20,
                              width: 83,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border(
                                      bottom: BorderSide(
                                    color: Colors.deepPurple,
                                    width: 1,
                                  ))),
                              child: Row(
                                children: [
                                  Text(
                                    'Get Products',
                                    style: GoogleFonts.inter(
                                      fontSize: 11,
                                      color: Colors.deepPurple,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_outlined,
                                    color: Colors.deepPurple,
                                    size: 11,
                                  )
                                ],
                              )))
                    ],
                  )),
              SizedBox(
                height: 18,
              ),
              Container(
                  padding: EdgeInsets.only(bottom: 15),
                  decoration: BoxDecoration(
                      border: Border(
                    bottom: BorderSide(width: 1, color: Colors.grey.shade300),
                  )),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '938364',
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 1),
                            decoration: BoxDecoration(
                              color: Colors.greenAccent.shade100,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              'Free',
                              style: GoogleFonts.inter(
                                color: Colors.green,
                                fontWeight: FontWeight.w500,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
              SizedBox(
                height: 18,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildProductCard() {
    //Product Card
    return Container(
      margin: EdgeInsets.fromLTRB(15.00, 15.00, 15.00, 15.00),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 4),
              spreadRadius: 1,
            )
          ]),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'WebHopers Academy',
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              )
            ],
          ),
          SizedBox(
            height: 18,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: EdgeInsets.only(bottom: 15),
                  decoration: BoxDecoration(
                      border: Border(
                    bottom: BorderSide(width: 1, color: Colors.grey.shade300),
                  )),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Websites',
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 1),
                            decoration: BoxDecoration(
                              color: Colors.deepPurple.shade100,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              'PharmaHopers Regular',
                              style: GoogleFonts.inter(
                                color: Colors.deepPurple,
                                fontWeight: FontWeight.w500,
                                fontSize: 10,
                              ),
                            ),
                          ),
                          SizedBox(height: 5,),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 1),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              'Servicable',
                              style: GoogleFonts.inter(
                                color: Colors.grey,
                                fontWeight: FontWeight.w600,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
              SizedBox(
                height: 18,
              ),
              Container(
                  padding: EdgeInsets.only(bottom: 15),
                  decoration: BoxDecoration(
                      border: Border(
                    bottom: BorderSide(width: 1, color: Colors.grey.shade300),
                  )),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Pharmaceuticals',
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 1),
                            decoration: BoxDecoration(
                              color: Colors.deepPurple.shade100,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              'PharmaHopers Regular',
                              style: GoogleFonts.inter(
                                color: Colors.deepPurple,
                                fontWeight: FontWeight.w500,
                                fontSize: 10,
                              ),
                            ),
                          ),
                          SizedBox(height: 5,),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 1),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              'Servicable',
                              style: GoogleFonts.inter(
                                color: Colors.grey,
                                fontWeight: FontWeight.w600,
                                fontSize: 10,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  )),
              SizedBox(
                height: 18,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildBreadCrumb() {
    //list
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children: List.generate(breadcrumb.length, (index) {
        final item = breadcrumb[index];
        return Row(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  currentSection = item.targetView;
                  breadcrumb = breadcrumb.sublist(0, index + 1);
                });
              },
              child: Text(
                item.label,
                style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.deepPurple,
                    decoration: TextDecoration.underline),
              ),
            ),
            if (index != breadcrumb.length - 1)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6),
                child: Icon(
                  Icons.chevron_right,
                  size: 16,
                  color: Colors.deepPurple.shade200,
                ),
              )
          ],
        );
      })),
    );
  }
}
