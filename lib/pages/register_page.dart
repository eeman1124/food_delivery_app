

import 'package:flutter/material.dart';
import 'package:test_app/services/auth/auth_service.dart';

import '../components/my_button.dart';
import '../components/my_textfield.dart';


class RegisterPage extends StatefulWidget {
    final void Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
   //text editing controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController = TextEditingController();


   //register method
   void register() async{
    // get auth service
    final authService = AuthService();

    //check if passwords match =? create user
    if (passwordController.text == confirmpasswordController.text){
      //try creating user
      try{
      await authService.signUpWithEmailPassword(
        emailController.text,
        passwordController.text,
      );
      }
    
    

    //display any errors
    catch (e) {
      showDialog(
        context: context, 
        builder: (context) => AlertDialog(
        title: Text(e.toString()),
      ),
      );
    }

    }


   //if passwords dont match -> show error
   else{
    showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        title: Text("Passwords dont't match"),
      ),
      );
   }

   }




  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.lock_open_rounded,
              size: 100,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),

            const SizedBox(height: 25),

            //message, app slogan
            Text(
              "Let's create an account for you",
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.inversePrimary,

              ),
            ),

            const SizedBox(height: 25),

            //email textField
            MyTextfield(
              controller: emailController,
              hintText: "Email",
              obsecureText: false,
            ),//MyTextField

            const SizedBox(height: 10),

            //password textField
            MyTextfield(
              controller: passwordController,
              hintText: "Password",
              obsecureText: true,
            ),

            const SizedBox(height: 10),

            //confirm password textField
            MyTextfield(
              controller: confirmpasswordController,
              hintText: "Confirm password",
              obsecureText: true,
            ),

            const SizedBox(height: 25),

            // sign up button
            MyButton(
              text: "Sign up",
              onTap: register, 
              ),

              const SizedBox(height: 25),

              //already have an account? Login here

              //not a member? register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                       "Login now",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                  ),
                ],
              ),

  
          
          ],
        ),
      ),
    );
    
  }
}