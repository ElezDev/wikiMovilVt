import 'package:bloc/bloc.dart';
import 'package:get_storage/get_storage.dart';

part 'type_user_state.dart';

class TypeUserCubit extends Cubit<TypeUserState> {
  TypeUserCubit() : super(TypeUserInitial());

  Future typeUser() async {
    // String type = GetStorage().read('typeUser');
    // emit(UserType(type));
  }
}
