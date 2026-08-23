import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F5F2),

      // =========================
      // APP BAR
      // =========================
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F5F2),
        elevation: 0,

        title: const Text(
          "Profile",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      // =========================
      // BODY
      // =========================
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            const SizedBox(height: 10),

            // =========================
            // PROFILE PHOTO
            // =========================
            const CircleAvatar(
              radius: 55,
              backgroundColor: Colors.deepPurple,

              child: Icon(
                Icons.person,
                size: 60,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 15),

            // =========================
            // USER NAME
            // =========================
            const Text(
              "Joel",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              "Book lover 📚",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 30),

            // =========================
            // READING STATISTICS
            // =========================
            Row(
              children: [

                Expanded(
                  child: _StatCard(
                    icon: Icons.menu_book,
                    number: "12",
                    label: "Books Read",
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: _StatCard(
                    icon: Icons.bookmark,
                    number: "8",
                    label: "Saved",
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: _StatCard(
                    icon: Icons.access_time,
                    number: "24h",
                    label: "Reading",
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            // =========================
            // PROFILE OPTIONS
            // =========================
            _ProfileOption(
              icon: Icons.person_outline,
              title: "Edit Profile",
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Edit Profile coming soon!"),
                  ),
                );
              },
            ),

            _ProfileOption(
              icon: Icons.settings_outlined,
              title: "Settings",
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Settings coming soon!"),
                  ),
                );
              },
            ),

            _ProfileOption(
              icon: Icons.dark_mode_outlined,
              title: "Appearance",
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Appearance settings coming soon!"),
                  ),
                );
              },
            ),

            _ProfileOption(
              icon: Icons.help_outline,
              title: "Help & Support",
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Help & Support coming soon!"),
                  ),
                );
              },
            ),

            _ProfileOption(
              icon: Icons.info_outline,
              title: "About Luminook",
              onTap: () {
                showAboutDialog(
                  context: context,
                  applicationName: "Luminook",
                  applicationVersion: "1.0.0",
                  applicationLegalese: "© 2026 Luminook",
                );
              },
            ),

            const SizedBox(height: 20),

            // =========================
            // LOGOUT BUTTON
            // =========================
            SizedBox(
              width: double.infinity,

              child: OutlinedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Logout coming soon!"),
                    ),
                  );
                },

                icon: const Icon(
                  Icons.logout,
                  color: Colors.red,
                ),

                label: const Text(
                  "Logout",
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),

                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.all(16),
                  side: const BorderSide(
                    color: Colors.red,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}


// ==================================================
// STAT CARD
// ==================================================

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String number;
  final String label;

  const _StatCard({
    required this.icon,
    required this.number,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 18,
        horizontal: 8,
      ),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),

      child: Column(
        children: [

          Icon(
            icon,
            color: Colors.deepPurple,
            size: 28,
          ),

          const SizedBox(height: 8),

          Text(
            number,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 3),

          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 11,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}


// ==================================================
// PROFILE OPTION
// ==================================================

class _ProfileOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _ProfileOption({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),

      child: ListTile(
        onTap: onTap,

        leading: Icon(
          icon,
          color: Colors.deepPurple,
        ),

        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),

        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Colors.grey,
        ),
      ),
    );
  }
}