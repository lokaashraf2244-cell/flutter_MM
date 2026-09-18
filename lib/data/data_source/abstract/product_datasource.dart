import 'package:dartz/dartz.dart';
import '/core/network/error/failures.dart';

abstract class ProductDataSource {

  Future<Either<Failure, Map<String, dynamic>>> getProducts();

  Future<Either<Failure, Map<String, dynamic>>> getProductDetails({
    required String productId,
  });

}