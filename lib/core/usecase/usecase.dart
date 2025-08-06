import 'package:flutter_skeleton/utils/typedef.dart';

mixin UseCaseWithParams<Type, Params> {
  ResultFuture<Type> call(Params params);
}

mixin UseCaseWithoutParams<Type> {
  ResultFuture<Type> call();
}
