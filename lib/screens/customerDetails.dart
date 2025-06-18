import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Customerdetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Customer Details',
                    style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        const Icon(
                          Icons.send_outlined,
                          color: Color(0xFF6C63FF),
                          size: 16,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          'Send ACTIVATION',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.blue,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Yograj Sharma',
                          style: GoogleFonts.inter(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                              color: Colors.orange.shade100,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: Colors.orange.shade300,
                              )),
                          child: Row(
                            children: [
                              Icon(
                                Icons.warning_outlined,
                                color: Colors.orange.shade700,
                                size: 12,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                'Performa',
                                style: GoogleFonts.inter(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.orange.shade500,
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                                color: Colors.blue.shade100,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: Colors.blue.shade300,
                                )),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.add,
                                  color: Colors.blue,
                                  size: 12,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  'Task',
                                  style: GoogleFonts.inter(
                                    fontSize: 11,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        const Icon(
                          Icons.more_vert,
                          color: Colors.grey,
                          size: 16,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: ElevatedButton.icon(
                                onPressed: () {},
                                icon: const Icon(Icons.chat,
                                    color: Colors.white, size: 16),
                                label: Text('WhatsApp',
                                    style: GoogleFonts.inter(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    )),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                ))),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.update,
                                  color: Colors.white, size: 16),
                              label: Text(
                                'Update Activity',
                                style: GoogleFonts.inter(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF6C63FF),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              )),
                        ),
                        const SizedBox(width: 12),
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.edit,
                              color: Colors.white, size: 16),
                          label: Text(
                            'Edit',
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    _buildDetailRow(
                        'Companies :', 'Millilamps Eng. Solutions Pvt Ltd',
                        hasExplore: true),
                    _buildDetailRow('Assignee Name :', 'Munish Snotra'),
                    _buildDetailRow('Mobile No :', '+91 6265656151',
                        isClickable: true, hasPhone: true),
                    _buildDetailRow('Email :', 'sales@millilamps.in',
                        isClickable: true),
                    _buildDetailRow('Address :',
                        'SCO-104, First Floor, behind Sindhi Sweets, Himachal Pradesh, India'),
                    _buildDetailRow('Customer Status :', 'WIP',
                        isClickable: true, isStatus: true),
                    _buildDetailRow('Source :', 'Google', isClickable: true),
                    _buildDetailRow('Division :', 'PharmaHopers',
                        isClickable: true),
                    _buildDetailRow('Websites :', 'N/A'),
                    _buildDetailRow('Gst :', 'XXX',
                        isClickable: true),
                    _buildDetailRow(
                        'Customer Since :', '20 Nov, 2024 04:33 PM'),

                    SizedBox(height: 25,),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade50,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              _buildTab('Activities', Icons.timeline,
                                  isFirst: true),
                              const SizedBox(width: 12,),
                              _buildTab('Services', Icons.build),
                              const SizedBox(width: 12,),
                              _buildTab('Payments', Icons.payment),
                            ],
                          ),
                          Row(
                            children: [
                              _buildTab('Projects', Icons.folder,
                                  isFirst: true),
                                  const SizedBox(width: 12,),
                              _buildTab('Activation', Icons.verified_user),
                              const SizedBox(width: 12,),
                              _buildTab('Leads', Icons.trending_up),
                            ],
                          ),
                          Row(
                            children: [
                              _buildTab('Credit Notes', Icons.note,
                                  isFirst: true),
                                  const SizedBox(width: 12,),
                              _buildTab('Orders', Icons.shopping_cart),
                              const SizedBox(width: 12,),
                              _buildTab('Attachments', Icons.attach_file),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value,
      {bool isClickable = false,
      bool hasExplore = false,
      bool hasPhone = false,
      bool isStatus = false}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 140,
            child: Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: isClickable ? () {} : null,
                    child: Text(
                      value,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: isClickable ? Colors.blue : Colors.black87,
                      ),
                    ),
                  ),
                ),
                if (hasExplore)
                  GestureDetector(
                    onTap: () {
                      // Explore action
                    },
                    child: Text(
                      'Explore',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                if (hasPhone)
                  Row(
                    children: [
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: () {
                          // Call action
                        },
                        child: const Icon(
                          Icons.add,
                          color: Colors.blue,
                          size: 16,
                        ),
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: () {
                          // WhatsApp action
                        },
                        child: const Icon(
                          Icons.chat,
                          color: Colors.green,
                          size: 16,
                        ),
                      ),
                    ],
                  ),
                if (isStatus)
                  const Icon(
                    Icons.edit_document,
                    color: Colors.blue,
                    size: 16,
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTab(String label, IconData icon, {bool isFirst = false}) {
    return Expanded(
        child: ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(icon, size: 16),
      label: Text(label, style: GoogleFonts.inter(fontSize: 12)),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.purple.shade100,
        padding: const EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ));
  }
}
