class CustomerReview {
  final String name;
  final String review;
  final String date;

  CustomerReview({required this.name, required this.review, required this.date});

  factory CustomerReview.fromMap(Map<String, dynamic> map) {
    return CustomerReview(
      name: map['name'],
      review: map['review'],
      date: map['date'],
    );
  }
}