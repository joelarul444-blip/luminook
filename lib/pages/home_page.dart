import 'package:flutter/material.dart';
import 'book_details_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
          "BookNest",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person_outline),
          ),
        ],
      ),

      // =========================
      // BODY
      // =========================
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Welcome
            const Text(
              "Welcome back 👋",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              "What would you like to read today?",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 25),

            // =========================
            // SEARCH
            // =========================
            TextField(
              decoration: InputDecoration(
                hintText: "Search books or authors...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 30),

            // =========================
            // CONTINUE READING
            // =========================
            const Text(
              "Continue Reading",
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            Container(
              padding: const EdgeInsets.all(15),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),

              child: Row(
                children: [

                  // Book Cover
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),

                    child: Image.network(
                      "https://covers.openlibrary.org/b/isbn/9781635575550-L.jpg",

                      width: 80,
                      height: 110,

                      fit: BoxFit.cover,

                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: 80,
                          height: 110,
                          color: Colors.grey.shade300,
                          child: const Icon(
                            Icons.book,
                            size: 40,
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(width: 15),

                  // Book Information
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                          "The Silent Patient",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 6),

                        Text(
                          "Alex Michaelides",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),

                        SizedBox(height: 15),

                        LinearProgressIndicator(
                          value: 0.65,
                        ),

                        SizedBox(height: 6),

                        Text(
                          "65% completed",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // =========================
            // POPULAR BOOKS
            // =========================
            const Text(
              "Popular Books",
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            SizedBox(
              height: 270,

              child: ListView(
                scrollDirection: Axis.horizontal,

                children: const [

                  // Book 1
                  BookCard(
                    title: "The Silent Patient",
                    author: "Alex Michaelides",
                    imageUrl:
                        "https://covers.openlibrary.org/b/isbn/9781250301697-L.jpg",
                  ),

                  // Book 2
                  BookCard(
                    title: "Atomic Habits",
                    author: "James Clear",
                    imageUrl:
                        "https://covers.openlibrary.org/b/isbn/9780735211292-L.jpg",
                  ),

                  // Book 3
                  BookCard(
                    title: "Harry Potter",
                    author: "J.K. Rowling",
                    imageUrl:
                        "https://covers.openlibrary.org/b/isbn/9780439708180-L.jpg",
                  ),

                  // Book 4
                  BookCard(
                    title: "The Alchemist",
                    author: "Paulo Coelho",
                    imageUrl:
                        "https://covers.openlibrary.org/b/isbn/9780062315007-L.jpg",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// ==================================================
// BOOK CARD
// ==================================================

class BookCard extends StatelessWidget {
  final String title;
  final String author;
  final String imageUrl;

  const BookCard({
    super.key,
    required this.title,
    required this.author,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      
      // =========================
      // WHEN BOOK IS CLICKED
      // =========================
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

      // =========================
      // BOOK CARD
      // =========================
      child: Container(
        width: 155,

        margin: const EdgeInsets.only(right: 15),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            // Book Cover
            ClipRRect(
              borderRadius: BorderRadius.circular(12),

              child: Image.network(
                imageUrl,

                width: 155,
                height: 190,

                fit: BoxFit.cover,

                // If image fails
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 155,
                    height: 190,

                    color: Colors.grey.shade300,

                    child: const Icon(
                      Icons.menu_book,
                      size: 55,
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 8),

            // Book Title
            Text(
              title,

              maxLines: 1,
              overflow: TextOverflow.ellipsis,

              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 4),

            // Author
            Text(
              author,

              maxLines: 1,
              overflow: TextOverflow.ellipsis,

              style: const TextStyle(
                color: Colors.grey,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}