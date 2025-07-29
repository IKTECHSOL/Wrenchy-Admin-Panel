import 'package:flutter/material.dart';


class VehicleReportsScreen extends StatelessWidget {
  const VehicleReportsScreen({super.key});

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
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Vehicle Reports',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Scan Overview\nView  OBD scans submitted by users.',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 12,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: filterButtonStyle,
                  child: const Text("Filter by date"),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: filterButtonStyle,
                  child: const Text("Filter by user"),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: filterButtonStyle,
                  child: const Text("Filter by severity level"),
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildTable(),
          ],
        ),
      ),
    );
  }

  Widget _buildTable() {
    final data = [
      ['2024-04-23', 'John Smith', 'Toyota Camry 2017', 'High'],
      ['2024-04-23', 'Alice Johnson', 'Honda Accord 2019', 'Medium'],
      ['2024-04-23', 'Michael Brown', 'Ford Escape 2016', 'Low'],
      ['2024-04-20', 'Emily Davis', 'Chevrolet Malibu 2018', 'Low'],
    ];

    return Table(
      border: TableBorder.all(
        color: Colors.grey.shade400,
        width: 1,
      ),
      columnWidths: const {
        0: FixedColumnWidth(120),
        1: FixedColumnWidth(140),
        2: FlexColumnWidth(),
        3: FixedColumnWidth(100),
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        _buildTableRow(['Date', 'User', 'Vehicle', 'Severity'], isHeader: true),
        for (var row in data) _buildTableRow(row),
      ],
    );
  }

  TableRow _buildTableRow(List<String> cells, {bool isHeader = false}) {
    return TableRow(
      decoration: BoxDecoration(
        color: isHeader ? Colors.grey.shade200 : null,
      ),
      children: cells.map((cell) {
        final index = cells.indexOf(cell);
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
          child: index == 3 && !isHeader
              ? _buildSeverityChip(cell)
              : Text(
            cell,
            style: TextStyle(
              fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
              fontSize: 14,
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildSeverityChip(String severity) {
    Color color;
    switch (severity.toLowerCase()) {
      case 'high':
        color = Colors.red.shade100;
        break;
      case 'medium':
        color = Colors.amber.shade100;
        break;
      case 'low':
        color = Colors.green.shade100;
        break;
      default:
        color = Colors.grey.shade300;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        severity,
        style: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

final ButtonStyle filterButtonStyle = ElevatedButton.styleFrom(
  foregroundColor: Colors.black,
  backgroundColor: Colors.white,
  elevation: 0,
  side: const BorderSide(color: Colors.grey),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(12),
  ),
  textStyle: const TextStyle(fontWeight: FontWeight.w500),
);
