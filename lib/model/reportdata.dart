// To parse this JSON data, do
//
//     final reportData = reportDataFromJson(jsonString);

import 'dart:convert';

ReportData reportDataFromJson(String str) => ReportData.fromJson(json.decode(str));

String reportDataToJson(ReportData data) => json.encode(data.toJson());

class ReportData {
    ReportData({
        required this.transactionDetails,
    });

    TransactionDetails transactionDetails;

    factory ReportData.fromJson(Map<String, dynamic> json) => ReportData(
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
