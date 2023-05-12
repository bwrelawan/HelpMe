import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:helpme/module/home/model/news_model.dart';
import 'package:helpme/module/list_article/list_article_service.dart';

class ListArticleController extends GetxController with ListArticleService {
  bool isLoadingListCategory = false;
  List<String> article = [];
  String? error;

  @override
  void onInit() {
    getListArticle();

    super.onInit();
  }

  getListArticle() async {
    try {
      article = [];
      isLoadingListCategory = true;
      update();

      final res = await getRepoListArticle();
      print(res.toString());
      article.addAll(res);

      isLoadingListCategory = false;
      update();
    } on DioError catch (e) {
      error = e.response?.data['message'];
      isLoadingListCategory = false;
      update();
    } catch (e) {
      error = e.toString();
      isLoadingListCategory = false;
      update();
    }

    update();
  }
}
