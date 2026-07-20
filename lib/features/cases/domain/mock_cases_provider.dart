import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'cyber_case.dart';

part 'mock_cases_provider.g.dart';

@riverpod
List<CyberCase> mockCases(MockCasesRef ref) {
  return [
    const CyberCase(
      id: 'case_1',
      title: 'The Phishing Lure',
      description: 'Investigate a suspicious email targeting high-level executives.',
      difficulty: CaseDifficulty.easy,
      questions: [],
      progressPercent: 75,
      isLocked: false,
    ),
    const CyberCase(
      id: 'case_2',
      title: 'SQL Injection Syndicate',
      description: 'Track down the database hackers exploiting web forms.',
      difficulty: CaseDifficulty.medium,
      questions: [],
      progressPercent: 0,
      isLocked: true,
    ),
    const CyberCase(
      id: 'case_3',
      title: 'Malware in the Mainframe',
      description: 'Isolate and dissect a polymorphic worm spreading in the intranet.',
      difficulty: CaseDifficulty.hard,
      questions: [],
      progressPercent: 0,
      isLocked: true,
    ),
  ];
}
