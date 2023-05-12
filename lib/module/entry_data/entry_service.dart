import 'package:helpme/module/detail_article/model/detail_article_model.dart';
import 'package:helpme/module/network/app_network.dart';

class EntryService {
  Future<List<String>> getRepoDropdown() async {
    List<String> temp = [];
    var url =
        Uri.parse('https://trmobileapi.gadingemerald.com/tr/test/getBlokNomor');
    try {
      final res = await AppNetworkClient.get(path: url.toString());
      for (var datas in res.data['DataBlokNomor']) {
        temp.add(datas['BLOKNO']);
      }
      return temp;
    } catch (e) {
      rethrow;
    }
  }

  postDataFinal(
      {required String blokNo,
      required String lokasi,
      required String keluhan}) async {
    List<String> temp = [];
    var url = Uri.parse(
        'https://trmobileapi.gadingemerald.com/tr/test/insDataKeluhan');

    var data = {
      "blokno": blokNo,
      "lokasi": lokasi,
      "keluhan": keluhan,
    };
    try {
      final res = await AppNetworkClient.post(path: url.toString(), data: data);
      print(res.toString());
    } catch (e) {
      rethrow;
    }
  }
}
