import 'package:equatable/equatable.dart';
import 'package:mozz/src/common/domain/entities/paginator.dart';

class Collection<T> extends Equatable {

  final Paginator paginator;
  final List<T> data;

  const Collection({
    required this.paginator,
    required this.data,
  });

  Collection<T> merge(Collection<T> collection) => Collection<T>(
    data: List.from(data)..addAll(collection.data),
    paginator: paginator.merge(collection.paginator),
  );

  @override
  List<Object?> get props => [
    paginator,
    data,
  ];
}
