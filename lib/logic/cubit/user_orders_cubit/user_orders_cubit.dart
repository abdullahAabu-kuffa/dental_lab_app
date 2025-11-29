import 'package:bloc/bloc.dart';
import 'package:dental_lab_app/core/helpers/cach_helper.dart';
import 'package:dental_lab_app/data/models/home/orders_response.dart';
import 'package:dental_lab_app/data/services/api_services.dart';
part 'user_orders_state.dart'; 

class UserOrdersCubit extends Cubit<UserOrdersState> {
  final ApiServices userOrdersService;

  UserOrdersCubit(this.userOrdersService) : super(UserOrdersInitial());

  Future<void> fetchUserOrders() async {
    emit(UserOrdersLoading());

    try {
      final OrdersResponse? cachedUserOrders = CachHelper.getUserOrders();
      if (cachedUserOrders != null) {
        emit(UserOrdersSuccess(cachedUserOrders));
        return;
      }
      final OrdersResponse userOrders = await userOrdersService
          .fetchUserOrders();
      await CachHelper.setUserOrdersData(userOrders);

      CachHelper.setUser(userOrders.data.toJson());
      emit(UserOrdersSuccess(userOrders));
    } catch (e) {
      emit(UserOrdersFailure(e.toString()));
    }
  }
}
