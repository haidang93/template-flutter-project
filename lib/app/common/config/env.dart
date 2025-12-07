// ignore_for_file: constant_identifier_names

/// change ENV by change this variable
Environment currentEnvironment = Environment.DEV;

enum Environment {
  PRODUCTION('production'),
  DEV('development'),
  TEST('staging'),
  LOCAL('local'),
  CUSTOM('custom');

  final String envEnum;
  const Environment(this.envEnum);

  static Environment parse(String? value) =>
      values.firstWhere((e) => e.envEnum == value, orElse: () => PRODUCTION);
}

String? customEndpoint;

String get endpoint {
  if (customEndpoint?.isNotEmpty ?? false) {
    return customEndpoint ?? 'https://live-api.example.com/';
  }
  switch (currentEnvironment) {
    case Environment.PRODUCTION:
      return 'https://live-api.example.com/';
    case Environment.DEV:
      return 'https://dev-api.example.com/';
    case Environment.TEST:
      return 'https://test-api.example.com/';
    case Environment.LOCAL:
      return 'http://10.0.2.2:3000/';
    case Environment.CUSTOM:
      return customEndpoint ?? 'https://dev-api.example.com/';
  }
}
