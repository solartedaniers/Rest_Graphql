import 'package:graphql_flutter/graphql_flutter.dart';
import '../models/country_model.dart';

class GraphQlService {
  // Configuración del cliente
  static final HttpLink _httpLink = HttpLink(
    'https://countries.trevorblades.com/',
  );

  final GraphQLClient _client = GraphQLClient(
    link: _httpLink,
    // Usamos memoria para el caché en este ejemplo
    cache: GraphQLCache(store: InMemoryStore()),
  );

  // Método para obtener la información de Colombia
  Future<Country> getCountryInfo(String code) async {
    // Definición de la Query (usando el modelo que pediste)
    const String countryQuery = r'''
      query GetCountry($code: ID!) {
        country(code: $code) {
          name
          capital
          currency
          languages {
            name
          }
          continent {
            name
          }
        }
      }
    ''';

    final QueryOptions options = QueryOptions(
      document: gql(countryQuery),
      variables: {
        'code': code,
      },
    );

    final QueryResult result = await _client.query(options);

    if (result.hasException) {
      throw Exception('Error en GraphQL: ${result.exception.toString()}');
    }

    if (result.data == null || result.data!['country'] == null) {
      throw Exception('No se encontró información del país');
    }

    return Country.fromGraphQl(result.data!['country']);
  }
}