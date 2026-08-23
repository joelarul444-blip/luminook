import 'package:flutter/material.dart';
import 'book_details_page.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

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
          "My Library",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      // =========================
      // BODY
      // =========================
      body: ListView(
        padding: const EdgeInsets.all(20),

        children: [

          const Text(
            "Your Books",
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 15),

          // =========================
          // BOOK 1
          // =========================
          LibraryBookCard(
            title: "The Silent Patient",
            author: "Alex Michaelides",
            imageUrl:
                "https://covers.openlibrary.org/b/isbn/9781250301697-L.jpg",
          ),

          const SizedBox(height: 15),

          // =========================
          // BOOK 2
          // =========================
          LibraryBookCard(
            title: "Atomic Habits",
            author: "James Clear",
            imageUrl:
                "https://covers.openlibrary.org/b/isbn/9780735211292-L.jpg",
          ),

          const SizedBox(height: 15),

          // =========================
          // BOOK 3
          // =========================
          LibraryBookCard(
            title: "Harry Potter",
            author: "J.K. Rowling",
            imageUrl:
                "https://covers.openlibrary.org/b/isbn/9780439708180-L.jpg",
          ),

          const SizedBox(height: 15),

          // =========================
          // BOOK 4
          // =========================
          LibraryBookCard(
            title: "The Alchemist",
            author: "Paulo Coelho",
            imageUrl:
                "https://covers.openlibrary.org/b/isbn/9780062315007-L.jpg",
          ),
        ],
      ),
    );
  }
}


// ==================================================
// LIBRARY BOOK CARD
// ==================================================

class LibraryBookCard extends StatelessWidget {
  final String title;
  final String author;
  final String imageUrl;

  const LibraryBookCard({
    super.key,
    required this.title,
    required this.author,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BookDetailsPage(
              title: title,
              author: author,
              imageUrl: imageUrl,
            ),
          ),
        );
      },

      child: Container(
        padding: const EdgeInsets.all(12),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),

        child: Row(
          children: [

            // =========================
            // BOOK COVER
            // =========================
            ClipRRect(
              borderRadius: BorderRadius.circular(10),

              child: Image.network(
                imageUrl,

                width: 75,
                height: 105,

                fit: BoxFit.cover,

                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 75,
                    height: 105,

                    color: Colors.grey.shade300,

                    child: const Icon(
                      Icons.menu_book,
                      size: 40,
                    ),
                  );
                },
              ),
            ),

            const SizedBox(width: 15),

            // =========================
            // BOOK INFORMATION
            // =========================
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  Text(
                    title,

                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,

                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    author,

                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),

                  const SizedBox(height: 15),

                  const LinearProgressIndicator(
                    value: 0.35,
                  ),

                  const SizedBox(height: 5),

                  const Text(
                    "35% completed",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            // =========================
            // ARROW
            // =========================
            const Icon(
              Icons.arrow_forward_ios,
              size: 18,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}