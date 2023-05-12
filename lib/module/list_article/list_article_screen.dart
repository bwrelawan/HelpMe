import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helpme/module/list_article/list_article_controller.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../route/route_constant.dart';

class ListArticleScreen extends StatelessWidget {
  const ListArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ListArticleController>(
        init: ListArticleController(),
        builder: (ListArticleController listArticleController) {
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: Text('List Data'),
              ),
              body: listArticleController.isLoadingListCategory
                  ? Center(
                      child: Container(
                        child: LoadingAnimationWidget.flickr(
                          leftDotColor: const Color(0xFF0063DC),
                          rightDotColor: const Color(0xFFFF0084),
                          size: 100,
                        ),
                      ),
                    )
                  : listArticleController.error != null
                      ? const Center(
                          child: Text('Data not found'),
                        )
                      : ListView.builder(
                          itemCount: listArticleController.article.length,
                          itemBuilder: (c, index) {
                            return InkWell(
                              onTap: () {
                                Get.toNamed(RouteConstant.detailArticle,
                                    preventDuplicates: false,
                                    parameters: {
                                      "name":
                                          listArticleController.article[index]
                                    });
                              },
                              child: Container(
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    listArticleController.article[index],
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  )),
                            );
                          },
                        ),
            ),
          );
        });
  }
}
