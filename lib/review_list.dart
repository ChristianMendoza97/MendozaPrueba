import 'package:flutter/material.dart';
import 'review.dart';

// Prefijo para la clase según tus iniciales
class ReviewList extends StatelessWidget {
  const ReviewList({super.key});

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
        // Reseña 1 con estrellas agregadas (3 rellenas, 1 semi rellena, 1 vacía)
        Review(
          pathImage: 'assets/images/girl.jpg',
          name: 'Varuna Yasas',
          information: '1 review 5 photos',
          comment: 'There is an amazing place in Siri Lanka',
          stars: Row(
            children: const [
              Icon(Icons.star, color: Colors.yellow, size: 16),
              Icon(Icons.star, color: Colors.yellow, size: 16),
              Icon(Icons.star, color: Colors.yellow, size: 16),
              Icon(Icons.star_half, color: Colors.yellow, size: 16),
              Icon(Icons.star_border, color: Colors.yellow, size: 16),
            ],
          ),
        ),
        Review(
          pathImage: 'assets/images/ann.jpg',
          name: 'Varuna Yasas',
          information: '1 review 5 photos',
          comment: 'There is an amazing place in Siri Lanka',
          stars: Row(
            children: const [
              Icon(Icons.star, color: Colors.yellow, size: 16),
              Icon(Icons.star, color: Colors.yellow, size: 16),
              Icon(Icons.star, color: Colors.yellow, size: 16),
              Icon(Icons.star_half, color: Colors.yellow, size: 16),
              Icon(Icons.star_border, color: Colors.yellow, size: 16),
            ],
          ),
        ),
        Review(
          pathImage: 'assets/images/people.jpg',
          name: 'Varuna Yasas',
          information: '1 review 5 photos',
          comment: 'There is an amazing place in Siri Lanka',
          stars: Row(
            children: const [
              Icon(Icons.star, color: Colors.yellow, size: 16),
              Icon(Icons.star, color: Colors.yellow, size: 16),
              Icon(Icons.star, color: Colors.yellow, size: 16),
              Icon(Icons.star_half, color: Colors.yellow, size: 16),
              Icon(Icons.star_border, color: Colors.yellow, size: 16),
            ],
          ),
        ),
      ],
    );
  }
}

// Prefijo aplicado solo a la nueva clase creada.
class CJMMReview extends StatelessWidget {
  final String pathImage;
  final String name;
  final String information;
  final String comment;
  final Widget stars; // Nueva propiedad para las estrellas

  const CJMMReview({
    super.key,
    required this.pathImage,
    required this.name,
    required this.information,
    required this.comment,
    required this.stars, // Se agrega este parámetro
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(pathImage),
      ),
      title: Text(name),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(information),
          stars, // Se muestran las estrellas
        ],
      ),
      trailing: Text(comment),
    );
  }
}