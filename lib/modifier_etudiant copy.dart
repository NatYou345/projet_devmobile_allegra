import 'package:flutter/material.dart';
import 'vacataire.dart';
import 'bddController.dart';


class modifier_etudiant extends StatefulWidget {
  const modifier_etudiant({Key? key}) : super(key: key);
    
    //final Vacataire vacataire = Vacataire();

   
  @override
  _modifier_etudiantState createState() => _modifier_etudiantState();
}

class _modifier_etudiantState extends State<modifier_etudiant> {
  
  Vacataire vacataire = Vacataire("0","");

  final _formKey = GlobalKey<FormState>();

  TextEditingController _nomController = TextEditingController();
  TextEditingController _prenomController = TextEditingController();
  TextEditingController _DateNaissanceController = TextEditingController();
  TextEditingController _LieuNaissanceController = TextEditingController();
  TextEditingController _RueController = TextEditingController();
  TextEditingController _BatimentController = TextEditingController();
  TextEditingController _VilleController = TextEditingController();
  TextEditingController _CPController = TextEditingController();
  TextEditingController _TelPersoController = TextEditingController();
  TextEditingController _TelPortableController = TextEditingController();
  TextEditingController _TelProfController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _EmployeurAdresseController = TextEditingController();

  initNom(){
    print('Init nom: ');
    return vacataire.Nom;
    
  }
  @override
  void initState() {
    super.initState();
        // Start listening to changes.

    print('Init nom: '+initNom());
    

    _nomController.addListener(_getValueNom);
    _prenomController.addListener(_getValuePrenom);
    _DateNaissanceController.addListener(_getValueDateNaissance);
    _LieuNaissanceController.addListener(_getValueLieuNaissance);
    _RueController.addListener(_getValueRue);
    _BatimentController.addListener(_getValueBatiment);
    _VilleController.addListener(_getValueVille);
    _CPController.addListener(_getValueCP);
    _TelPersoController.addListener(_getValueTelPerso);
    _TelPortableController.addListener(_getValueTelPortable);
    _TelProfController.addListener(_getValueTelProf);
    _emailController.addListener(_getValueemail);
    _EmployeurAdresseController.addListener(_getValueEmployeurAdresse);

    _nomController = TextEditingController(text: initNom());
  }

  void _getValueNom(){
    vacataire.Nom = _nomController.text;
    print("Vacataire--->"+vacataire.Nom);
  }
  void _getValuePrenom(){
    vacataire.Prenom = _prenomController.text;
  }
  void _getValueDateNaissance(){
    vacataire.DateNaissance = _DateNaissanceController.text;
  }
  void _getValueLieuNaissance(){
    vacataire.LieuNaissance = _LieuNaissanceController.text;
  }
  void _getValueRue(){
    vacataire.Rue = _RueController.text;
  }
  void _getValueBatiment(){
    vacataire.Batiment = _BatimentController.text;
  }
  void _getValueVille(){
    vacataire.Ville = _VilleController.text;
  }
  void _getValueCP(){
    vacataire.CP = _CPController.text;
  }
  void _getValueTelPerso(){
    vacataire.TelPerso = _TelPersoController.text;
  }
  void _getValueTelPortable(){
    vacataire.TelPortable = _TelPortableController.text;
  }
  void _getValueTelProf(){
    vacataire.TelProf = _TelProfController.text;
  }
  void _getValueemail(){
    vacataire.email = _emailController.text;
  }
  void _getValueEmployeurAdresse(){
    vacataire.EmployeurAdresse = _EmployeurAdresseController.text;
  }

  
  @override
  Widget build(BuildContext context) {  
    
    return Scaffold(
      appBar:AppBar(title: Text('Modifier'),),
      //key: _formKey,
      
      body: FutureBuilder( 
       
      future: bddController().getById2(6), 
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot){  
        //print('snapshot in builder: $snapshot');
        if (!snapshot.hasData){
          print('No data');
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [CircularProgressIndicator()],
                )
              );
              /*
             if (snapshot.data?.length == 0) 
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Liste vide'),
                    ]
                  )
                );
            */
      };
      

       return SingleChildScrollView(
        child: new Column(
        children: <Widget>[
          TextFormField(
            controller: _nomController,                          
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              
              labelText: 'Nom *',
              
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Saisissez le nom';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _prenomController,
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              
              labelText: 'Prénom *',
  ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Saisissez le prénom';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _DateNaissanceController,
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              //hintText: 'What do people call you?',
              labelText: 'Date et lieu de naissance *',
  ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Saisissez la date et le lieu de naissance';
              }
              return null;
            },
          ),
          Text(
            'Adresse',
          ),
          TextFormField(
            controller: _RueController,
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              //hintText: 'What do people call you?',
              labelText: 'Rue *',
  ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Saisissez la rue';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _BatimentController,
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              //hintText: 'What do people call you?',
              labelText: 'Bâtiment *',
  ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Saisissez le bâtiment';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _VilleController,
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              //hintText: 'What do people call you?',
              labelText: 'Ville *',
  ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Saisissez la ville';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _CPController,
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              //hintText: 'What do people call you?',
              labelText: 'Code postal *',
  ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Saisissez le code postal';
              }
              return null;
            },
          ),
          Text(
            'Renseignements complémentaires',
          ),
          TextFormField(
            controller: _TelPersoController,
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              //hintText: 'What do people call you?',
              labelText: 'Téléphone personnel *',
  ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Saisissez le téléphone personnel';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _TelPortableController,
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              //hintText: 'What do people call you?',
              labelText: 'Téléphone portable *',
  ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Saisissez le téléphone portable';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _TelProfController,
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              //hintText: 'What do people call you?',
              labelText: 'Téléphone professionnel *',
  ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Saisissez le téléphone professionnel';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              //hintText: 'What do people call you?',
              labelText: 'Adresse électronique *',
  ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Saisissez une adresse électronique';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Sauvegarde en cours')),
                  );
                  bddController().insertData(vacataire);
                  print('Sauvegarde');
                } 
              },
              child: const Text('Soumettre'),
            ),
          ),
        ],
      ),
      );
      })
    );
  }
}

