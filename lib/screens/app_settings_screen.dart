import 'package:flutter/material.dart';
import 'package:wrenchy_admin/constant/color_panel.dart';

class AppSettingsScreen extends StatefulWidget {
  const AppSettingsScreen({super.key});

  @override
  State<AppSettingsScreen> createState() => _AppSettingsScreenState();
}

class _AppSettingsScreenState extends State<AppSettingsScreen> {
  int currentIndex = 2;
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
              'App Settings',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _buildSettingsCard(
                    title: 'Terms of Service / Privacy Policy',
                    description:
                        'Edit or update the legal documents for app usage.',
                    icon: Icons.description,
                    borderColor: currentIndex == 0 ? ColorPanel.secondaryColor : Colors.transparent,

                    onPressed: () {
                      currentIndex = 0;
                      setState(() {

                      });
                    },
                  ),
                ),

                const SizedBox(width: 20),

                Expanded(
                  child: _buildSettingsCard(
                    title: 'Feature Rollout Control',
                    description:
                        'Manage and control the rollout of new features.',
                    icon: Icons.settings,
                    borderColor: currentIndex == 1 ? ColorPanel.secondaryColor : Colors.transparent,
                    onPressed: () {
                      currentIndex = 1;
                      setState(() {

                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Divider(color: ColorPanel.dividerColor),
            SizedBox(height: 20),
            currentIndex == 0 ? EditLegalDocumentsScreen() : currentIndex == 1 ? FeatureRolloutControlScreen() : SizedBox()
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsCard({
    required String title,
    required String description,
    required IconData icon,
    required VoidCallback onPressed,
    Color borderColor = Colors.transparent
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 40,
              color: ColorPanel.secondaryColor,
            ), // Icon for each section
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: ColorPanel.secondaryColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios, color: ColorPanel.secondaryColor),
          ],
        ),
      ),
    );
  }
}

class EditLegalDocumentsScreen extends StatelessWidget {
  const EditLegalDocumentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

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
            'Terms of Service',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: ColorPanel.secondaryColor,
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            maxLines: 6,
            decoration: InputDecoration(
              labelText: 'Edit Terms of Service',
              labelStyle: TextStyle(color: ColorPanel.textGreyColor),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: ColorPanel.secondaryColor),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Privacy Policy',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: ColorPanel.secondaryColor,
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            maxLines: 6,
            decoration: InputDecoration(
              labelText: 'Edit Privacy Policy',
              labelStyle: TextStyle(color: ColorPanel.textGreyColor),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: ColorPanel.secondaryColor),
              ),
            ),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: ColorPanel.secondaryColor,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 5,
            ),
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}

class FeatureRolloutControlScreen extends StatefulWidget {
  const FeatureRolloutControlScreen({super.key});

  @override
  State<FeatureRolloutControlScreen> createState() =>
      _FeatureRolloutControlScreenState();
}

class _FeatureRolloutControlScreenState
    extends State<FeatureRolloutControlScreen> {
  bool isFeatureEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Container(

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
            'Manage Feature Rollout',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: ColorPanel.secondaryColor,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Enable or disable the rollout of new features to users.',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 30),
          SwitchListTile(
            title: const Text('Enable New Feature'),
            value: isFeatureEnabled,
            onChanged: (value) {
              setState(() {
                isFeatureEnabled = value;
              });
            },
            activeColor: ColorPanel.secondaryColor,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Save the feature rollout status
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: ColorPanel.secondaryColor,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 5,
            ),
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
