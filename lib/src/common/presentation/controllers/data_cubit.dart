import 'package:equatable/equatable.dart';
import 'package:mozz/src/common/presentation/controllers/lazy_load_operation.dart';
import 'package:mozz/src/common/presentation/controllers/load_operation.dart';
import 'package:mozz/src/common/presentation/controllers/reload_operation.dart';
import 'package:mozz/src/common/presentation/controllers/data_states.dart';
import 'package:mozz/src/common/presentation/controllers/safe_cubit.dart';

abstract class DataCubit<T extends Equatable, P extends Equatable>
    extends SafeCubit<DataState<T>>
    with LoadOperation<T, P>, ReloadOperation<T, P>, LazyLoadOperation<T, P> {
  DataCubit() : super(NotLoadedState<T>());

  void reset() {
    emit(NotLoadedState<T>());
  }
}
