import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:restaurant_app/data/api/api_services.dart';
import 'package:restaurant_app/data/response/list_response.dart';
import 'package:restaurant_app/provider/home/home_list_provider.dart';
import 'package:restaurant_app/static/list_result_state.dart';

import 'provider_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late HomeListProvider homeListProvider;
  late ApiService apiService;
  late MockClient mockClient;

  setUp(() {
    apiService = ApiService();
    homeListProvider = HomeListProvider(apiService);
    mockClient = MockClient();
    apiService = ApiService(client: mockClient);
  });

  test("state should be defined in the beginning", () {
    final initState = homeListProvider.resultState;
    const listNoneState = TypeMatcher<ListNoneState>();

    expect(initState, listNoneState);
  });

  test("should return list of restaurant after fetching data from API",
          () async {

        final dummyResponse = http.Response(
            '''
              {
          "error": false,
          "message": "success",
          "count": 20,
          "restaurants": [
              {
                  "id": "rqdv5juczeskfw1e867",
                  "name": "Melting Pot",
                  "description": "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. ...",
                  "pictureId": "14",
                  "city": "Medan",
                  "rating": 4.2
              },
              {
                  "id": "s1knt6za9kkfw1e867",
                  "name": "Kafe Kita",
                  "description": "Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. ...",
                  "pictureId": "25",
                  "city": "Gorontalo",
                  "rating": 4
              }
          ]
        }
        ''',
            200);

        when(mockClient.get(Uri.parse('https://restaurant-api.dicoding.dev/list')))
            .thenAnswer((_) async => dummyResponse);

        final result = await apiService.getRestaurantList();
        expect(result, isA<ListResponse>());
      }
      );

  test("should return error and throw exception if response is error", () async {
    final dummyErrorResponse = http.Response('''
  {
    "error" : true,
    "message" : "Failed to load data"
  }
  ''', 500);

    when(mockClient.get(Uri.parse("https://restaurant-api.dicoding.dev/list")))
        .thenAnswer((_) async => dummyErrorResponse);


    expect(() async => await apiService.getRestaurantList(), throwsA(isA<Exception>()));
  });
}
