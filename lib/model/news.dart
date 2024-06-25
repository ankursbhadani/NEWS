class News {
  final String imageUrl;
  final String heading;
  final String source;
  final DateTime publishTime;

  News({
    required this.imageUrl,
    required this.heading,
    required this.source,
    required this.publishTime,
  });

  String timeFromNow() {
    Duration difference = DateTime.now().difference(publishTime);
    if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }
}