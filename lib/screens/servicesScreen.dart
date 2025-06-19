import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ServicesScreen extends StatefulWidget {
  @override
  _ServicesScreenState createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  bool isAvailableChecked = false;
  bool isAllotedChecked = false;
  String selectedDivision = 'none';
  final List<String> divisions = [
    'none',
    'Pharmahopers',
    'Webhopers',
    'bcd',
    'acd'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 4,
        leading: Icon(
          Icons.menu,
          color: Colors.black,
        ),
        title: Text(
          'Search Services Areas',
          style: GoogleFonts.inter(
              fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        actions: [
          Container(
              margin: EdgeInsets.only(right: 15),
              padding: EdgeInsets.symmetric(vertical: 6, horizontal: 14),
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.add,
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
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 5,
            ),
            Text(
              'Find Services area of our company',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
                fontSize: 17,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                SizedBox(
                  width: 150,
                  child: Text(
                    'Select Service Type:',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Transform.scale(
                  scale: 0.6,
                  child: Checkbox(
                    value: isAvailableChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isAvailableChecked = value ?? false;
                        if (isAvailableChecked == true) {
                          isAllotedChecked = false;
                        }
                      });
                    },
                    activeColor: Colors.blue,
                  ),
                ),
                Text(
                  'Available',
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Transform.scale(
                  scale: 0.6,
                  child: Checkbox(
                    value: isAllotedChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isAllotedChecked = value ?? false;
                        if (isAllotedChecked == true) {
                          isAvailableChecked = false;
                        }
                      });
                    },
                    activeColor: Colors.blue,
                  ),
                ),
                Text(
                  'Allotted',
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 1,
            ),
            if (isAvailableChecked) ...[
              Row(
                children: [
                  SizedBox(
                    width: 110,
                    child: Text(
                      'Select Division:',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Transform.scale(
                    scale: 0.7,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade700),
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                      ),
                      child: DropdownButton<String>(
                        value: selectedDivision,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedDivision = newValue!;
                          });
                        },
                        items: divisions
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: GoogleFonts.inter(fontSize: 16),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  Transform.scale(
                    scale: 0.9,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.search, size: 13, color: Colors.white),
                      label: Text(
                        'Search',
                        style: GoogleFonts.inter(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurpleAccent,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          )),
                    ),
                  )
                ],
              ),
              if (selectedDivision != 'none') ...[
                Container(
                  margin: EdgeInsets.fromLTRB(5.00, 5.00, 5.00, 5.00),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: Rou,
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
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'WebHopers Academy',
                            style: GoogleFonts.inter(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          )
                        ],
                      )

                    ],
                  ),
                )
              ]
            ]
          ],
        ),
      ),
    );
  }
}
