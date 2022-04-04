import 'package:flutter/material.dart';
import 'modifier_vacataire.dart';

class Vacat {
int id = 0;
String nom = "";
String prenom = "";
String ville = "";
String telperso = "";
String telportable = "";
String telprof = "";
String email = "";

Vacat({required this.id, required this.nom, required this.prenom, required this.ville, required this.telperso,required this.telportable, required this.telprof, required this.email});

}

class Recherche extends StatefulWidget {
 const Recherche({Key? key}) : super(key: key);
 @override
 _RechercheState createState() => _RechercheState();
}

class _RechercheState extends State<Recherche> {

final searchTextController = TextEditingController();
String textSearch = '';

late List<dynamic> initialList;
late List<dynamic> filteredList;



CreerListe() {
  final List<Vacat> _listeVacat = [
    Vacat(id:0, nom:'Allegra', prenom:'Nathan',ville:'Metz',telperso: "01 01 02 03 04",telportable: "06 01 02 03 04",telprof: "03...",email: "all@gmail.com"),
    Vacat(id:1, nom:'Schmit', prenom:'Pierre',ville:'Paris',telperso: "02 01 02 03 04",telportable: "06 11 12 13 14",telprof:"03...",email: "schmit@gmail.com"),
    Vacat(id:2, nom:'Muller', prenom:'Arthur',ville:'Thionville',telperso: "03 01 02 03",telportable: "06 21 22 23 24",telprof:"03...",email: "muller@gmail.com"),
    Vacat(id:3, nom:'Dupraz', prenom:'Pascal',ville:'Saint-Etienne',telperso: "04 01 02 03",telportable: "06 31 32 33 34",telprof:"03...",email: "dupraz@gmail.com"),
    Vacat(id:3, nom:'Martin', prenom:'Jean',ville:'Lyon',telperso: "05 01 02 03 04",telportable: "06 41 42 43 44",telprof: "03...",email: "martin@gmail.com"),
  ];

  return _listeVacat;
}


@override
  void initState() {
    super.initState();
        // Start listening to changes.
    searchTextController.addListener(_getSearch);
    
    initialList = CreerListe();
    filteredList = [];
  }

void _getSearch(){
    textSearch = searchTextController.text;
    textSearch = textSearch.toLowerCase();
                setState(() {
                  filteredList = initialList
                      .where((element) => element.nom.toLowerCase().contains(textSearch) || 
                      element.prenom.toLowerCase().contains(textSearch) || 
                      element.ville.toLowerCase().contains(textSearch) || 
                      element.telperso.toLowerCase().contains(textSearch) || 
                      element.telportable.toLowerCase().contains(textSearch) || 
                      element.telprof.toLowerCase().contains(textSearch) || 
                      element.email.toLowerCase().contains(textSearch))
                      .toList();
                });

  }


 @override
 Widget build(BuildContext context) {
 return Scaffold(
  appBar: AppBar(
  title: Text('Vacataires'),
  centerTitle: true
  ),
  body: Column(
            children:
              [TextField(controller:searchTextController,
                 decoration: InputDecoration(
                      hintText: 'Recherche',
                      hintStyle: TextStyle(
                            color: Colors.cyan,
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
                              ),
                        border: OutlineInputBorder(), //InputBorder.none,
      
                  ),
                ),
              if (filteredList.length == 0  && searchTextController.text.isEmpty)
                   Expanded(
                    child: 
                     ListView.builder(
                        itemCount:  initialList.length,
                        itemBuilder: (context, index) {
            
                        return GestureDetector(
                          onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => modifierVacataire(vacID: initialList[index].id),
                              ),
                            ); 
                        },
                child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex:2,
                        child: 
                        Text(initialList[index].nom,
                          style: const TextStyle(fontWeight: FontWeight.normal,
                                                  fontSize:16)
                                                  )
                        ),
                      Expanded(
                        flex:2,
                        child: 
                        Text(initialList[index].prenom,
                          style: const TextStyle(fontWeight: FontWeight.normal,
                                                  fontSize:16)
                                                  )
                      ),
                        
                        Expanded(
                        flex:2,
                        child: 
                        Text(initialList[index].ville,
                          style: const TextStyle(fontWeight: FontWeight.normal,
                                                 fontSize:16)
                        )
                        ),
                      ],
                    ),
                    /*Row(
                    children: <Widget>[

                      Expanded(
                        flex:1,
                        child: 
                        Text(initialList[index].telportable)),
                      
                      Expanded(
                        flex:1,
                        child: 
                        Text(initialList[index].email)),
                      ],
                    ),
                    */
                  ],
                ),
              );
            },
          
        ))
            else if (filteredList.length==0 && searchTextController.text.isNotEmpty)
              Expanded(
                child: Container(
                  child: Text('Aucune donnée'),
                ),
              )
            else
              Expanded(
                child: ListView.builder(
                        itemCount:  filteredList.length,
                        itemBuilder: (context, index) {
            
            return GestureDetector(
              onTap: () {
                         Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => modifierVacataire(vacID: initialList[index].id),
                              ),
                            ); 
                        },
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex:1,
                        child: 
                        Text(filteredList[index].nom,
                          style: const TextStyle(fontWeight: FontWeight.normal,
                                                 fontSize:16)
                            )
                        ),
                      Expanded(
                        flex:1,
                        child: 
                        Text(filteredList[index].prenom,
                          style: const TextStyle(fontWeight: FontWeight.normal,
                                                 fontSize:16)
                        )
                        
                        ),Expanded(
                        flex:1,
                        child: 
                        Text(filteredList[index].ville),
                        ),
                      ],
                    ),
                    Row(
                    children: <Widget>[
                                            
                      Expanded(
                        flex:1,
                        child: 
                        Text(filteredList[index].telportable)),
                      
                      Expanded(
                        flex:5,
                        child: 
                        Text(filteredList[index].email)),
                      ],
                    ),
                  ],

                ),
              );
            },
          
        ),
              ),
            ],
            )
 );  
 }
 }
