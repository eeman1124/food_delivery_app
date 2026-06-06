// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:test_app/components/my_button.dart';
import 'package:test_app/components/my_textfield.dart';
import 'package:test_app/services/auth/auth_service.dart';


class LoginPage extends StatefulWidget{
  final void Function()? onTap;



  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text editing controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


//login method
void login() async{
  //get instance of auth service
  final authService = AuthService();

  //try sign in
  try {
    await authService.signInWithEmailPassword(emailController.text, passwordController.text,);
  }
  
  //display any wrrors
  catch (e) {
    showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        title: Text(e.toString()),
      ),
      );
  }

}

//forgot password
void forgotPw(){
  showDialog(
    context: context, 
    builder: (context) => AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.surface,
      title: const Text("User tapped forgot password."),
    ),
    );
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
              "Food Delivery App",
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
            ),//MyTextField

            const SizedBox(height: 10),

            // sign in button
            MyButton(
              text: "Sign in",
              onTap: login, 
              ),

              const SizedBox(height: 25),

              //not a member? register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Not a member?",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                       "Register now",
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