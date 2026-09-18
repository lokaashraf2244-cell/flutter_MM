import 'package:flutter_bloc/flutter_bloc.dart';
import '../../product_service.dart';
import 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductService productService;

  ProductCubit(this.productService) : super(ProductInitialState());

  Future<void> fetchProducts() async {
    emit(ProductLoadingState());

    try {
      final products = await productService.getProducts();
      emit(ProductSuccessState(products));
    } catch (e) {
      emit(ProductFailureState(e.toString()));
    }
  }
}