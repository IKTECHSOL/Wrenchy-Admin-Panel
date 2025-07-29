import 'package:flutter/material.dart';
import 'package:wrenchy_admin/constant/color_panel.dart';

class HelpRequest {
  final String name;
  final String subject;
  final String submitted;
  String status; // 'Pending', 'In Progress', 'Resolved'
  bool isSelected;
  String assignedTo; // New property for team member assignment

  HelpRequest({
    required this.name,
    required this.subject,
    required this.submitted,
    this.status = 'Pending',
    this.isSelected = false,
    this.assignedTo = 'Unassigned', // Default as 'Unassigned'
  });
}

class ManageHelpRequestsScreen extends StatefulWidget {
  const ManageHelpRequestsScreen({super.key});

  @override
  State<ManageHelpRequestsScreen> createState() => _ManageHelpRequestsScreenState();
}

class _ManageHelpRequestsScreenState extends State<ManageHelpRequestsScreen> {
  List<HelpRequest> requests = [
    HelpRequest(name: 'John Doe', subject: 'Problem logging in', submitted: '2 hours ago', status: 'Pending'),
    HelpRequest(name: 'Jane Smith', subject: 'Question about billing', submitted: '4 days ago', status: 'In Progress'),
    HelpRequest(name: 'Michael Johnson', subject: 'Feature request', submitted: '1 day ago', status: 'Pending'),
    HelpRequest(name: 'Emily Davis', subject: 'Account deactivation', submitted: '2 days ago', status: 'Resolved'),
    HelpRequest(name: 'Chris Wilson', subject: 'Technical issue', submitted: '3 days ago', status: 'In Progress'),
    HelpRequest(name: 'Sarah Brown', subject: 'Password reset', submitted: '5 days ago', status: 'Resolved'),
    HelpRequest(name: 'David Lee', subject: 'Payment issue', submitted: '5 days ago', status: 'Pending'),
    HelpRequest(name: 'Amanda Clark', subject: 'Account update', submitted: '3 days ago', status: 'Resolved'),
  ];

  void _resolveSelected() {
    setState(() {
      for (var request in requests) {
        if (request.isSelected) {
          request.status = 'Resolved';
          request.isSelected = false;
        }
      }
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Selected issues marked as resolved')),
    );
  }

  void _assignToTeamMember(HelpRequest request) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16), // Rounded corners
          ),
          elevation: 16,
          backgroundColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.2,              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  const Text(
                    'Assign to Team Member',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),

                  // Input Field
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Enter team member name',
                      labelStyle: const TextStyle(
                        color: ColorPanel.textGreyColor,
                        fontSize: 14,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: ColorPanel.secondaryColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: ColorPanel.secondaryColor, width: 2),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        request.assignedTo = value;
                      });
                    },
                  ),
                  const SizedBox(height: 16),

                  // Buttons Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Cancel Button
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black, backgroundColor: Colors.grey.shade300,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        ),
                        child: const Text('Cancel', style: TextStyle(fontSize: 14)),
                      ),
                      // Assign Button
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Assigned to ${request.assignedTo}')),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white, backgroundColor: ColorPanel.secondaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        ),
                        child: const Text('Assign', style: TextStyle(fontSize: 14)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    bool hasSelected = requests.any((request) => request.isSelected);

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(

        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            const Text(
              'Customer Support Inbox',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Container(

              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Expanded(
                      flex: 6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Help Requests & Resolution Options',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'View, manage, and resolve customer support requests from the app.\nYou can assign pending requests to team members and mark them as resolved.',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          const SizedBox(height: 16),

                        ],
                      ),
                    ),
                    if (hasSelected)
                      Expanded(
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _resolveSelected,
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white, backgroundColor: ColorPanel.secondaryColor,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              elevation: 5,
                            ),
                            child: const Text('RESOLVE SELECTED'),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Container(

                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  child: DataTable(
                    columnSpacing: 12,
                    horizontalMargin: 16,
                    dataRowHeight: 60,
                    border: TableBorder.all(color: ColorPanel.dividerColor),
                    columns: [
                      DataColumn(
                        label: Text(
                          'Select',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Name',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Subject',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Submitted',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Status',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Assign',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                    ],
                    rows: requests.map((request) {
                      return DataRow(
                        color: MaterialStateProperty.resolveWith<Color>(
                              (states) => request.isSelected
                              ? Colors.blue.withOpacity(0.1)
                              : Colors.transparent,
                        ),
                        cells: [
                          DataCell(
                            Checkbox(
                              value: request.isSelected,
                              onChanged: (value) {
                                setState(() {
                                  request.isSelected = value ?? false;
                                });
                              },
                            ),
                          ),
                          DataCell(Text(request.name)),
                          DataCell(Text(request.subject)),
                          DataCell(Text(request.submitted)),
                          DataCell(
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: _getStatusColor(request.status),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Text(
                                request.status,
                                style: TextStyle(color: Colors.white, fontSize: 12),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          DataCell(
                            // Show assign button only for 'Pending' requests
                            request.status == 'Pending'
                                ? TextButton(
                              onPressed: () => _assignToTeamMember(request),
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.teal,
                              ),
                              child: const Text('Assign'),
                            )
                                : Container(), // Empty container for 'In Progress' and 'Resolved'
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Pending':
        return Colors.orange;
      case 'In Progress':
        return ColorPanel.secondaryColor;
      case 'Resolved':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }
}
