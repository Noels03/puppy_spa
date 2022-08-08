// ignore_for_file: prefer_const_declarations

final String tableNotes = 'notes';

class NoteFields {
  static final List<String> values = [
    petName,
    ownerName,
    isCompleted,
    type,
    date,
    startTime,
    endTime,
    service,
    dogSize,
    notes
  ];

  static final String id = '_id';
  static final String petName = 'petName';
  static final String ownerName = 'ownerName';
  static final String type = 'type';
  static final String isCompleted = 'isCompleted';
  static final String date = 'date';
  static final String startTime = 'startTime';
  static final String endTime = 'endTime';
  static final String service = 'service';
  static final String dogSize = 'dogSize';
  static final String notes = 'notes';
}

class Note {
  final int? id;
  final String petName;
  final String ownerName;
  final String type;
  final bool isCompleted;
  final DateTime date;
  final DateTime startTime;
  final DateTime endTime;
  final String service;
  final String dogSize;
  final String? notes;

  const Note({
    this.id,
    required this.petName,
    required this.ownerName,
    required this.type,
    required this.isCompleted,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.service,
    required this.dogSize,
    this.notes,
  });

  Note copy({
    int? id,
    String? petName,
    String? ownerName,
    String? type,
    bool? isCompleted,
    DateTime? date,
    DateTime? startTime,
    DateTime? endTime,
    String? service,
    String? dogSize,
    String? notes,
  }) =>
      Note(
        id: id ?? this.id,
        petName: petName ?? this.petName,
        ownerName: ownerName ?? this.ownerName,
        type: type ?? this.type,
        isCompleted: isCompleted ?? this.isCompleted,
        date: date ?? this.date,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
        service: service ?? this.service,
        dogSize: dogSize ?? this.dogSize,
        notes: notes ?? this.notes,
      );
  static Note fromJson(Map<String, Object?> json) => Note(
        id: json[NoteFields.id] as int?,
        petName: json[NoteFields.petName] as String,
        ownerName: json[NoteFields.ownerName] as String,
        type: json[NoteFields.type] as String,
        isCompleted: json[NoteFields.isCompleted] == 1,
        date: DateTime.parse(json[NoteFields.date] as String),
        startTime: DateTime.parse(json[NoteFields.startTime] as String),
        endTime: DateTime.parse(json[NoteFields.endTime] as String),
        service: json[NoteFields.service] as String,
        dogSize: json[NoteFields.dogSize] as String,
        notes: json[NoteFields.notes] as String,
  );

  Map<String, Object?> toJson() => {
        NoteFields.id: id,
        NoteFields.petName: petName,
        NoteFields.ownerName: ownerName,
        NoteFields.type: type,
        NoteFields.isCompleted: isCompleted ? 1 : 0,
        NoteFields.date: date.toIso8601String(),
        NoteFields.startTime: startTime.toIso8601String(),
        NoteFields.endTime: endTime.toIso8601String(),
        NoteFields.service: service,
        NoteFields.dogSize: dogSize,
        NoteFields.notes: notes,
      };
}
