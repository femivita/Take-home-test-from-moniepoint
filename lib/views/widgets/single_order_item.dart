import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:take_home_test/constants/color.dart';
import 'package:take_home_test/views/widgets/text_action.dart';
import '../../constants/enums/yes_no.dart';
import '../../models/order_item.dart';
import '../../providers/orders.dart';
import '../../resources/font_manager.dart';
import '../../resources/styles_manager.dart';
import 'package:intl/intl.dart';

class SingleOrderItem extends StatefulWidget {
  const SingleOrderItem({
    super.key,
    required this.id,
    required this.totalAmount,
    required this.date,
    required this.orders,
  });

  final String id;
  final double totalAmount;
  final DateTime date;
  final OrderItem orders;

  @override
  State<SingleOrderItem> createState() => _SingleOrderItemState();
}

class _SingleOrderItemState extends State<SingleOrderItem> {
  var _isExpanded = false;



  @override
  Widget build(BuildContext context) {
    return Dismissible(
      confirmDismiss: (direction) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          elevation: 3,
          title: Text(
            'Are you sure?',
            style: getMediumStyle(
              color: Colors.black,
              fontSize: FontSize.s18,
            ),
          ),
          content: Text(
            'Do you want to remove items with \$${widget.totalAmount} from order?',
            style: getRegularStyle(
              color: Colors.black,
              fontSize: FontSize.s14,
            ),
          ),
          actions: [
            textAction('Yes', YesNo.yes,context),
            textAction('No', YesNo.no,context),
          ],
        ),
      ),
      key: ValueKey(widget.id),
      onDismissed: (direction) =>
          Provider.of<Orders>(context, listen: false).removeOrder(widget.id),
      direction: DismissDirection.endToStart,
      background: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.red,
        ),
        alignment: Alignment.centerRight,
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            Icons.delete,
            size: 30,
            color: Colors.white,
          ),
        ),
      ),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            ListTile(
              title: Text('\$${widget.totalAmount.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 20)),
              subtitle: Text(
                DateFormat(' dd MMM yyy hh:mma').format(widget.date),
              ),
              leading: const Icon(Icons.shopping_bag),
              trailing: IconButton(
                icon: Icon(
                  _isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                ),
                onPressed: () => setState(() {
                  _isExpanded = !_isExpanded;
                }),
              ),
            ),
            if (_isExpanded)
              // ignore: sized_box_for_whitespace
              Container(
                height: min(
                  widget.orders.products.length * 20.0 + 100,
                  180,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 3,
                  ),
                  child: ListView.builder(
                    itemCount: widget.orders.products.length,
                    itemBuilder: (context, index) => ListTile(
                      leading: CircleAvatar(
                        backgroundColor: boxBg,
                        backgroundImage: AssetImage(
                          widget.orders.products[index].imageUrl,
                        ),
                      ),
                      title: Text(
                        widget.orders.products[index].name,
                      ),
                      subtitle: Text(
                        'Quantity: ${widget.orders.products[index].quantity}',
                      ),
                      trailing: Text(
                        '\$${widget.orders.products[index].price}',
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
