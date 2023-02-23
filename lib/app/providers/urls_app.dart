/// All config for app
abstract class UrlsApp {
  static const String apiGoogleSearch =
      // "https://www.googleapis.com/customsearch/v1?key=AIzaSyAeb4wdROc-lBoKnzo6IKZAw0kyk4SEY34&cx=016496445636816056556:qvzl4ib4xtb&imgSize=MEDIUM&g1=pt-BR&h1=pt-BR&cr=pt-BR&imgType=photo";

      'https://www.googleapis.com/customsearch/v1?key=AIzaSyCn48jItp_-1pyWprC_C2V1mTHcFfJs4-0&cx=016496445636816056556:qvzl4ib4xtb&imgSize=MEDIUM&g1=pt-BR&h1=pt-BR&cr=pt-BR&imgType=photo';

  static const String urlServer = "http://167.172.153.74";
  // static const String urlRabbitMQApi = "http://167.172.153.74:15672/api/";
  static const String urlRabbitMQApi =
      "https://rabbitmq.housedevs.com.br/api/"; //https://rabbitmq.housedevs.com.br/
  static const String urlNodeJSRabbitMQ = "http://167.172.153.74:3333/";
  // static const String urlGraphql =      'https://api-hasura.housedevs.com.br/v1/graphql';
  static const String urlGraphql = 'http://167.172.153.74:8080/v1/graphql';
  static const String urlBrasilApi = 'https://brasilapi.com.br/api/cnpj/v1/';
}
