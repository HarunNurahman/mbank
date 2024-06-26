import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:bank_sha/models/payment-method_model.dart';
import 'package:bank_sha/services/payment-method_service.dart';

part 'payment_method_event.dart';
part 'payment_method_state.dart';

class PaymentMethodBloc extends Bloc<PaymentMethodEvent, PaymentMethodState> {
  PaymentMethodBloc() : super(PaymentMethodInitial()) {
    on<PaymentMethodEvent>((event, emit) async {
      if (event is PaymentMethodGet) {
        try {
          emit(PaymentMethodLoading());

          final paymentMethod = await PaymentMethodService().getPaymentMethod();

          emit(PaymentMethodSuccess(paymentMethod));
        } catch (e) {
          emit(PaymentMethodFailed(e.toString()));
        }
      }
    });
  }
}
