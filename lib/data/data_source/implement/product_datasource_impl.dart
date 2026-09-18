import 'package:dartz/dartz.dart';
import 'package:mm/core/network/error/failures.dart';
class ProductDataSourceImpl implements ProductDataSource {

  final ApiConsumer apiConsumer;

  ProductDataSourceImpl(this.apiConsumer);

  @override
  Future<Either<Failure, Map<String, dynamic>>> getProducts() async {
    final response = await apiConsumer.get('/products');

    return Right(response);
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> getProductDetails({
    required String productId,
  }) async {
    final response = await apiConsumer.get(
      '/products/$productId',
    );

    return Right(response);
  }
}