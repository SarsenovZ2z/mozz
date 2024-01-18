import 'package:equatable/equatable.dart';

class Paginator extends Equatable {
  final String? nextUrl;
  final String? prevUrl;
  final String? firstUrl;
  final String? lastUrl;

  final int currentPage;
  final int lastPage;
  final int perPage;
  final int total;
  final int from;
  final int to;

  const Paginator({
    required this.nextUrl,
    required this.prevUrl,
    required this.firstUrl,
    required this.lastUrl,
    required this.currentPage,
    required this.lastPage,
    required this.perPage,
    required this.total,
    required this.from,
    required this.to,
  });

  Paginator merge(Paginator paginator) => Paginator(
        total: paginator.total,
        perPage: paginator.perPage,
        currentPage: paginator.currentPage,
        lastPage: paginator.lastPage,
        from: from,
        to: paginator.to,
        nextUrl: paginator.nextUrl,
        prevUrl: prevUrl,
        firstUrl: firstUrl,
        lastUrl: paginator.lastUrl,
      );

  bool get isLastPage => currentPage == lastPage;

  bool get isNotLastPage => !isLastPage;

  bool get isEmpty => total <= 0;

  bool get isNotEmpty => !isEmpty;

  @override
  List<Object?> get props => [
        nextUrl,
        prevUrl,
        firstUrl,
        lastUrl,
        currentPage,
        lastPage,
        perPage,
        total,
        from,
        to,
      ];
}
