import 'package:flutter/material.dart';
import 'review.dart'; // Mantengo la referencia al archivo original

class ReviewList extends StatelessWidget {
  const ReviewList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Texto de "All reviews" con prefijo y tamaño de texto aumentado
        Padding(
          padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
          child: Text(
            'All reviews', 
            style: const TextStyle(
              fontSize: 24.0, // Aumentar tamaño del texto
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        // Agregando estrellas (3 llenas, 1 media, 1 vacía) con prefijo
        Row(
          children: [
            const Icon(Icons.star, color: Colors.yellow), // Estrella completa
            const Icon(Icons.star, color: Colors.yellow), // Estrella completa
            const Icon(Icons.star, color: Colors.yellow), // Estrella completa
            const Icon(Icons.star_half, color: Colors.yellow), // Media estrella
            const Icon(Icons.star_border, color: Colors.yellow), // Estrella vacía
          ],
        ),
        const Divider(),
        // Reviews existentes
        const Review(
          pathImage: 'assets/images/girl.jpg',
          name: 'Varuna Yasas',
          information: '1 review 5 photos',
          comment: 'There is an amazing place in Siri Lanka',
        ),
        const Review(
          pathImage: 'assets/images/ann.jpg',
          name: 'Varuna Yasas',
          information: '1 review 5 photos',
          comment: 'There is an amazing place in Siri Lanka',
        ),
        const Review(
          pathImage: 'assets/images/people.jpg',
          name: 'Varuna Yasas',
          information: '1 review 5 photos',
          comment: 'There is an amazing place in Siri Lanka',
        ),
      ],
    );
  }
}
