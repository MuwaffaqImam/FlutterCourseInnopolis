// flutter 2.0 -> Null Safty

class User {
  late int id;
  late String name;
  late String email;
  late String gender;
  late String status;

  User(this.id,this.name);

  User.fromJson(Map<String,dynamic> json){
    id = json["id"];
    email = json["email"];
    name = json["name"];
    gender = json["gender"];
    status = json["status"];
  }

}

// "id": 2293,
// "name": "Msgr. Jitendra Iyengar",
// "email": "jitendra_iyengar_msgr@blick-kuvalis.biz",
// "gender": "male",
// "status": "active"
