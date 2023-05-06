class Troubleshoot {
  String? deviceName;
  String? deviceImage;
  List<Parts>? parts;

  Troubleshoot({this.deviceName, this.deviceImage, this.parts});

  Troubleshoot.fromJson(Map<String, dynamic> json) {
    deviceName = json['device_name'];
    deviceImage = json['device_image'];
    if (json['parts'] != null) {
      parts = <Parts>[];
      json['parts'].forEach((v) {
        parts!.add(new Parts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['device_name'] = this.deviceName;
    data['device_image'] = this.deviceImage;
    if (this.parts != null) {
      data['parts'] = this.parts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Parts {
  String? partsName;
  String? partsImage;
  List<Symptoms>? symptoms;

  Parts({this.partsName, this.partsImage, this.symptoms});

  Parts.fromJson(Map<String, dynamic> json) {
    partsName = json['parts_name'];
    partsImage = json['parts_image'];
    if (json['symptoms'] != null) {
      symptoms = <Symptoms>[];
      json['symptoms'].forEach((v) {
        symptoms!.add(new Symptoms.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['parts_name'] = this.partsName;
    data['parts_image'] = this.partsImage;
    if (this.symptoms != null) {
      data['symptoms'] = this.symptoms!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Symptoms {
  String? symptomsName;
  List<Causes>? causes;

  Symptoms({this.symptomsName, this.causes});

  Symptoms.fromJson(Map<String, dynamic> json) {
    symptomsName = json['symptoms_name'];
    if (json['causes'] != null) {
      causes = <Causes>[];
      json['causes'].forEach((v) {
        causes!.add(new Causes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['symptoms_name'] = this.symptomsName;
    if (this.causes != null) {
      data['causes'] = this.causes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Causes {
  String? causeName;
  String? fixesName;

  Causes({this.causeName, this.fixesName});

  Causes.fromJson(Map<String, dynamic> json) {
    causeName = json['cause_name'];
    fixesName = json['fixes_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cause_name'] = this.causeName;
    data['fixes_name'] = this.fixesName;
    return data;
  }
}
