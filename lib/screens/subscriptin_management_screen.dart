import 'package:flutter/material.dart';
import 'package:wrenchy_admin/constant/app_text_styles.dart';
import 'package:wrenchy_admin/constant/color_panel.dart';

class SubscriptionManagementScreen extends StatelessWidget {
  const SubscriptionManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea( // Ensures no content is hidden behind system UI elements like the status bar
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.all(24.0), // You can use margin instead of padding to control the space
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Subscription Plan Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SubscriptionPlan(
                      title: 'Basic',
                      price: '\$0/mo', // Basic plan is free
                      features: [
                        FeatureToggle(feature: 'Feature 1'),
                        FeatureToggle(feature: 'Feature 2'),
                        FeatureToggle(feature: 'Feature 3'),
                        FeatureToggle(feature: 'Feature 4'),
                      ],
                    ),
                    SizedBox(width: 15),
                    SubscriptionPlan(
                      title: 'Standard',
                      price: '\$20/mo',
                      features: [
                        FeatureToggle(feature: 'Feature 1'),
                        FeatureToggle(feature: 'Feature 2'),
                        FeatureToggle(feature: 'Feature 3'),
                        FeatureToggle(feature: 'Feature 4'),
                      ],
                    ),
                    SizedBox(width: 15),
                    SubscriptionPlan(
                      title: 'Premium',
                      price: '\$30/mo',
                      features: [
                        FeatureToggle(feature: 'Feature 1'),
                        FeatureToggle(feature: 'Feature 2'),
                        FeatureToggle(feature: 'Feature 3'),
                        FeatureToggle(feature: 'Feature 4'),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 32),
                Row(
                  children: [
                    Expanded(child: TokenTracking()),

                    SizedBox(width: 32),
                    Expanded(child: PurchaseHistory()),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SubscriptionPlan extends StatelessWidget {
  final String title;
  final String price;
  final List<Widget> features;

  SubscriptionPlan({required this.title, required this.price, required this.features});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: ColorPanel.dividerColor),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: ColorPanel.secondaryColor),
            ),
            SizedBox(height: 8),
            Text(
              price == '\$0/mo' ? 'Free' : price, // If the price is \$0, show "Free"
              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
            ),
            SizedBox(height: 16),
            ...features,
            SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorPanel.secondaryColor
              ),
              onPressed: () {},
              child: Text('Edit Plan', style: AppTextStyles.medium.copyWith(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}

class FeatureToggle extends StatefulWidget {
  final String feature;

  const FeatureToggle({super.key, required this.feature});

  @override
  _FeatureToggleState createState() => _FeatureToggleState();
}

class _FeatureToggleState extends State<FeatureToggle> {
  bool isEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(widget.feature, style: TextStyle(fontSize: 16, color: Colors.grey[800])),
        Switch(
          value: isEnabled,
          activeTrackColor: ColorPanel.secondaryColor,
          inactiveTrackColor: ColorPanel.grey,
          thumbColor: MaterialStateProperty.all(Colors.white),
          onChanged: (value) {
            setState(() {
              isEnabled = value;
            });
          },
          activeColor: Colors.blueAccent,
        ),
      ],
    );
  }
}

class TokenTracking extends StatelessWidget {
  const TokenTracking({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: ColorPanel.dividerColor),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Token Tracking', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: ColorPanel.secondaryColor)),
          SizedBox(height: 16),
          LinearProgressIndicator(value: 0.6, color: ColorPanel.secondaryColor, backgroundColor: Colors.grey[300]),
          SizedBox(height: 8),
          Text('Usage: 650 used', style: TextStyle(fontSize: 16)),
          Text('Projected Usage: 1.350', style: TextStyle(fontSize: 16)),
          Text('250 remaining', style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}

class PurchaseHistory extends StatelessWidget {
  const PurchaseHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: ColorPanel.dividerColor),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Purchase History', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: ColorPanel.secondaryColor)),
          SizedBox(height: 16),
          Text('Tokens \$10.00', style: TextStyle(fontSize: 16)),
          Text('Tokens \$5.00', style: TextStyle(fontSize: 16)),
          Text('Tokens \$25.00', style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
