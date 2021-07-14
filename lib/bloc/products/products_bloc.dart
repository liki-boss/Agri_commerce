import 'dart:async';
import 'dart:collection';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:products_repository/products_repository.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductsRepository _productsRepository;
  StreamSubscription<List<Product>>? _streamSubscription;

  ProductsBloc({required ProductsRepository productsRepository})
      : _productsRepository = productsRepository,
        super(ProductsLoadInProgress());

  @override
  Stream<ProductsState> mapEventToState(
    ProductsEvent event,
  ) async* {
    if (event is ProductsLoaded)
      yield* _mapProductsLoadedToState(event);
    else if (event is ProductsUpdated) yield* _mapProductsUpdatedToState(event);
  }

  Stream<ProductsState> _mapProductsLoadedToState(ProductsLoaded event) async* {
    _streamSubscription?.cancel();
    _streamSubscription = _productsRepository.products().listen((products) {
      add(ProductsUpdated(products));
    });
  }

  Stream<ProductsState> _mapProductsUpdatedToState(
      ProductsUpdated event) async* {
    yield ProductsLoadSuccess(event.products);
  }
}
