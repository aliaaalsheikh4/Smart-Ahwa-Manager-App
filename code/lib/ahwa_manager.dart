import 'package:flutter/material.dart';
import 'package:project1/view/add_orders_view.dart';
import 'package:project1/view/order_view.dart';
import 'package:project1/services/orders_servecis.dart';
import 'package:project1/reports_view';

class AhwaManager extends StatefulWidget {
  @override
  _AhwaManagerState createState() => _AhwaManagerState();
}

class _AhwaManagerState extends State<AhwaManager> {
  final OrderService orderService = OrderService();
  int currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AhwaManager'), backgroundColor: Colors.brown),
      body: [
        OrdersView(
          orders: orderService.pendingOrders,
          onComplete: (order) {
            setState(() {
              orderService.completeOrder(order);
            });
          },
        ),
        AddOrderView(
          onAdd: (customer, drink, notes) {
            setState(() {
              orderService.addOrder(customer, drink, notes);
            });
          },
        ),
        ReportsView(
          totalOrders: orderService.allOrders.length,
          drinkStats: orderService.drinkStats,
        ),
      ][currentTab],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentTab,
        onTap: (i) => setState(() => currentTab = i),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Orders'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Reports'),
        ],
      ),
    );
  }
}