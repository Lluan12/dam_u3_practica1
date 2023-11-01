import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

  List <String> m = ["1","2","3"];

  DateTime selectedDate = DateTime.now();
  String f_entrega = "";



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
          BottomNavigationBarItem(icon: Icon(Icons.feed_outlined), label: "Agregar Materia"), //MATERIAS
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Lista de Tareas"), //TAREAS
          BottomNavigationBarItem(icon: Icon(Icons.add), label:  "Agregar Tareas"), // Tareas
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

                TextField(
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
                    ),)
                ),

                // Agrega más widgets al Column si es necesario
              ],
            ),
          ),
        );
      }

      case 1: {
        return ListView.builder(
            itemCount: 3,
            itemBuilder: (context, indice){
              return ListTile(
                title: Text("Ejercicio 1"),
                subtitle: Text("MATERIA"),
                leading: CircleAvatar(child: Text("ID"), radius: 15,),


                trailing: IconButton(
                  onPressed: (){

                  },
                  icon: Icon(Icons.delete),
                ),
                onTap: (){
                  updateTarea();
                },
              );
            }
        );
      }

      case 2: {
        return ListView.builder(
                itemCount: 3,
                itemBuilder: (context, indice){
                  return ListTile(
                title: Text("Matematicas"),
                subtitle: Text("BENIGNO"),
                leading: CircleAvatar(child: Text("7"), radius: 15,),


                trailing: IconButton(
                onPressed: (){
                  actualizarMateria();
                },
                icon: Icon(Icons.edit),
                ),
                    onTap: (){
                      agregarTarea();
                    },
                );
                }
                );
      }


    }
    return Center();
  }

  void agregarTarea(){
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        elevation: 5,
        builder: (builder){
          return (Container(
            padding: EdgeInsets.only(
                top: 15, left: 30, right: 30,
                bottom: MediaQuery.of(context).viewInsets.bottom+50),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                TextButton(
                  onPressed: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(), // Fecha inicial
                      firstDate: DateTime(2023), // Fecha mínima seleccionable
                      lastDate: DateTime(2024), // Fecha máxima seleccionable
                    ).then((pickedDate) {
                      if (pickedDate != null && pickedDate != selectedDate) {
                        setState(() {
                          selectedDate = pickedDate;
                        });
                        setState(() {
                          f_entrega = DateFormat('yyyy-MM-dd').format(selectedDate);
                        });
                      }
                    });
                  },
                  child: Text('Seleccionar Fecha', style: TextStyle(fontSize: 25),),
                ),

                SizedBox(height: 30,),

                Text(f_entrega, style: TextStyle(
                  fontSize: 25,
                ),),


                SizedBox(height: 10,),
                TextField(
                  decoration: InputDecoration(
                      label: Text("DESCRIPCION", style: TextStyle(
                        letterSpacing: 20,
                        fontWeight: FontWeight.bold,
                      ),),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(onPressed: (){}, child: Text("Salir")),
                    ElevatedButton(onPressed: (){}, child: Text("Agregar")),

                  ],
                ),
              ],
            ),
          ));
        });
  }

  void updateTarea(){

    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        elevation: 5,
        builder: (builder){
          return (Container(
            padding: EdgeInsets.only(
                top: 15, left: 30, right: 30,
                bottom: MediaQuery.of(context).viewInsets.bottom+50),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                TextButton(
                  onPressed: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(), // Fecha inicial
                      firstDate: DateTime(2023), // Fecha mínima seleccionable
                      lastDate: DateTime(2024), // Fecha máxima seleccionable
                    ).then((pickedDate) {
                      if (pickedDate != null && pickedDate != selectedDate) {
                        setState(() {
                          selectedDate = pickedDate;
                        });
                        setState(() {
                          f_entrega = DateFormat('yyyy-MM-dd').format(selectedDate);
                        });
                      }
                    });
                  },
                  child: Text('Seleccionar Fecha', style: TextStyle(fontSize: 18),),
                ),

                SizedBox(height: 15,),

                Text(f_entrega, style: TextStyle(
                  fontSize: 25,
                ),),

                SizedBox(height: 10,),

                TextField(
                  decoration: InputDecoration(
                    label: Text("ID Tarea",
                      style: TextStyle(
                        letterSpacing: 3,
                        fontWeight: FontWeight.bold,
                      ),),
                    suffixIcon: Icon(Icons.numbers),
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 15,),

                TextField(
                  decoration: InputDecoration(
                    label: Text("Descripcion", style: TextStyle(
                      letterSpacing: 3,
                      fontWeight: FontWeight.bold,
                    ),),
                    suffixIcon: Icon(Icons.note),
                    border: OutlineInputBorder(),

                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(onPressed: (){}, child: Text("SALIR")),
                    ElevatedButton(onPressed: (){}, child: Text("ACTUALIZAR")),

                  ],
                ),
              ],
            ),
          ));
        });


  }

  void actualizarMateria(){

    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        elevation: 5,
        builder: (builder){
          return (Container(
            padding: EdgeInsets.only(
                top: 15, left: 30, right: 30,
                bottom: MediaQuery.of(context).viewInsets.bottom+50),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                TextField(
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

                SizedBox(height: 15,),

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

                SizedBox(height: 15,),

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

                SizedBox(height: 15,),

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

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    FilledButton(onPressed: (){},
                        child: Text("ELIMINAR",style: TextStyle(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),)
                    ),
                    SizedBox(width: 15,),
                    FilledButton(onPressed: (){},
                        child: Text("ACTUALIZAR",style: TextStyle(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),)
                    ),
                  ],
                )




              ],
            ),
          ));
        });


  }


}
