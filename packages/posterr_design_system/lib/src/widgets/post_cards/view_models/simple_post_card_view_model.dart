class SimplePostCardViewModel {
  final String postId;
  final String date;
  final String text;
  final String author;
  final bool showFooter;

  SimplePostCardViewModel({
    required this.postId,
    required this.date,
    required this.text,
    required this.author,
    required this.showFooter,
  });
}
