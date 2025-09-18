import 'package:flutter/material.dart';
import 'package:project1/models/orders.dart';

class OrdersView extends StatelessWidget {
  final List<Order> orders;
  final Function(Order) onComplete;
  
  OrdersView({required this.orders, required this.onComplete});
  
  @override
  Widget build(BuildContext context) {
    return orders.isEmpty
        ? Center(child: Text('None'))
        : ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, i) {
              var order = orders[i];
              return Card(
                child: ListTile(
                  title: Text('${order.customer} - ${order.drink}'),
                  subtitle: order.notes.isNotEmpty ? Text(order.notes) : null,
                  trailing: ElevatedButton(
                    onPressed: () => onComplete(order),
                    child: Text('Done'),
                  ),
                ),
              );
            },
          );
  }
}
