class ItemsModels {
  ItemsModels({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.dateTime,
  });
  final String id;
  final String title;
  final String imageUrl;
  final DateTime dateTime;

  String daysLeft() {
    return dateTime.difference(DateTime.now()).inDays.toString();
  }
}
