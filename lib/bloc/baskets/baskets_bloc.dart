import 'dart:async';
import 'dart:collection';

import 'package:baskets_repository/baskets_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'baskets_event.dart';
part 'baskets_state.dart';

class BasketsBloc extends Bloc<BasketsEvent, BasketsState> {
  final FirebaseBasketsRepository _firebaseBasketsRepository;
  StreamSubscription<List<Basket>>? _streamSubscription;

  BasketsBloc({required FirebaseBasketsRepository firebaseBasketsRepository})
      : this._firebaseBasketsRepository = firebaseBasketsRepository,
        super(BasketsLoadInProgress());

  @override
  Stream<BasketsState> mapEventToState(
    BasketsEvent event,
  ) async* {
    if (event is BasketsLoaded)
      yield* _mapBasketsLoadedToState(event);
    else if(event is BasketsUpdated)
      yield* _mapBasketsUpdatedToState(event);
    else if(event is BasketAdded)
      yield* _mapBasketAddedToState(event);
    else if(event is BasketUpdated)
      yield* _mapBasketUpdatedToState(event);
    else if(event is BasketDeleted)
      yield* _mapBasketDeletedToState(event);
  }

  Stream<BasketsState> _mapBasketsLoadedToState(BasketsLoaded event) async* {
    _streamSubscription?.cancel();
    _streamSubscription = _firebaseBasketsRepository.baskets().listen((baskets) {
      add(BasketsUpdated(baskets));
    });
  }

  Stream<BasketsState> _mapBasketsUpdatedToState(BasketsUpdated event) async* {
    yield BasketsLoadSuccess(event.baskets);
  }

  Stream<BasketsState> _mapBasketAddedToState(BasketAdded event) async* {
    _firebaseBasketsRepository.addBasket(event.basket);
  }

  Stream<BasketsState> _mapBasketUpdatedToState(BasketUpdated event) async* {
    _firebaseBasketsRepository.updateBasket(event.basket);
  }

  Stream<BasketsState> _mapBasketDeletedToState(BasketDeleted event) async* {
    _firebaseBasketsRepository.deleteBasket(event.basket);
  }
}
