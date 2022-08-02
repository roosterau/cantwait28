import 'package:bloc/bloc.dart';
import 'package:cantwait28/items_models/items_models.dart';
import 'package:cantwait28/repositories/items_repository.dart';
part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit(this._itemsRepository)
      : super(DetailsState(
          itemModel: null,
        ));

  final ItemsRepository _itemsRepository;

  Future<void> getItemWithID(String id) async {
    final itemModel = await _itemsRepository.get(id: id);

    emit(DetailsState(itemModel: itemModel));
  }
}
