import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Para utilizar el inputFormatters

class SearchTripsPage extends StatefulWidget {
  const SearchTripsPage({Key? key}) : super(key: key);

  @override
  _SearchTripsPageState createState() => _SearchTripsPageState();
}

class _SearchTripsPageState extends State<SearchTripsPage> {
  final TextEditingController _searchController =
      TextEditingController(text: 'Christian Mendoza');
  String _searchText = '';
  String _nombre = '';
  String _apellido = '';

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
        extendBodyBehindAppBar: true, // Permitir que el cuerpo se extienda detrás de la AppBar
        appBar: AppBar(
          backgroundColor: Colors.transparent, // Fondo transparente
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.light, // Hacer que el contenido del sistema (hora, batería) sea visible
        ),
        body: Stack(
          children: [
            // Degradado de fondo
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF4268D3), Color(0xFF87CEEB)],
                ),
              ),
            ),
            // Contenido principal
            Column(
              children: [
                SizedBox(height: 100), // Espacio debajo de la barra superior
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      // Cuadro de búsqueda con bordes redondeados
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: TextField(
                          controller: _searchController,
                          style: TextStyle(color: Colors.black),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp("[a-zA-Z\s]")),
                          ],
                          decoration: InputDecoration(
                            hintText: 'Knuckles Mountain Range',
                            hintStyle: TextStyle(color: Colors.black45),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(Icons.search),
                              onPressed: () {
                                setState(() {
                                  _searchText = _searchController.text;
                                  List<String> parts = _searchText.split(" ");
                                  _nombre = parts.isNotEmpty ? parts[0] : '';
                                  _apellido =
                                      parts.length > 1 ? parts.sublist(1).join(' ') : '';
                                });

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Nombre: $_nombre, Apellido: $_apellido'),
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
                      SizedBox(height: 20),
                    ],
                  ),
                ),
                // Mapa o imagen (se agregará más tarde)
                Expanded(
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Center(
                        child: Text(
                          'Mapa o imagen aquí', // Reemplazar por la imagen real
                          style: TextStyle(color: Colors.black54),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Botones redondos alineados a la derecha
            Positioned(
              right: 20,
              top: 150,
              child: Column(
                children: [
                  _buildRoundButton(Icons.map, '3D'),
                  SizedBox(height: 10),
                  _buildRoundButton(Icons.navigation, '2D'),
                  SizedBox(height: 10),
                  _buildRoundButton(Icons.gps_fixed, 'Location'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget para los botones redondos
  Widget _buildRoundButton(IconData icon, String tooltip) {
    return Tooltip(
      message: tooltip,
      child: CircleAvatar(
        radius: 30,
        backgroundColor: Colors.white,
        child: Icon(icon, color: Colors.black),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
