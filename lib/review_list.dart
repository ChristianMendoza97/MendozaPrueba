// review_list.dart

import 'package:flutter/material.dart';
import 'review.dart';

class ReviewList extends StatelessWidget {
  const ReviewList({super.key});

  // Método para generar las estrellas
  Row _buildStars(int filledStars, bool hasHalfStar) {
    List<Widget> stars = [];

    // Agrega las estrellas llenas
    for (int i = 0; i < filledStars; i++) {
      stars.add(const Icon(Icons.star, color: Colors.yellow, size: 16));
    }

    // Agrega media estrella si es necesario
    if (hasHalfStar) {
      stars.add(const Icon(Icons.star_half, color: Colors.yellow, size: 16));
    }

    // Completa con estrellas vacías
    while (stars.length < 5) {
      stars.add(const Icon(Icons.star_border, color: Colors.yellow, size: 16));
    }

    return Row(children: stars);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Texto "All reviews" aumentado
        Padding(
          padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
          child: Text(
            'All reviews',
            style: const TextStyle(
              fontSize: 24.0, // Tamaño aumentado
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        // Reseña 1 con 3 estrellas llenas
        Review(
          pathImage: 'assets/images/girl.jpg',
          name: 'Varuna Yasas',
          information: '1 review 5 photos',
          comment: 'There is an amazing place in Siri Lanka',
          stars: _buildStars(3, false), // 3 estrellas llenas
        ),
        const Divider(),
        // Reseña 2 con 1 estrella media
        Review(
          pathImage: 'assets/images/ann.jpg',
          name: 'Varuna Yasas',
          information: '1 review 5 photos',
          comment: 'There is an amazing place in Siri Lanka',
          stars: _buildStars(0, true), // 1 estrella media
        ),
        const Divider(),
        // Reseña 3 con 1 estrella vacía
        Review(
          pathImage: 'assets/images/people.jpg',
          name: 'Varuna Yasas',
          information: '1 review 5 photos',
          comment: 'There is an amazing place in Siri Lanka',
          stars: _buildStars(0, false), // Solo estrellas vacías
        ),
      ],
    );
  }
}
