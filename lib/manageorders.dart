import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';


class MyListPage extends StatefulWidget {
  @override
  _MyListPageState createState() => _MyListPageState();
}

class _MyListPageState extends State<MyListPage> {
  String _customerId = '';
  String _dish = '';
  int _quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Manage Orders',
          style: TextStyle(fontSize: 22),
        ),
        backgroundColor: Colors.grey[700],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('Order_Data').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return const Text('Loading...');
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (BuildContext context, int index) {
              final DocumentSnapshot document = snapshot.data!.docs[index];
              _customerId = document.get('CustomerID');
              _dish = document.get('Dish');
              _quantity = document.get('Quantity');
              return ListTile(
                title: Text('$_customerId - $_dish', style: TextStyle(fontSize: 16)),
                subtitle: Text('Quantity: $_quantity'),
                trailing: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.grey[700]),
                  onPressed: () {
                    //FirebaseFirestore.instance.collection('Order_Data').doc(document.id).delete();
                    Fluttertoast.showToast(
                        msg: "Order Confirmed!!",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  },
                  child: Text('Confirm Order'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
