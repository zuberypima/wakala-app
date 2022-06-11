// To parse this JSON data, do
//
//     final dataModel = dataModelFromJson(jsonString);

import 'dart:convert';

DataModel dataModelFromJson(String str) => DataModel.fromJson(json.decode(str));

String dataModelToJson(DataModel data) => json.encode(data.toJson());

class DataModel {
    DataModel({
        required this.transactionDetails,
    });

    TransactionDetails transactionDetails;

    factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        transactionDetails: TransactionDetails.fromJson(json["TransactionDetails"]),
    );

    Map<String, dynamic> toJson() => {
        "TransactionDetails": transactionDetails.toJson(),
    };
}

class TransactionDetails {
    TransactionDetails({
        required this.cammision,
        required this.float,
    });

    Cammision cammision;
    Cammision float;

    factory TransactionDetails.fromJson(Map<String, dynamic> json) => TransactionDetails(
        cammision: Cammision.fromJson(json["Cammision"]),
        float: Cammision.fromJson(json["Float"]),
    );

    Map<String, dynamic> toJson() => {
        "Cammision": cammision.toJson(),
        "Float": float.toJson(),
    };
}

class Cammision {
    Cammision({
        required this.amount,
    });

    String amount;

    factory Cammision.fromJson(Map<String, dynamic> json) => Cammision(
        amount: json["Amount"],
    );

    Map<String, dynamic> toJson() => {
        "Amount": amount,
    };
}
