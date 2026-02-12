import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Quita la etiqueta "Debug"
      title: 'Edgar Orozco 6-j',
      
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo, // Color base para la app
      ),
      home: const MenuScreen(),
    );
  }
}

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. Definimos los datos (esto va dentro del build, antes del return Scaffold)
    final List<Map<String, dynamic>> menuOptions = [
      {
        "title": "Ingresos", 
        "subtitle": "Fuentes",
        "icon": Icons.attach_money, // Cambié icono a dinero
        "color": Colors.purpleAccent
      },
      {
        "title": "Gastos",
        "subtitle": "Categorias",
        "icon": Icons.money_off, // Cambié icono a gastos
        "color": Colors.deepOrangeAccent
      },
      {
        "title": "Presupuesto",
        "subtitle": "Estadisticas",
        "icon": Icons.pie_chart, // Cambié icono a gráfica
        "color": Colors.blueAccent
      },
      {
        "title": "Seguridad",
        "subtitle": "Huella ",
        "icon": Icons.lock_outline_rounded,
        "color": Colors.greenAccent
      },
    ];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255), 
      appBar: AppBar(
        title: const Text("Edgar Orozco 6-j"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 184, 176, 176),
        elevation: 0,
        scrolledUnderElevation: 0,
        
        // --- NUEVO: Icono a la izquierda (Esquina Izquierda) ---
        leading: const Icon(Icons.monetization_on_outlined, color: Colors.black87),
        
        // --- NUEVO: Icono a la derecha (Esquina Derecha) ---
        actions: const [
           Padding(
             padding: EdgeInsets.only(right: 16.0), // Margen para que no se pegue al borde
             child: Icon(Icons.account_balance_wallet_outlined, color: Colors.black87),
           )
        ],
      ),
      
      // 2. Aquí empieza el body funcional
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: menuOptions.length, 
        itemBuilder: (context, index) {
          // Extraemos los datos de cada posición
          final item = menuOptions[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 16), 
            elevation: 2, 
            color: const Color.fromARGB(255, 255, 255, 255), 
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              // ACCIÓN AL TOCAR (Funcionalidad)
              onTap: () {
                ScaffoldMessenger.of(context).clearSnackBars(); 
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "Seleccionaste: ${item['title']}",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    backgroundColor: item['color'],
                    behavior: SnackBarBehavior.floating, 
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    duration: const Duration(seconds: 1),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ListTile(
                  // LEADING: Icono con fondo de color suave
                  leading: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: item['color'].withOpacity(0.15), 
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(item['icon'], color: item['color'], size: 28),
                  ),
                  
                  // TEXT: Título y subtítulo
                  title: Text(
                    item['title'],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Text(
                    item['subtitle'],
                    style: TextStyle(color: Colors.grey[600], fontSize: 13),
                  ),
                  
                  // TRAILING: Flecha de navegación
                  trailing: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.arrow_forward_ios_rounded, size: 14, color: Colors.grey),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}