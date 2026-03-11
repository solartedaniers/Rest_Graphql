class Country {
  final String name;
  final String capital;
  final String currency;
  final String continent;
  final List<String> languages;

  Country({
    required this.name,
    required this.capital,
    required this.currency,
    required this.continent,
    required this.languages,
  });

  // Factory para procesar el nodo 'country' de la respuesta GraphQL
  factory Country.fromGraphQl(Map<String, dynamic> json) {
    return Country(
      name: json['name'] ?? '',
      capital: json['capital'] ?? 'No disponible',
      currency: json['currency'] ?? 'No disponible',
      continent: json['continent']['name'] ?? '',
      languages: (json['languages'] as List)
          .map((lang) => lang['name'] as String)
          .toList(),
    );
  }
}