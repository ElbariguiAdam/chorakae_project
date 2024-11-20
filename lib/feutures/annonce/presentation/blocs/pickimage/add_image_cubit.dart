import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'add_image_state.dart';

class AddImageCubit extends Cubit<AddImageState> {
  final ImagePicker imagePicker;
  AddImageCubit(
    this.imagePicker,
  ) : super(const AddImageState(image: null));

  void pickImage() async {
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage == null) {
      return;
    }
    emit(AddImageState(image: pickedImage));
  }

  void pickImagefromCamera() async {
    final pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      emit(AddImageState(image: pickedImage));
    }
  }

  void removeImage() => emit(
        const AddImageState(image: null),
      );
}
