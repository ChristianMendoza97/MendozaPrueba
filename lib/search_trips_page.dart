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
          title: const Text(
            'SEARCH',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.light, // Hacer que el contenido del sistema sea visible
        ),
        body: Stack(
          children: [
            // Fondo degradado global
            Container(
              decoration: const BoxDecoration(
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
                const SizedBox(height: 120), // Espacio debajo de la AppBar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      // Cuadro de búsqueda con bordes redondeados
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: TextField(
                          controller: _searchController,
                          style: const TextStyle(color: Colors.black),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp("[a-zA-Z\s]")),
                          ],
                          decoration: InputDecoration(
                            hintText: 'Christian Mendoza',
                            hintStyle: const TextStyle(color: Colors.black45),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.search),
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
                                    content: Text('Nombre: $_nombre $_apellido'),
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
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
                // Cuadro con degradado en lugar de imagen
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color(0xFF87CEEB), Color(0xFFB0E0E6)],
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            'Mapa o imagen aquí',
                            style: TextStyle(
                              color: Colors.black45,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      // Botones redondos alineados en la parte inferior de la imagen
                      Positioned(
                        right: 20,
                        bottom: 20,
                        child: Column(
                          children: [
                            _buildRoundButton(Icons.map, '3D'),
                            const SizedBox(height: 20),
                            _buildRoundButton(Icons.navigation, '2D'),
                            const SizedBox(height: 20),
                            _buildRoundButton(Icons.gps_fixed, 'Location'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
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
        radius: 25, // Tamaño del botón
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
