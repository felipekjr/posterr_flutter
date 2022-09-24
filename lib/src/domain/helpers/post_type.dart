enum PostType {
  normal(label: 'Post'),
  repost(label: 'Repost'),
  quote(label: 'Quote-post');

  final String label;

  const PostType({required this.label});
}