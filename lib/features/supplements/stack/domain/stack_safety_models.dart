enum StackAdviceLevel { okay, separate, review, avoid }

enum StackPatientFlag {
  warfarin,
  levothyroxine,
  tetracyclineOrQuinolone,
  renalImpairment,
  pregnancyOrPlanning,
  sensitiveGut,
}

class StackItem {
  const StackItem({
    required this.id,
    required this.name,
    required this.group,
  });

  final String id;
  final String name;
  final String group;
}

class StackPairRule {
  const StackPairRule({
    required this.a,
    required this.b,
    required this.level,
    required this.message,
  });

  final String a;
  final String b;
  final StackAdviceLevel level;
  final String message;
}

class StackFlagRule {
  const StackFlagRule({
    required this.flag,
    required this.itemIds,
    required this.level,
    required this.message,
  });

  final StackPatientFlag flag;
  final Set<String> itemIds;
  final StackAdviceLevel level;
  final String message;
}

class StackAdvice {
  const StackAdvice({
    required this.level,
    required this.message,
  });

  final StackAdviceLevel level;
  final String message;
}
