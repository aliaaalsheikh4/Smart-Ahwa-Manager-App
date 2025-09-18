import 'package:flutter/material.dart';

class AddOrderView extends StatefulWidget {
  final Function(String, String, String) onAdd;
  
  AddOrderView({required this.onAdd});
  
  @override
  _AddOrderViewState createState() => _AddOrderViewState();
}

class _AddOrderViewState extends State<AddOrderView> {
  final customerController = TextEditingController();
  final notesController = TextEditingController();
  String selectedDrink = 'shai';
  
  List<String> drinks = ['shai', 'Turkish coffee', ' hibiscus tea', 'extra mint','ya rais'];
  
  void addOrder() {
    if (customerController.text.isNotEmpty) {
      widget.onAdd(customerController.text, selectedDrink, notesController.text);
      customerController.clear();
      notesController.clear();
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            controller: customerController,
            decoration: InputDecoration(labelText: 'customer name'),
          ),
          SizedBox(height: 20),
          DropdownButton<String>(
            value: selectedDrink,
            items: drinks.map((d) => DropdownMenuItem(value: d, child: Text(d))).toList(),
            onChanged: (d) => setState(() => selectedDrink = d!),
            isExpanded: true,
          ),
          SizedBox(height: 20),
          TextField(
            controller: notesController,
            decoration: InputDecoration(labelText: 'Notes'),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: addOrder,
            child: Text('addOrder'),
          ),
        ],
      ),
    );
  }
}