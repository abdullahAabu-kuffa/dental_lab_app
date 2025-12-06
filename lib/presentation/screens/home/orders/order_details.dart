import 'package:dental_lab_app/data/models/home/order_response.dart';
import 'package:dental_lab_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderDetailsScreen extends StatelessWidget {
  final Order order;
  const OrderDetailsScreen({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final df = DateFormat.yMMMd().add_jm();
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Order #${order.id}'),
        centerTitle: true,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _infoCard(context, [
              _row(
                Icons.info,
                S.of(context).status,
                Chip(
                  label: Text(order.status),
                  backgroundColor: order.status == 'COMPLETED'
                      ? Colors.green
                      : order.status == 'IN_PROGRESS' ||
                            order.status == 'PENDING'
                      ? Colors.orange
                      : Colors.red,
                ),
              ),
              _row(
                Icons.person_outline_outlined,
                S.of(context).patientname,
                Text(order.options.patientName),
              ),
              _row(
                Icons.attach_money,
                S.of(context).totalprice,
                Text(
                  '\$${order.totalPrice.toStringAsFixed(2)}',
                  style: theme.textTheme.titleMedium!.copyWith(
                    color: Colors.green.shade700,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              _row(
                Icons.receipt_long,
                S.of(context).invoiceId,
                Text(order.invoiceId.toString()),
              ),
              _row(
                Icons.calendar_today,
                S.of(context).Created,
                Text(df.format(order.createdAt)),
              ),
              _row(Icons.update, S.of(context).Updated, Text(df.format(order.updatedAt))),
            ]),
            const SizedBox(height: 20),
            Text(
              S.of(context).options,
              style: theme.textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: order.options.selectedServices.length,
              separatorBuilder: (_, __) => const Divider(),
              itemBuilder: (_, i) {
                final service = order.options.selectedServices[i];
                return ExpansionTile(
                  leading: const Icon(Icons.settings),
                  title: Text(service.label),
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            service.label,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Text(
                            '\$${service.price.toStringAsFixed(2)}',
                            style: Theme.of(context).textTheme.bodyLarge!
                                .copyWith(
                                  color: Colors.green.shade700,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoCard(BuildContext context, List<Widget> children) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: children
              .map(
                (child) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: child,
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  Widget _row(IconData icon, String label, Widget value) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          Icon(icon, size: 20, color: Colors.grey.shade700),
          const SizedBox(width: 8),
          Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
      value,
    ],
  );
}
