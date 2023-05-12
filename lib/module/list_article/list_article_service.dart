import 'package:helpme/module/home/model/news_model.dart';
import 'package:helpme/module/network/app_network.dart';

class ListArticleService {
  Future<List<String>> getRepoListArticle() async {
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
}
