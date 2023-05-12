import 'package:get/get.dart';
import 'package:helpme/module/home/home_service.dart';
import 'package:helpme/module/home/model/category_model.dart';

class HomeController extends GetxController with HomeService {
  List<int> finalManipulation = [];
  Map data = {
    'angka': [1, 4, -3, 20]
  };

  List<CategoryModel> category = [
    CategoryModel(
        categoryImageUrl: 'https://picsum.photos/250?image=1',
        categoryName: 'Manipulasi Elemen'),
    CategoryModel(
        categoryImageUrl: 'https://picsum.photos/250?image=2',
        categoryName: 'List Data'),
    CategoryModel(
        categoryImageUrl: 'https://picsum.photos/250?image=3',
        categoryName: 'Entry Keluhan'),
    CategoryModel(
        categoryImageUrl: 'https://picsum.photos/250?image=4',
        categoryName: 'Keluar Aplikasi'),
  ];

  dataManipultaion() {
    finalManipulation = [];
    for (int i = 0; i < data['angka'].length; i++) {
      int temp = (data['angka'][i] * 6);
      finalManipulation.add(temp);
    }
    print(finalManipulation.toString());
  }
}
