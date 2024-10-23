// review_list.dart

import 'package:flutter/material.dart';
import 'review.dart';

class ReviewList extends StatelessWidget {
  const ReviewList({super.key});

  // Método para generar las estrellas con 3 llenas, 1 semi llena y 1 vacía
  Row _buildStars() {
    return Row(
      children: const [
        Icon(Icons.star, color: Colors.yellow, size: 16),
        Icon(Icons.star, color: Colors.yellow, size: 16),
        Icon(Icons.star, color: Colors.yellow, size: 16),
        Icon(Icons.star_half, color: Colors.yellow, size: 16),
        Icon(Icons.star_border, color: Colors.yellow, size: 16),
      ],
    );
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
        // Reseña 1 con 3 estrellas llenas, 1 semi llena y 1 vacía
        Review(
          pathImage: 'assets/images/girl.jpg',
          name: 'Varuna Yasas',
          information: '1 review 5 photos',
          comment: 'There is an amazing place in Siri Lanka',
          stars: _buildStars(), // Estrellas con 3 llenas, 1 semi llena, 1 vacía
        ),
        const Divider(),
        // Reseña 2 con la misma configuración de estrellas
        Review(
          pathImage: 'assets/images/ann.jpg',
          name: 'Varuna Yasas',
          information: '1 review 5 photos',
          comment: 'There is an amazing place in Siri Lanka',
          stars: _buildStars(), // Estrellas con 3 llenas, 1 semi llena, 1 vacía
        ),
        const Divider(),
        // Reseña 3 con la misma configuración de estrellas
        Review(
          pathImage: 'assets/images/people.jpg',
          name: 'Varuna Yasas',
          information: '1 review 5 photos',
          comment: 'There is an amazing place in Siri Lanka',
          stars: _buildStars(), // Estrellas con 3 llenas, 1 semi llena, 1 vacía
        ),
      ],
    );
  }
}
