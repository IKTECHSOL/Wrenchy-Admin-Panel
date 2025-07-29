import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:wrenchy_admin/constant/color_panel.dart'; // Custom color panel

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
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
        child: ListView(
          children: [


            const Text(
              'Analytics',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            // Scan Frequency Section
            _buildAnalyticsCard(
              title: 'Scan Frequency',
              description: 'Scan Frequency Statistics (by day, week, or month)',
              child: SizedBox(
                height: 250,
                child: BarChart(
                  BarChartData(
                    gridData: FlGridData(show: true),
                    titlesData: FlTitlesData(show: true),
                    borderData: FlBorderData(show: true, border: Border.all(color: ColorPanel.secondaryColor)), // Secondary color border
                    barGroups: [
                      BarChartGroupData(
                        x: 0,
                        barRods: [BarChartRodData(toY: 3, color: ColorPanel.secondaryColor)],
                      ),
                      BarChartGroupData(
                        x: 1,
                        barRods: [BarChartRodData(toY: 2, color: ColorPanel.secondaryColor)],
                      ),
                      BarChartGroupData(
                        x: 2,
                        barRods: [BarChartRodData(toY: 4, color: ColorPanel.secondaryColor)],
                      ),
                      BarChartGroupData(
                        x: 3,
                        barRods: [BarChartRodData(toY: 1, color: ColorPanel.secondaryColor)],
                      ),
                      BarChartGroupData(
                        x: 4,
                        barRods: [BarChartRodData(toY: 5, color: ColorPanel.secondaryColor)],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Most Scanned Models Section
            Row(
              children: [
                Expanded(
                  child: _buildAnalyticsCard(
                    title: 'Most Scanned Models',
                    description: 'Top scanned vehicle models',
                    child: Column(
                      children: [
                        _buildScannedModelCard('Toyota Corolla', 150),
                        _buildScannedModelCard('Honda Civic', 120),
                        _buildScannedModelCard('Ford Focus', 90),
                      ],
                    ),
                  ),
                ),

                SizedBox(width: 20),
                Expanded(
                  child: _buildAnalyticsCard(
                    title: 'OBD Code Statistics',
                    description: 'Most common OBD codes',
                    child: _buildOBDTable(context),
                  ),
                ),
              ],
            ),
            // OBD Code Statistics Section

          ],
        ),
      ),
    );
  }

  // Helper method to build each section card
  Widget _buildAnalyticsCard({
    required String title,
    required String description,
    required Widget child,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: ColorPanel.secondaryColor, // Secondary color for the title
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
            const SizedBox(height: 16),
            child, // The dynamic content (chart, table, etc.)
          ],
        ),
      ),
    );
  }

  // Method to build each scanned model card
  Widget _buildScannedModelCard(String model, int scans) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        model,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: ColorPanel.secondaryColor), // Title in secondary color
      ),
      subtitle: Text(
        '$scans scans',
        style: const TextStyle(fontSize: 14, color: Colors.grey),
      ),
      trailing: Icon(
        Icons.directions_car,
        color: ColorPanel.secondaryColor, // Icon in secondary color
      ),
    );
  }
// Method to build OBD codes table
  Widget _buildOBDTable(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal, // Allow horizontal scrolling
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9, // Extend the width by 90% of the screen width
        child: DataTable(
          columns: const [
            DataColumn(
              label: Text(
                'OBD Code',
                style: TextStyle(fontWeight: FontWeight.bold, color: ColorPanel.secondaryColor), // Header in secondary color
              ),
            ),
            DataColumn(
              label: Text(
                'Count',
                style: TextStyle(fontWeight: FontWeight.bold, color: ColorPanel.secondaryColor), // Header in secondary color
              ),
            ),
          ],
          rows: [
            _buildOBDRow('P0171', 120),
            _buildOBDRow('P0300', 90),
            _buildOBDRow('P0420', 75),
          ],
        ),
      ),
    );
  }

// Helper method to create a row in OBD table
  DataRow _buildOBDRow(String code, int count) {
    return DataRow(
      cells: [
        DataCell(Text(code)),
        DataCell(Text('$count')),
      ],
    );
  }

}
