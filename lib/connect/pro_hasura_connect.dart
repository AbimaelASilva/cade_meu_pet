import 'package:hasura_connect/hasura_connect.dart';

import '../app/providers/urls_app.dart';

class ProHasuraConnect {
  HasuraConnect get proHasuraConnect {
    //String url = 'https://api.housedevs.com.br/v1/graphql';
    return HasuraConnect(UrlsApp.urlGraphql, headers: {
      'x-hasura-admin-secret': 'houarzmainsegres',
      'Content-Type': 'application/json',
      'Hasura-Client-Name': 'hasura-console',
    });
  }
}
