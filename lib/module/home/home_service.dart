import 'package:helpme/module/home/model/home_model.dart';
import 'package:helpme/module/network/app_network.dart';

class HomeService {
  Future<List<Result>> getNearbyPlace(
      {required double lat,
      required double long,
      required String typeArea,
      String? keyword}) async {
    String apiKey = "APIKEY";
    var url = Uri.parse(
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=' +
            lat.toString() +
            ',' +
            long.toString() +
            '&radius=' +
            1500.toString() +
            '&keyword=$keyword' +
            '&type=$typeArea' +
            '&key=' +
            apiKey);
    try {
      final res = await AppNetworkClient.get(path: url.toString());
      return List<Result>.from(
          res.data['results'].map((e) => Result.fromJson(e)));
    } catch (e) {
      rethrow;
    }
  }
}
