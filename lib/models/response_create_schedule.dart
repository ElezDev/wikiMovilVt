import 'dart:convert';

ResponseCreateSchedule responseCreateScheduleFromJson(String str) => ResponseCreateSchedule.fromJson(json.decode(str));

String responseCreateScheduleToJson(ResponseCreateSchedule data) => json.encode(data.toJson());

class ResponseCreateSchedule {
    ResponseCreateSchedule({
        required this.data,
    });

    Data data;

    factory ResponseCreateSchedule.fromJson(Map<String, dynamic> json) => ResponseCreateSchedule(
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class Data {
    Data({
        required this.createSchedule,
    });

    CreateSchedule createSchedule;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        createSchedule: CreateSchedule.fromJson(json["createSchedule"]),
    );

    Map<String, dynamic> toJson() => {
        "createSchedule": createSchedule.toJson(),
    };
}

class CreateSchedule {
    CreateSchedule({
        required this.tripp,
    });

    Tripp tripp;

    factory CreateSchedule.fromJson(Map<String, dynamic> json) => CreateSchedule(
        tripp: Tripp.fromJson(json["tripp"]),
    );

    Map<String, dynamic> toJson() => {
        "tripp": tripp.toJson(),
    };
}

class Tripp {
    Tripp({
        required this.id,
    });

    String id;

    factory Tripp.fromJson(Map<String, dynamic> json) => Tripp(
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
    };
}
