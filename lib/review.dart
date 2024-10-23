// review.dart

import 'package:flutter/material.dart';

class Review extends StatelessWidget {
  const Review({
    super.key,
    required this.pathImage,
    required this.name,
    required this.information,
    required this.comment,
    required this.stars, // Se agrega el parámetro para las estrellas
  });

  final String pathImage;
  final String name;
  final String information;
  final String comment;
  final Row stars; // Se agrega esta propiedad para las estrellas

  @override
  Widget build(BuildContext context) {
    final photo = Container(
      margin: const EdgeInsets.only(
        top: 20,
        left: 20,
      ),
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(pathImage),
        ),
      ),
    );

    final userName = Container(
      margin: const EdgeInsets.only(
        left: 20,
      ),
      child: Text(
        name,
        textAlign: TextAlign.left,
        style: const TextStyle(
          fontFamily: 'Lato',
          fontSize: 15,
          color: Color(0xff58595B),
        ),
      ),
    );

    // Información y estrellas se colocan en una fila
    final userInformationAndStars = Row(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20),
          child: Text(
            information,
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontFamily: 'Lato',
              fontWeight: FontWeight.bold,
              fontSize: 11,
              color: Color(0xff939598),
            ),
          ),
        ),
        const SizedBox(width: 10), // Espacio entre información y estrellas
        stars, // Se agregan las estrellas al lado de la información
      ],
    );

    final userComment = Container(
      margin: const EdgeInsets.only(left: 20),
      child: Text(
        comment,
        textAlign: TextAlign.left,
        style: const TextStyle(
          fontFamily: 'Lato',
          fontSize: 11,
          color: Color(0xff231F20),
        ),
      ),
    );

    final userDetails = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        userName,
        userInformationAndStars, // Se coloca la información y estrellas juntas
        userComment,
      ],
    );

    return Row(
      children: <Widget>[
        photo,
        userDetails,
      ],
    );
  }
}
