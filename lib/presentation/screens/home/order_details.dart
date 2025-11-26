import 'package:dental_lab_app/data/models/home/orders.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; 
class OrderDetailsScreen extends StatelessWidget {
  final Order order;
  const OrderDetailsScreen({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final df = DateFormat.yMMMd().add_jm();
    return Scaffold(
      appBar: AppBar(title: Text('Order #${order.id}')),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _row('Status', order.status),
            SizedBox(height: 8),
            _row('Total Price', '\$${order.totalPrice.toStringAsFixed(2)}'),
            SizedBox(height: 8),
            _row('Invoice Id', order.invoiceId.toString()),
            SizedBox(height: 8),
            _row('Created', df.format(order.createdAt)),
            SizedBox(height: 8),
            _row('Updated', df.format(order.updatedAt)),
            SizedBox(height: 12),
            Text('Options', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 6),
            Expanded(
              child: ListView.builder(
                itemCount: order.options.length,
                itemBuilder: (_, i) {
                  final opt = order.options[i];
                  return ListTile(
                    leading: Icon(Icons.settings),
                    title: Text(opt.keys.join(', ') == '' ? 'Option ${i+1}' : opt.keys.join(', ')),
                    subtitle: Text(opt.values.join(', ')),
                  );
},
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _row(String label, String value) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(label, style: TextStyle(fontWeight: FontWeight.w600)),
      Text(value),
    ],
  );
}
