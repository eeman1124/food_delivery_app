import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/components/my_button.dart';
import 'package:test_app/models/food.dart';
import 'package:test_app/models/restaurant.dart';


class FoodPage extends StatefulWidget {

  final Food food;
  final Map<Addon, bool> selectedAddons = {};

  FoodPage({super.key, required this.food,}) 
  {
    //initialize selected addons to be false
    for (Addon addon in food.availableAddons){
      selectedAddons[addon] = false;
    } 
  }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {

  //method to add to cart
  void addToCart(Food food, Map<Addon, bool> selectedAddons){

    //close the current food page to get back to menu
    Navigator.pop(context);

    //format the selected addons
    List<Addon> currentSelectedAddons = [];
    for (Addon addon in widget.food.availableAddons){
      if (widget.selectedAddons[addon] == true){
        currentSelectedAddons.add(addon);
      }
    }
    //add to cart
    context.read<Restaurant>().addToCart(food, currentSelectedAddons);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SingleChildScrollView(
        child: Column(
        children: [
        
          //food image
          Stack(
  children: [
    // food image
    ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(24),
        bottomRight: Radius.circular(24),
      ),
      child: SizedBox(
        height: 300,
        width: double.infinity,
        child: Image.asset(
          widget.food.imagePath,
          fit: BoxFit.cover,
        ),
      ),
    ),
    // back button
    Positioned(
      top: 40,
      left: 16,
      child: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back_ios_new_rounded),
        style: IconButton.styleFrom(
          backgroundColor: const Color.fromARGB(182, 255, 255, 255),
          shape: const CircleBorder(),
        ),
      ),
    ),
  ],
),
        
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              //food name
            Text(
              widget.food.name, 
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
        
        
            
            //food price
            Text(
             '\$${widget.food.price}',
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.primary
              ),
            ),
        
            const SizedBox(height: 10),
        
        
            //food description
            Text(widget.food.description),
            const SizedBox(height: 10),
        
            Divider(color: Theme.of(context).colorScheme.secondary),
            const SizedBox(height: 10),
        
            
        
        
            
            //addons
            Text("Add-ons",
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            ),
        
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).colorScheme.secondary),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: widget.food.availableAddons.length,
                itemBuilder: (context, index){
                  //get individual addon
                  Addon addon = widget.food.availableAddons[index];
              
                  //return check box UI
                  return CheckboxListTile(
                    title: Text(addon.name),
                    subtitle: Text('\$${addon.price}', style: TextStyle(color: Theme.of(context).colorScheme.primary,
                    ),
                    ),
                    value: widget.selectedAddons[addon],
                    onChanged: (bool? value){
                      setState(() {
                        widget.selectedAddons[addon] = value!;
                      });
                    },
                  );
                },
              ),
            )
            ],),
          ),
        
          //button -> add to cart
          MyButton(onTap: () => addToCart(widget.food, widget.selectedAddons),
           text: "Add to cart",
          ),

          const SizedBox(height: 25),
        ],
            ),
      ),
    );
  }
}