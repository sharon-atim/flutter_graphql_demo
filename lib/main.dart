import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() async {
// Initializes Hive for storing the cached persist data.
  await initHiveForFlutter();
// Http link implementation
  final HttpLink httpLink = HttpLink('https://api.github.com/graphql');

//Header based authentication that adds a getToken authentication callback.
  final AuthLink authLink = AuthLink(
    getToken: () async => 'Bearer <YOUR_PERSONAL_ACCESS_TOKEN>',
//OR
// getToken; () => Bearer <YOUR_PERSONAL_ACCESS_TOKEN>
  );

// The authLink is concatenated with httpLink to attach the github access token.
  final Link link = authLink.concat(httpLink);

  ValueNotifier<GraphQLClient> client = ValueNotifier(GraphQLClient(
    link: link,
    cache: GraphQLCache(store: HiveStore()),
  ));
}
