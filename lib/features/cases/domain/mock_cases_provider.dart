import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'cyber_case.dart';
import 'case_question.dart';

part 'mock_cases_provider.g.dart';

@riverpod
List<CyberCase> mockCases(MockCasesRef ref) {
  return [
    const CyberCase(
      id: 'case_1',
      title: 'The Phishing Lure',
      description: 'Investigate a suspicious email targeting high-level executives.',
      difficulty: CaseDifficulty.easy,
      questions: [
        CaseQuestion(
          id: 'q1',
          questionText: 'Target received a suspicious communication. Review the extracted header segment below to identify the primary indicator of spoofing.',
          evidenceSnippet: 'Received: from mail.trusted-bank.com (unknown [192.168.1.105])\nby mx.target-corp.com with ESMTP id 1A2B3C4D\nfor <ceo@target-corp.com>; Fri, 13 Oct 2023 09:12:45 -0400\nFrom: "Security Update" <admin@trusted-bank.com>\nSubject: URGENT: Account Verification Required',
          options: [
            'The "From" address does not match the return path.',
            'The sender IP (192.168.1.105) is a private internal address.',
            'The subject line contains "URGENT".',
            'The email was received on Friday the 13th.'
          ],
          correctAnswerIndex: 1,
          xpReward: 50,
        )
      ],
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
