import 'dart:convert';

ResponseWeek responseWeekFromJson(String str) => ResponseWeek.fromJson(json.decode(str));

String responseWeekToJson(ResponseWeek data) => json.encode(data.toJson());

class ResponseWeek {
    ResponseWeek({
        required this.data,
    });

    Data data;

    factory ResponseWeek.fromJson(Map<String, dynamic> json) => ResponseWeek(
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class Data {
    Data({
        required this.week,
        required this.schedule,
    });

    List<Week> week;
    Schedule schedule;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        week: List<Week>.from(json["week"].map((x) => Week.fromJson(x))),
        schedule: Schedule.fromJson(json["schedule"]),
    );

    Map<String, dynamic> toJson() => {
        "week": List<dynamic>.from(week.map((x) => x.toJson())),
        "schedule": schedule.toJson(),
    };
}

class Schedule {
    Schedule({
        required this.startDate,
        required this.endDate,
    });

    DateTime startDate;
    DateTime endDate;

    factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        startDate: DateTime.parse(json["startDate"]),
        endDate: DateTime.parse(json["endDate"]),
    );

    Map<String, dynamic> toJson() => {
        "startDate": "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "endDate": "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
    };
}

class Week {
    Week({
        required this.day,
        required this.ids,
        required this.hours,
    });

    int day;
    List<String> ids;
    List<String> hours;

    factory Week.fromJson(Map<String, dynamic> json) => Week(
        day: json["day"],
        ids: List<String>.from(json["ids"].map((x) => x)),
        hours: List<String>.from(json["hours"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "day": day,
        "ids": List<dynamic>.from(ids.map((x) => x)),
        "hours": List<dynamic>.from(hours.map((x) => x)),
    };
}