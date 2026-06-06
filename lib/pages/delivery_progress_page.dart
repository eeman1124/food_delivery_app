import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/components/my_receipt.dart';
import 'package:test_app/models/restaurant.dart';
import 'package:test_app/services/database/firestore.dart';

class DeliveryProgressPage extends StatefulWidget {
  const DeliveryProgressPage({super.key});

  @override
  State<DeliveryProgressPage> createState() => _DeliveryProgressPageState();
}

class _DeliveryProgressPageState extends State<DeliveryProgressPage> {

  //get access to db
  FirestoreService db = FirestoreService();

  @override
  void initState() {
    super.initState();

    //if we get to this page, submit the order to firestore db
    String receipt = context.read<Restaurant>().displayCartReceipt();
    db.saveOrderToDatabase(receipt);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: MyReceipt(),
            ),
          )
          
        ],
      ),
    );
  }

  //custom bottom nav bar - message/call delivery driver
  Widget _buildBottomNavBar(BuildContext context){
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
          //profile pic of driver
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: (){},
            icon: const Icon(Icons.person),
          ),
        ),

        const SizedBox(width: 10),

        //driver details
        Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Azfer Zawavi",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Theme.of(context).colorScheme.inversePrimary,
                ),
            ),
            Text(
              "Driver",
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            )
          ],
        ),
        const Spacer(),
        Row(
          children: [
             //message button
              Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: (){},
            icon: const Icon(Icons.message),
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),

        const SizedBox(width: 10),
        
            //call button
             Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: (){},
            icon: const Icon(Icons.call),
            color: Colors.green,
          ),
        ),

          ],
        )



      ],),
    );
  }
}