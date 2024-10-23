import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Importa este paquete para utilizar el inputFormatters

class SearchTripsPage extends StatefulWidget {
  const SearchTripsPage({Key? key}) : super(key: key);

  @override
  _SearchTripsPageState createState() => _SearchTripsPageState();
}

class _SearchTripsPageState extends State<SearchTripsPage> {
  final TextEditingController _searchController =
      TextEditingController(text: ' Christian Mendoza '); 
  String _searchText = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sexto TI Flutter trips',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Search',
            style: TextStyle(
              fontWeight: FontWeight.w200,
              fontSize: 30,
              color: Colors.white, 
            ),
          ),
          backgroundColor: Color(0xFF4268D3),
        ),
        backgroundColor: Color(0xFF4268D3),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Container(
                    color: Colors.white,
                    child: TextField(
                      controller: _searchController,
                      style: TextStyle(color: Colors.black),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp("[a-zA-Z\s]")),// Permite solo letras y espacios
                      ],
                      decoration: InputDecoration(
                        hintText: 'Christian Mendoza',
                        hintStyle: TextStyle(color: Colors.black45),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        prefixIcon: IconButton(
                          icon: Icon(Icons.search),
                          onPressed: () {
                            setState(() {
                              _searchText = _searchController.text;
                            });
                            
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Nombre: $_searchText'),
                              ),
                            );
                          },
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _searchText = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),

            // Contenedor para el color azul
            Container(
              color: Color(0xFF4268D3),
              child: SizedBox(height: 20), // Ajusta el tamaño como desees
            ),

            
          ],
        ),
      ),
    );
  }


  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}