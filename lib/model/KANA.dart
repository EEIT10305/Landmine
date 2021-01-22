class KANA {
  //JSON轉DART工具
  //https://javiercbk.github.io/json_to_dart/
  //  {
  //  "KANA_ID": "",
  //  "KANA_ONYOMI": "",
  //  "KANA_IMG": "",
  //  "KANA_CATOGORY": ""
  //  }
  String kANAID;
  String kANAONYOMI;
  String kANAIMG;
  String kANACATOGORY;

  KANA({this.kANAID, this.kANAONYOMI, this.kANAIMG, this.kANACATOGORY});

  KANA.fromJson(Map<String, dynamic> json) {
    kANAID = json['KANA_ID'];
    kANAONYOMI = json['KANA_ONYOMI'];
    kANAIMG = json['KANA_IMG'];
    kANACATOGORY = json['KANA_CATOGORY'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['KANA_ID'] = this.kANAID;
    data['KANA_ONYOMI'] = this.kANAONYOMI;
    data['KANA_IMG'] = this.kANAIMG;
    data['KANA_CATOGORY'] = this.kANACATOGORY;
    return data;
  }
}