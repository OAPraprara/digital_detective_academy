import 'case_question.dart';

enum CaseDifficulty { easy, medium, hard }

class CyberCase {
  final String id;
  final String title;
  final String description;
  final CaseDifficulty difficulty;
  final List<CaseQuestion> questions;
  final bool isCompleted;

  const CyberCase({
    required this.id,
    required this.title,
    required this.description,
    required this.difficulty,
    required this.questions,
    this.isCompleted = false,
  });

  CyberCase copyWith({
    String? id,
    String? title,
    String? description,
    CaseDifficulty? difficulty,
    List<CaseQuestion>? questions,
    bool? isCompleted,
  }) {
    return CyberCase(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      difficulty: difficulty ?? this.difficulty,
      questions: questions ?? this.questions,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  @override
  String toString() {
    return 'CyberCase(id: $id, title: $title, description: $description, difficulty: $difficulty, questions: $questions, isCompleted: $isCompleted)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CyberCase &&
        other.id == id &&
        other.title == title &&
        other.description == description &&
        other.difficulty == difficulty &&
        other.isCompleted == isCompleted;
  }

  @override
  int get hashCode {
    return Object.hash(id, title, description, difficulty, isCompleted);
  }
}
