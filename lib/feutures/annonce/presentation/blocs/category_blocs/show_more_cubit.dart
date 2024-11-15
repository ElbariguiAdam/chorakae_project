import 'package:flutter_bloc/flutter_bloc.dart';

class ShowMoreCubit extends Cubit<bool> {
  ShowMoreCubit() : super(false);

  void toggleShowAll() => emit(!state);
}
