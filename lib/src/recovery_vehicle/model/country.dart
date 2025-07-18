class Country {
  final String name;
  final String code;
  final String dialCode;
  final String flag;

  Country(
      {required this.name,
      required this.code,
      required this.dialCode,
      required this.flag});
}

List<Country> countries = [
  Country(name: 'India', code: 'IN', dialCode: '+91', flag: '🇮🇳'),
  Country(
      name: 'United Arab Emirates', code: 'AE', dialCode: '+971', flag: '🇦🇪'),
  Country(name: 'Qatar', code: 'QA', dialCode: '+974', flag: '🇶🇦'),
  Country(name: 'Oman', code: 'OM', dialCode: '+968', flag: '🇴🇲'),
  Country(name: 'United Kingdom', code: 'GB', dialCode: '+44', flag: '🇬🇧'),
  Country(name: 'Pakistan', code: 'PK', dialCode: '+92', flag: '🇵🇰'),
];
