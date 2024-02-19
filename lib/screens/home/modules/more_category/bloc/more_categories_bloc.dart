import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'more_categories_event.dart';
part 'more_categories_state.dart';

class MoreCategoriesBloc
    extends Bloc<MoreCategoriesEvent, MoreCategoriesState> {
  MoreCategoriesBloc() : super(MoreCategoriesInitial()) {
    on<MoreCategoriesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
