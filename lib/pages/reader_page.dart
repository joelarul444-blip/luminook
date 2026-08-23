import 'package:flutter/material.dart';

class ReaderPage extends StatefulWidget {
  final String title;

  const ReaderPage({
    super.key,
    required this.title,
  });

  @override
  State<ReaderPage> createState() => _ReaderPageState();
}

class _ReaderPageState extends State<ReaderPage> {
  double fontSize = 18;
  bool darkMode = false;
  bool bookmarked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          darkMode ? const Color(0xFF181818) : const Color(0xFFF7F5F2),

      // =========================
      // APP BAR
      // =========================
      appBar: AppBar(
        backgroundColor:
            darkMode ? const Color(0xFF181818) : const Color(0xFFF7F5F2),

        elevation: 0,

        title: Text(
          widget.title,
          style: TextStyle(
            color: darkMode ? Colors.white : Colors.black,
          ),
        ),

        actions: [
          // Bookmark
          IconButton(
            onPressed: () {
              setState(() {
                bookmarked = !bookmarked;
              });
            },
            icon: Icon(
              bookmarked
                  ? Icons.bookmark
                  : Icons.bookmark_border,
              color: darkMode ? Colors.white : Colors.black,
            ),
          ),

          // Dark mode
          IconButton(
            onPressed: () {
              setState(() {
                darkMode = !darkMode;
              });
            },
            icon: Icon(
              darkMode ? Icons.light_mode : Icons.dark_mode,
              color: darkMode ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),

      // =========================
      // BODY
      // =========================
      body: Column(
        children: [

          // Progress
          LinearProgressIndicator(
            value: 0.35,
            backgroundColor:
                darkMode ? Colors.grey.shade800 : Colors.grey.shade300,
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(25),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // Chapter
                  Text(
                    "Chapter 1",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: darkMode
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),

                  const SizedBox(height: 25),

                  // Reading text
                  Text(
                    "The journey begins here.\n\n"
                    "Once upon a time, there was a world filled "
                    "with stories waiting to be discovered. "
                    "Every book opened a door to a new adventure.\n\n"
                    "As the pages turned, new characters appeared, "
                    "bringing their own stories, dreams and challenges.\n\n"
                    "The journey was not always easy. "
                    "There were moments of uncertainty, "
                    "but every challenge made the story more interesting.\n\n"
                    "And this was only the beginning...",
                    style: TextStyle(
                      fontSize: fontSize,
                      height: 1.8,
                      color: darkMode
                          ? Colors.white70
                          : Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // =========================
          // FONT SIZE CONTROLS
          // =========================
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),

            decoration: BoxDecoration(
              color: darkMode
                  ? const Color(0xFF242424)
                  : Colors.white,
            ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                const Text(
                  "A",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),

                Expanded(
                  child: Slider(
                    value: fontSize,
                    min: 14,
                    max: 30,

                    onChanged: (value) {
                      setState(() {
                        fontSize = value;
                      });
                    },
                  ),
                ),

                const Text(
                  "A",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),

          // =========================
          // BOTTOM NAVIGATION
          // =========================
          Container(
            padding: const EdgeInsets.all(15),

            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,

              children: [

                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_back),
                  label: const Text("Previous"),
                ),

                Text(
                  "Page 1 / 10",
                  style: TextStyle(
                    color: darkMode
                        ? Colors.white
                        : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                ElevatedButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Next page coming soon!",
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.arrow_forward),
                  label: const Text("Next"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}