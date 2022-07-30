class TaskModel {
  String? title;
  String? desc;

  TaskModel({this.title, this.desc});

  TaskModel.fromJson(Map<String, dynamic> json) {
    title = json['Title'];
    desc = json['Desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Title'] = this.title;
    data['Desc'] = this.desc;
    return data;
  }
}