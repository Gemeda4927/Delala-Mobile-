// import 'package:delala/core/widgets/app_button.dart';
// import 'package:flutter/material.dart';

// class LoginScreen extends StatelessWidget {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 24.0),
//         child: BlocProvider(
//           create: (_) => LoginCubit(),
//           child: BlocConsumer<LoginCubit, LoginState>(
//             listener: (context, state) {
//               if (state is LoginError) {
//                 // Show error message or any other UI updates
//                 ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
//               }
//             },
//             builder: (context, state) {
//               return SingleChildScrollView(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Center(
//                       child: Text(
//                         "Log In",
//                         style: TextStyle(
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.blue,
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                     Text(
//                       "Welcome",
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.blue,
//                       ),
//                     ),
//                     Text("Shop, chat, and connect – everything you need in one place!"),
//                     SizedBox(height: 20),
//                     Text(
//                       "Email or Mobile Number",
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(height: 5),
//                     TextField(
//                       controller: emailController,
//                       decoration: InputDecoration(
//                         hintText: "delala@gmail.com",
//                         filled: true,
//                         fillColor: Colors.grey.shade200,
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: BorderSide.none,
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 15),
//                     Text("Password", style: TextStyle(fontWeight: FontWeight.bold)),
//                     SizedBox(height: 5),
//                     TextField(
//                       controller: passwordController,
//                       obscureText: !state.isPasswordVisible,
//                       decoration: InputDecoration(
//                         filled: true,
//                         fillColor: Colors.grey.shade200,
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: BorderSide.none,
//                         ),
//                         suffixIcon: IconButton(
//                           icon: Icon(
//                             state.isPasswordVisible ? Icons.visibility : Icons.visibility_off,
//                           ),
//                           onPressed: () {
//                             context.read<LoginCubit>().togglePasswordVisibility();
//                           },
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                     Align(
//                       alignment: Alignment.centerRight,
//                       child: TextButton(
//                         onPressed: () {},
//                         child: Text(
//                           "Forget Password?",
//                           style: TextStyle(color: Colors.blue),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 15),
//                     Center(
//                       child: AppButton(
//                         title: 'Log In',
//                         onPressed: () {
//                           final email = emailController.text;
//                           final password = passwordController.text;

//                           context.read<LoginCubit>().login(email, password);
//                         },
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     Center(child: Text("or sign up with")),
//                     SizedBox(height: 10),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         IconButton(
//                           onPressed: () {},
//                           icon: Icon(Icons.g_mobiledata, size: 40, color: Colors.blue),
//                         ),
//                         IconButton(
//                           onPressed: () {},
//                           icon: Icon(Icons.facebook, size: 40, color: Colors.blue),
//                         ),
//                         IconButton(
//                           onPressed: () {},
//                           icon: Icon(Icons.fingerprint, size: 40, color: Colors.blue),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 20),
//                     Center(
//                       child: GestureDetector(
//                         onTap: () {
//                           // Handle sign up navigation
//                         },
//                         child: Text(
//                           "Don't have an account? Sign Up",
//                           style: TextStyle(
//                             color: Colors.blue,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
