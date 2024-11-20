part of 'add_image_cubit.dart';

class AddImageState extends Equatable {
  final XFile? image;
  const AddImageState({required this.image});

  @override
  List<Object?> get props => [image];
}
