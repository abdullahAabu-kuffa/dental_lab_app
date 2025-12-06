import 'package:bloc/bloc.dart';
import 'package:dental_lab_app/data/models/home/order_response.dart';
import 'package:dental_lab_app/data/services/api_services.dart';
part 'user_orders_state.dart';

class UserOrdersCubit extends Cubit<UserOrdersState> {
  final ApiServices userOrdersService;

  UserOrdersCubit(this.userOrdersService) : super(UserOrdersInitial());

  Future<void> fetchUserOrders() async {
    emit(UserOrdersLoading());

    try {
      // final OrderResponse? cachedUserOrders = CachHelper.getUserOrders();
      // if (cachedUserOrders != null) {
      //   emit(UserOrdersSuccess(cachedUserOrders));
      //   return;
      // }
      final OrderResponse userOrders = await userOrdersService
          .fetchUserOrders();
      //await CachHelper.setUserOrdersData(userOrders);

      emit(UserOrdersSuccess(userOrders));
    } catch (e) {
      emit(UserOrdersFailure(e.toString()));
    }
  }
}
