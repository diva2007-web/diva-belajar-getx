import 'package:flutter/material.dart';
import 'package:belajar_getx/app/data/models/post_model.dart';

class PostDetailView extends StatelessWidget {
  final Post post;

  const PostDetailView({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 96, 95, 95),
      appBar: AppBar(
        title: const Text(
          "Detail Post",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Colors.deepPurple, Colors.indigo],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  post.title,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),

                // Body
                Text(
                  post.body,
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.5,
                    color: Colors.white.withOpacity(0.95),
                  ),
                ),
                const SizedBox(height: 20),

                // Info user & id
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.person, color: Colors.white70, size: 18),
                        const SizedBox(width: 6),
                        Text(
                          "User: ${post.userId}",
                          style: const TextStyle(
                              fontSize: 14, color: Colors.white70),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.article, color: Colors.white70, size: 18),
                        const SizedBox(width: 6),
                        Text(
                          "ID: ${post.id}",
                          style: const TextStyle(
                              fontSize: 14, color: Colors.white70),
                        ),
                      ],
                    ),
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
