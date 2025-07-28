import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:wrenchy_admin/constant/color_panel.dart';

class UserManagementScreen extends StatelessWidget {
  const UserManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
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
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'User Management',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search users...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: ColorPanel.lightBlue,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('Name')),
                    DataColumn(label: Text('Email')),
                    DataColumn(label: Text('Status')),
                    DataColumn(label: Text('Actions')),
                  ],
                  rows: [
                    _buildUserRow('John Doe', 'john@example.com', 'Active', [LucideIcons.search, LucideIcons.userX, LucideIcons.mail]),
                    _buildUserRow('Jane Smith', 'jane@example.com', 'Active', [LucideIcons.search, LucideIcons.key, LucideIcons.mail]),
                    _buildUserRow('Bob Johnson', 'bob@example.com', 'Active', [LucideIcons.search, LucideIcons.user, LucideIcons.mail]),
                    _buildUserRow('Alice Brown', 'alice@example.com', 'Active', [LucideIcons.search, LucideIcons.laptop, LucideIcons.mail]),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  DataRow _buildUserRow(String name, String email, String status, List<IconData> icons) {
    return DataRow(
      cells: [
        DataCell(Text(name)),
        DataCell(Text(email)),
        DataCell(Text(status)),
        DataCell(
          Row(
            children: icons.map((icon) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Icon(icon, size: 20),
            )).toList(),
          ),
        ),
      ],
    );
  }
}