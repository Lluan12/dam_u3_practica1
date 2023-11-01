import 'package:flutter/material.dart';

class App3p1 extends StatefulWidget {
  const App3p1({super.key});

  @override
  State<App3p1> createState() => _App3p1State();
}

class _App3p1State extends State<App3p1> {
  int index=0;

  var idM = TextEditingController();
  var nMateria = TextEditingController();
  var semestre = TextEditingController();
  var doccente = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MIS NOTAS"),
        centerTitle: true,
      ),

      body: dinamico(),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (valor){
          setState(() {
            index = valor;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.feed_outlined), label: ""), //MATERIAS
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""), //TAREAS
          BottomNavigationBarItem(icon: Icon(Icons.add), label: ""), // Tareas
        ],
      ),

    );
  }

  Widget dinamico(){
    switch (index){
      case 0: {
        return Padding(
          padding: EdgeInsets.all(50),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center, // Alinea hijos verticalmente al centro
              children: [
              Text(
              "MATERIAS",
              style: TextStyle(
                fontSize: 36, // Tamaño del texto
                fontWeight: FontWeight.w900, // Peso de la fuente (negrita)
                color: Colors.black, // Color del texto
                letterSpacing: 10, // Espaciado entre caracteres
              ),
              ),

                SizedBox(height: 200,),

                TextField(controller: nMateria,
                  decoration: InputDecoration(
                    label: Text("ID",
                      style: TextStyle(
                        letterSpacing: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    suffixIcon: Icon(Icons.verified),
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 40,),

                TextField(controller: nMateria,
                decoration: InputDecoration(
                  label: Text("MATERIA",
                  style: TextStyle(
                    letterSpacing: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                  suffixIcon: Icon(Icons.school),
                  border: OutlineInputBorder(),
                ),

                ),

                SizedBox(height: 40,),

                TextField(controller: semestre,
                  decoration: InputDecoration(
                    label: Text("SEMESTRE",
                      style: TextStyle(
                        letterSpacing: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    suffixIcon: Icon(Icons.numbers),
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 40,),

                TextField(controller: doccente,
                  decoration: InputDecoration(
                    label: Text("DOCENTE",
                      style: TextStyle(
                        letterSpacing: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    suffixIcon: Icon(Icons.person_outline),
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 40,),

                FilledButton(onPressed: (){},
                    child: Text("AGREGAR MATERIA",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),))

                // Agrega más widgets al Column si es necesario
              ],
            ),
          ),
        );
      }

      case 1: {

      }

      case 2: {

      }


    }
    return Center();
  }
}
