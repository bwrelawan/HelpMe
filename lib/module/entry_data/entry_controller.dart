import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helpme/module/detail_article/model/detail_article_model.dart';

import 'entry_service.dart';

class EntryDataController extends GetxController with EntryService {
  bool isLoadingDetail = false;
  String name = "";
  String? error;

  List<String> listBlokNo = [];
  List<String> listLokasi = [
    'Ruang Tamu',
    'Kamar Mandi',
    'Kamar Tidur',
    'Balkon'
  ];

  String? dropdownBlokNo;
  String? dropdownLokasi;

  TextEditingController textController = TextEditingController();

  @override
  void onInit() {
    getDataDropdown();
    textController.addListener(printTextFieldValue);
    super.onInit();
  }

  void printTextFieldValue() {
    print('Second text field: ${textController.text}');
  }

  getDataDropdown() async {
    try {
      final res = await getRepoDropdown();
      listBlokNo.addAll(res);
      update();
    } on DioError catch (e) {
      error = e.response?.data['message'];
      // isLoadingListCategory = false;
      update();
    } catch (e) {
      error = e.toString();
      // isLoadingListCategory = false;
      update();
    }

    update();
  }

  postData() async {
    final res = await postDataFinal(
        blokNo: dropdownBlokNo ?? "",
        lokasi: dropdownLokasi ?? "",
        keluhan: textController.text);
    print(res);
  }
}
