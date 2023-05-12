import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helpme/module/detail_article/detail_article_controller.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'inappbrowser_screen.dart';

class DetailArticleScreen extends StatelessWidget {
  const DetailArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailArticleController>(
        init: DetailArticleController(),
        builder: (DetailArticleController detailArticleController) {
          return SafeArea(
            child: Scaffold(
                appBar: AppBar(
                  title: const Text('List Data Detail'),
                ),
                body: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(detailArticleController.name,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold)),
                )),
          );
        });
  }
}
