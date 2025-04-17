import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _darkMode = true;
  bool _notifications = true;
  bool _emailAlerts = false;
  bool _twoFactorAuth = true;
  double _fontSizeScale = 1.0;
  String _selectedLanguage = 'English';
  String _selectedTheme = 'Dark Indigo';

  final List<String> _languages = ['English', 'Spanish', 'French', 'German', 'Chinese'];
  final List<String> _themes = ['Dark Indigo', 'Ocean Blue', 'Forest Green', 'Midnight Black', 'Royal Purple'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0E0725),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            SizedBox(height: 20),
            Expanded(
              child: _buildSettingsContent(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Text(
          'Settings',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(),
        IconButton(
          onPressed: () {
            // Navigate back
          },
          icon: Icon(Icons.close, color: Colors.white),
        ),
      ],
    );
  }

  Widget _buildSettingsContent() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile Section
          _buildProfileSection(),
          SizedBox(height: 20),

          // General Settings Section
          _buildSettingsSection(
            title: 'General Settings',
            children: [
              _buildSwitchSetting(
                title: 'Dark Mode',
                subtitle: 'Enable dark theme for the app',
                value: _darkMode,
                onChanged: (value) {
                  setState(() {
                    _darkMode = value;
                  });
                },
                leadingIcon: Icons.dark_mode,
              ),
              _buildSliderSetting(
                title: 'Text Size',
                subtitle: 'Adjust font size throughout the app',
                value: _fontSizeScale,
                min: 0.8,
                max: 1.4,
                onChanged: (value) {
                  setState(() {
                    _fontSizeScale = value;
                  });
                },
                leadingIcon: Icons.text_fields,
              ),
              _buildDropdownSetting(
                title: 'Language',
                subtitle: 'Select your preferred language',
                value: _selectedLanguage,
                items: _languages,
                onChanged: (value) {
                  setState(() {
                    _selectedLanguage = value!;
                  });
                },
                leadingIcon: Icons.language,
              ),
              _buildDropdownSetting(
                title: 'Theme',
                subtitle: 'Choose app color theme',
                value: _selectedTheme,
                items: _themes,
                onChanged: (value) {
                  setState(() {
                    _selectedTheme = value!;
                  });
                },
                leadingIcon: Icons.color_lens,
              ),
            ],
          ),
          SizedBox(height: 20),

          // Notifications Section
          _buildSettingsSection(
            title: 'Notifications',
            children: [
              _buildSwitchSetting(
                title: 'Push Notifications',
                subtitle: 'Receive app notifications',
                value: _notifications,
                onChanged: (value) {
                  setState(() {
                    _notifications = value;
                  });
                },
                leadingIcon: Icons.notifications,
              ),
              _buildSwitchSetting(
                title: 'Email Alerts',
                subtitle: 'Receive important updates via email',
                value: _emailAlerts,
                onChanged: (value) {
                  setState(() {
                    _emailAlerts = value;
                  });
                },
                leadingIcon: Icons.email,
              ),
            ],
          ),
          SizedBox(height: 20),

          // Security Section
          _buildSettingsSection(
            title: 'Security',
            children: [
              _buildSwitchSetting(
                title: 'Two-Factor Authentication',
                subtitle: 'Enable 2FA for extra account security',
                value: _twoFactorAuth,
                onChanged: (value) {
                  setState(() {
                    _twoFactorAuth = value;
                  });
                },
                leadingIcon: Icons.security,
              ),
              _buildActionSetting(
                title: 'Change Password',
                subtitle: 'Update your account password',
                onTap: () {
                  // Show change password dialog
                },
                leadingIcon: Icons.lock,
              ),
              _buildActionSetting(
                title: 'Privacy Settings',
                subtitle: 'Manage your data privacy options',
                onTap: () {
                  // Navigate to privacy settings
                },
                leadingIcon: Icons.privacy_tip,
              ),
            ],
          ),
          SizedBox(height: 20),

          // About Section
          _buildSettingsSection(
            title: 'About',
            children: [
              _buildActionSetting(
                title: 'App Version',
                subtitle: 'v1.0.0',
                onTap: () {},
                leadingIcon: Icons.info,
              ),
              _buildActionSetting(
                title: 'Terms of Service',
                subtitle: 'Read our terms and conditions',
                onTap: () {
                  // Show terms of service
                },
                leadingIcon: Icons.description,
              ),
              _buildActionSetting(
                title: 'Privacy Policy',
                subtitle: 'Read our privacy policy',
                onTap: () {
                  // Show privacy policy
                },
                leadingIcon: Icons.policy,
              ),
            ],
          ),
          SizedBox(height: 20),

          // Logout Button
          Center(
            child: ElevatedButton.icon(
              onPressed: () {
                // Handle logout
              },
              icon: Icon(Icons.logout),
              label: Text('Logout'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade700,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildProfileSection() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Color.fromRGBO(14, 7, 37, 1),      // Deep indigo
            Color.fromRGBO(92, 3, 188, 1),     // Purple
            Color.fromRGBO(234, 55, 152, 1),   // Vibrant pink
          ],
          stops: [0.0, 0.5, 1.0],
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.white.withOpacity(0.2),
            child: Icon(
              Icons.person,
              size: 40,
              color: Colors.white,
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Alex Johnson',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'alex.johnson@example.com',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    // Navigate to edit profile
                  },
                  child: Text(
                    'Edit Profile',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 10),
          Container(
            width: 80,
            height: 80,
            child: Lottie.asset(
              "assets/lotte/Animation1.json",
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsSection({
    required String title,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: Color(0xFF1B254A),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: children,
          ),
        ),
      ],
    );
  }

  Widget _buildSwitchSetting({
    required String title,
    required String subtitle,
    required bool value,
    required Function(bool) onChanged,
    required IconData leadingIcon,
  }) {
    return ListTile(
      leading: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(leadingIcon, color: Colors.white, size: 22),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          color: Colors.white.withOpacity(0.7),
          fontSize: 12,
        ),
      ),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: Colors.purple,
        activeTrackColor: Colors.purple.withOpacity(0.3),
      ),
    );
  }

  Widget _buildSliderSetting({
    required String title,
    required String subtitle,
    required double value,
    required double min,
    required double max,
    required Function(double) onChanged,
    required IconData leadingIcon,
  }) {
    return Column(
      children: [
        ListTile(
          leading: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(leadingIcon, color: Colors.white, size: 22),
          ),
          title: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 12,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Text('A', style: TextStyle(color: Colors.white, fontSize: 12)),
              Expanded(
                child: Slider(
                  value: value,
                  min: min,
                  max: max,
                  divisions: 6,
                  activeColor: Colors.purple,
                  inactiveColor: Colors.grey.withOpacity(0.3),
                  onChanged: onChanged,
                ),
              ),
              Text('A', style: TextStyle(color: Colors.white, fontSize: 18)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownSetting<T>({
    required String title,
    required String subtitle,
    required T value,
    required List<T> items,
    required Function(T?) onChanged,
    required IconData leadingIcon,
  }) {
    return ListTile(
      leading: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(leadingIcon, color: Colors.white, size: 22),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          color: Colors.white.withOpacity(0.7),
          fontSize: 12,
        ),
      ),
      trailing: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: DropdownButton<T>(
          value: value,
          dropdownColor: Color(0xFF1B254A),
          style: TextStyle(color: Colors.white),
          underline: SizedBox(),
          icon: Icon(Icons.arrow_drop_down, color: Colors.white),
          items: items.map((T item) {
            return DropdownMenuItem<T>(
              value: item,
              child: Text(item.toString()),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  Widget _buildActionSetting({
    required String title,
    required String subtitle,
    required Function() onTap,
    required IconData leadingIcon,
  }) {
    return ListTile(
      leading: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(leadingIcon, color: Colors.white, size: 22),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          color: Colors.white.withOpacity(0.7),
          fontSize: 12,
        ),
      ),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16),
      onTap: onTap,
    );
  }
}