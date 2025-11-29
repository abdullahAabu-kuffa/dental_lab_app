part of 'user_orders_cubit.dart';

abstract class UserOrdersState {
  const UserOrdersState();
}

class UserOrdersInitial extends UserOrdersState {}

class UserOrdersLoading extends UserOrdersState {}

class UserOrdersSuccess extends UserOrdersState {
  final OrdersResponse userOrdersData;

  const UserOrdersSuccess(this.userOrdersData);
}

class UserOrdersFailure extends UserOrdersState {
  final String message;

  const UserOrdersFailure(this.message);
}
