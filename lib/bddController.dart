import 'package:mysql1/mysql1.dart';
import 'package:vacataires/vacataire.dart';
import 'vacataire.dart';


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

class bddController {
  static String host = 'devbdd.iutmetz.univ-lorraine.fr',
                user = 'allegra2u_appli',
                password = '32009729',
                db = 'allegra2u_DevMobile';
  static int port = 3306;


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

  Future<List<dynamic>> getData() async {
    var results;
    try {
    final conn = await MySqlConnection.connect(ConnectionSettings(
      host: host,
      port: port,
      user: user,
      password: password,
      db: db,
     ));

    results = await conn.query(
       'select * from renseignements',
     );
    conn.close();
    return results.toList();

    }
    catch (e){print("pas de connexion");}
    
    results = CreerListe();
    return results;
     
  }

  Future<List<dynamic>> insertData(Vacataire v) async {
    final conn = await MySqlConnection.connect(ConnectionSettings(
      
      host: host,
      port: port,
      user: user,
      password: password,
      db: db,
     ));
   
    String qry = "insert into renseignements ( nom, prenom, date_naissance, lieu_naissance, rue, batiment, ville, code_postal, tel_perso, tel_portable, tel_pro, email, adresse_employeur) Values ('" + v.Nom + "','" + v.Prenom + "','"+ v.DateNaissance + "','" + v.LieuNaissance + "','" + v.Rue + "','" + v.Batiment + "','" + v.Ville + "','" + v.CP + "','" + v.TelPerso + "','" + v.TelPortable + "','"  + v.TelProf+ "','" + v.email+ "','" + v.EmployeurAdresse + "')";
    
     var results = await conn.query(
       qry, //"insert into renseignements ( nom, prenom) Values (' + v.Nom + ',' +v.Prenom + ')'",
     );
     conn.close();
     return results.toList();
  }

  
  Future<List<dynamic>> updateData(Vacataire v) async {
    final conn = await MySqlConnection.connect(ConnectionSettings(
      
      host: host,
      port: port,
      user: user,
      password: password,
      db: db,
     ));
   
    String qry = "update renseignements ( nom, prenom, date_naissance, lieu_naissance, rue, batiment, ville, code_postal, tel_perso, tel_portable, tel_pro, email, adresse_employeur) "+
                "Values ('" + v.Nom + "','" + v.Prenom + "','"+ v.DateNaissance + "','" + v.LieuNaissance + "','" + v.Rue + "','" + v.Batiment + "','" + v.Ville + "','" + v.CP + "','" + v.TelPerso + "','" + v.TelPortable + "','"  + v.TelProf+ "','" + v.email+ "','" + v.EmployeurAdresse + "')";
    
     var results = await conn.query(
       qry, //"insert into renseignements ( nom, prenom) Values (' + v.Nom + ',' +v.Prenom + ')'",
     );
     conn.close();
     return results.toList();
  }
/*
  Future<List<dynamic>> getById(int id) async   {
    
    final conn = await MySqlConnection.connect(ConnectionSettings(
      
      host: host,
      port: port,
      user: user,
      password: password,
      db: db,
     ));

      
      String qry = "select * from renseignements where id = " + id.toString() +';';
      var results = await conn.query(qry);

      return results.toList();
  }
*/
  Future<List<dynamic>> getById2(int id)  async  {
    
     MySqlConnection conn =   await MySqlConnection.connect(ConnectionSettings(
      
      host: host,
      port: port,
      user: user,
      password: password,
      db: db,
     ));

      String qry = "select * from renseignements where id = " + id.toString() +';';

      var results =  await conn.query(qry);
      //Vacataire v = new Vacataire();
      conn.close();
     return results.toList();
  }
}