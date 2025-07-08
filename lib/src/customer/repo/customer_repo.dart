import 'package:either_dart/either.dart';

import '../../../data/remote/network_base_services.dart';
import '../../services/model/oodo_model.dart';
import '../model/brand_model.dart';
import '../model/customer_list_model.dart';
import '../model/garage_model.dart';
import '../model/vehicle_model.dart';

abstract class CustomerRepo {
  Future<Either<ResponseError, dynamic>> addCustomer(
      {required Map<String, dynamic> params});

  Future<Either<ResponseError, BrandsModel>> getCarBrands();

  Future<Either<ResponseError, VehicleModel>> getCarModel(
      {required String brandId});

  Future<Either<ResponseError, GarageModel>> getGarages();

  Future<Either<ResponseError, OodoModel>> getOodoReading(
      {required int customerID});

  Future<Either<ResponseError, CustomerListModel>> getCustomerList({
    required String query,
    required int nextPage,
  });
}
