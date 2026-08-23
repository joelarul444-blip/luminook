import 'package:flutter/material.dart';
import 'reader_page.dart';

class BookDetailsPage extends StatelessWidget {
  final String title;
  final String author;
  final String imageUrl;

  const BookDetailsPage({
    super.key,
    required this.title,
    required this.author,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F5F2),

      // App Bar
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F5F2),
        elevation: 0,
        title: const Text("Book Details"),
      ),

      // Page Content
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            // =========================
            // Book Cover
            // =========================
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                imageUrl,
                width: 220,
                height: 300,
                fit: BoxFit.cover,

                // If image doesn't load
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 220,
                    height: 300,
                    color: Colors.grey.shade300,
                    child: const Icon(
                      Icons.menu_book,
                      size: 70,
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 25),

            // =========================
            // Book Title
            // =========================
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            // =========================
            // Author
            // =========================
            Text(
              "by $author",
              style: const TextStyle(
                fontSize: 17,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 15),

            // =========================
            // Rating
            // =========================
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.star,
                  color: Colors.amber,
                ),

                SizedBox(width: 5),

                Text(
                  "4.5",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25),

            // =========================
            // Description Heading
            // =========================
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "About this book",
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 10),

            // =========================
            // Description
            // =========================
            const Text(
              "Discover an exciting story filled with interesting "
              "characters, memorable moments and a journey that "
              "will keep you reading until the very last page.",
              style: TextStyle(
                fontSize: 16,
                height: 1.6,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 30),

            // =========================
            // Buttons
            // =========================
            Row(
              children: [

                // Add to Library Button
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Added to your library",
                          ),
                        ),
                      );
                    },

                    icon: const Icon(
                      Icons.bookmark_border,
                    ),

                    label: const Text(
                      "Add to Library",
                    ),

                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.all(16),
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                // Read Now Button
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {

                      // Open Reader Page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ReaderPage(
                            title: title,
                          ),
                        ),
                      );
                    },

                    icon: const Icon(
                      Icons.menu_book,
                    ),

                    label: const Text(
                      "Read Now",
                    ),

                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(16),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}