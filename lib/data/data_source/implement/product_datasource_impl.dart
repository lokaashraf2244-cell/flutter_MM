import 'package:dartz/dartz.dart';
import 'package:mm/core/network/api/api_consumer.dart';
import 'package:mm/core/network/error/failures.dart';
import 'package:mm/data/data_source/abstract/product_datasource.dart';

class ProductDataSourceImpl implements ProductDataSource {
  final ApiConsumer apiConsumer;

  ProductDataSourceImpl(this.apiConsumer);

  @override
  Future<Either<Failure, Map<String, dynamic>>> getProducts() async {
    final response = await apiConsumer.get(path: '/products');

    return response.fold(
          (failure) => Left(failure),
          (data) => Right(data),
    );  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> getProductDetails({
    required String productId,
  }) async {
    final response =
    await apiConsumer.get(path: '/products/$productId');

    return response.fold(
          (failure) => Left(failure),
          (data) => Right(data),
    );
  }
}