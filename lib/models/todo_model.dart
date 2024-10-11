class ToDo {
  final int id;
  final String title;
  final DateTime dueDate;
  late final String status;
  final String priority;

  ToDo({
    required this.id,
    required this.title,
    required this.dueDate,
    required this.status,
    required this.priority,
  });

  factory ToDo.fromJson(Map<String, dynamic> json) {
    return ToDo(
      id: json['id'],
      title: json['title'],
      dueDate: DateTime.parse(json['dueDate']),
      status: json['completed'] ? 'Completed' : 'Pending',
      priority: 'Medium', // Default or fetched from API if available
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'dueDate': dueDate.toIso8601String(),
        'status': status,
        'priority': priority,
      };
}
