class HomeCardModel {
  final String svg;
  final String title;
  final int key;
  int? count;

  HomeCardModel({
    required this.title,
    required this.key,
    this.count,
    required this.svg,
  });
}
