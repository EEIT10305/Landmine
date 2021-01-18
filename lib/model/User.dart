class User {
  //JSON轉DART工具
  //https://javiercbk.github.io/json_to_dart/
  //  {
  //  "id": "",
  //  "name": "",
  //  "email": "",
  //  "password": "",
  //  "authority": ""
  //  }
  String uSERID;
  String uSERNAME;
  String eMAIL;
  String pASSWORD;
  String uSERAUTHORITY;

  User(
      {this.uSERID,
        this.uSERNAME,
        this.eMAIL,
        this.pASSWORD,
        this.uSERAUTHORITY});

  User.fromJson(Map<String, dynamic> json) {
    uSERID = json['USER_ID'];
    uSERNAME = json['USER_NAME'];
    eMAIL = json['EMAIL'];
    pASSWORD = json['PASSWORD'];
    uSERAUTHORITY = json['USER_AUTHORITY'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['USER_ID'] = this.uSERID;
    data['USER_NAME'] = this.uSERNAME;
    data['EMAIL'] = this.eMAIL;
    data['PASSWORD'] = this.pASSWORD;
    data['USER_AUTHORITY'] = this.uSERAUTHORITY;
    return data;
  }
}