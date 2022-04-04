import 'package:flutter/material.dart';
import 'bddController.dart';
import 'modifier_vacataire.dart';

class ListeVacataires extends StatelessWidget {
  const ListeVacataires({Key? key}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: FutureBuilder(
        
        future: bddController().getData(),
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot){
            if (!snapshot.hasData)
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [CircularProgressIndicator()],
                )
              );
              
            if (snapshot.data?.length == 0) 
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Aucun vacataire'),
                    ]
                  )
                );
                
        return ListView.builder(
          itemCount: snapshot.data == null ? 0 : snapshot.data?.length,
          itemBuilder: (context, item) {
            return GestureDetector(
              onTap: () {
                           Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => modifierVacataire(vacID: snapshot.data![item][0]),
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
                        Text(
                                (snapshot.data![item]['nom']),
                                ),
                        ),
                      Expanded(
                        flex:1,
                        child: 
                        Text(
                                (snapshot.data![item]['prenom']),
                                ),
                        ),
                      Expanded(
                        flex:1,
                        child: 
                        Text(
                                (snapshot.data![item]['ville']),
                                ),
                        ),Expanded(
                        flex:1,
                        child: 
                        Text(
                                (snapshot.data![item]['email']),
                                ),
                        ),
                      ],
                    ),
                  ],

                ),
              );
            },
          
        );
        },
      )
    );
  }
}
