
import 'dart:convert';

Mydata mydataFromJson(String str) => Mydata.fromJson(json.decode(str));

String mydataToJson(Mydata data) => json.encode(data.toJson());

class Mydata {
    double n;
    double p;
    double k;
    double temp;
    double hum;
    double ph;

    Mydata({
        required this.n,
        required this.p,
        required this.k,
        required this.temp,
        required this.hum,
        required this.ph
    });

    factory Mydata.fromJson(Map<String, dynamic> json) => Mydata(
        n: json["n"],
        p: json["p"],
        k: json["k"],
        temp: json["temp"],
        hum: json["hum"],
        ph: json["ph"]
    );

    Map<String, dynamic> toJson() => {
        "n": n,
        "p": p,
        "k": k,
        "temp": temp,
        "hum": hum,
        "ph": ph
    };
}
