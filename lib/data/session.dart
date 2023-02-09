class Session {
  int id = 0;
  String date = '';
  String desciption = '';
  int duration = 0;

  Session(this.id, this.date, this.desciption, this.duration);

  Session.fromJson(Map<String, dynamic> sessionMap) {
    id = sessionMap['id'];
    date = sessionMap['date'];
    desciption = sessionMap['description'];
    duration = sessionMap['duration'];
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date,
      'description': desciption,
      'duration': duration
    };
  }
}
