import 'package:hive/hive.dart';

import 'home_model.dart';
part 'recent_search_model.g.dart';

@HiveType(typeId: 0)
class RecentSearch extends HiveObject {
  @HiveField(0)
  late String searchKeyword;
  @HiveField(1)
  late List<Result>? results;

  RecentSearch(this.searchKeyword, this.results);
}
