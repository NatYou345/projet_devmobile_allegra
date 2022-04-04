import 'package:flutter/material.dart';
import 'vacataire.dart';
import 'bddController.dart';


class modifierVacataire extends StatefulWidget {
   modifierVacataire({Key? key, required this.vacID} ) : super(key: key);
    final int vacID;
    //Vacataire vacataire = Vacataire();

    
   
  @override
  _modifierVacataireState createState() => _modifierVacataireState();
}

class _modifierVacataireState extends State<modifierVacataire> {
  final _formKey = GlobalKey<FormState>();
  Vacataire vacataire = Vacataire("","");

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

  bool checkTelperso = true;
  bool checkTelportable = true;
  bool checkTelprof = true;
  
  @override
  void initState() {
    super.initState();
        // Start listening to changes.

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


   // _nomController = TextEditingController(text: initNom());
  }

  void _getValueNom(){
    vacataire.Nom = _nomController.text;
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
        if (!snapshot.hasData){
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
              labelText: 'Date de naissance',
  ),
            validator: (value) {
              
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
              labelText: 'Rue',
  ),
            validator: (value) {
              return null;
            },
          ),
          TextFormField(
            controller: _BatimentController,
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              //hintText: 'What do people call you?',
              labelText: 'Bâtiment',
  ),
            validator: (value) {
              return null;
            },
          ),
          TextFormField(
            controller: _VilleController,
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              labelText: 'Ville',
  ),
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
              labelText: 'Code postal',
  ),
            validator: (value) {
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
              labelText: 'Téléphone personnel',
  ),
            validator: (value) {
              checkTelperso = true;
              if (value == null || value.isEmpty) {
                checkTelperso = false;
              }

              return null;
            },
          ),
          TextFormField(
            controller: _TelPortableController,
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              labelText: 'Téléphone portable *',
  ),
            validator: (value) {
              checkTelportable = true;
              if (value == null || value.isEmpty) {
                checkTelportable = false;
              }
              return null;
            },
          ),
          TextFormField(
            controller: _TelProfController,
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              labelText: 'Téléphone professionnel',
  ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                checkTelprof = true;
                if (value == null || value.isEmpty) {
                checkTelprof = false;
              }
              }
              return null;
            },
          ),
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              labelText: 'Adresse électronique',
  ),
            validator: (value) {
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()  && (checkTelperso || checkTelportable || checkTelprof)) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Sauvegarde en cours')),
                  );
                  bddController().updateData(vacataire);
                } 
                else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Saisissez un numéro de téléphone')),
                  );
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

  

