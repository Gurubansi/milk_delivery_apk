import 'package:flutter/material.dart';
import 'Home_Page.dart';
import 'Login_Page.dart';


class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[400],
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20.0),
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  Text(
                    "Welcome! Register",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 20),

                  CustomTextField(
                    controller: _fullNameController,
                    hintText: 'Full Name',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your full name';
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 20),

                  CustomTextField(
                    controller: _emailController,
                    hintText: 'Email',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 20),

                  CustomTextField(
                    controller: _passwordController,
                    hintText: 'Password',
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters long';
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 20),

                  CustomTextField(
                    controller: _confirmPasswordController,
                    hintText: 'Confirm Password',
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      } else if (value != _passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 20),

                  Row(
                    children: [
                      Checkbox(
                        value: _rememberMe,
                        onChanged: (value) {
                          setState(() {
                            _rememberMe = value!;
                          });
                        },
                      ),
                      Text("Remember me"),
                    ],
                  ),

                  SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Process the registration data
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Processing Data')),
                        );
                      }
                    },
                    child: Text("Sign Up"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[400],
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      textStyle: TextStyle(fontSize: 16,),
                    ),
                  ),

                  SizedBox(height: 20),

                  Text("or sign in with"),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialButton(
                        icon: Icons.facebook,
                        color: Colors.blue,
                        onPressed: () {
                          // Add Facebook login functionality here
                        },
                      ),

                      SizedBox(width: 20),

                      SocialButton(
                        icon: Icons.g_mobiledata,
                        color: Colors.red,
                        onPressed: () {
                          // Navigate to HomePage when this button is clicked
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        },
                      ),
                    ],
                  ),

                  SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account? "),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginScreen()),
                          );
                        },
                        child: Text(
                          "Login now",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  CustomTextField({
    required this.hintText,
    this.obscureText = false,
    required this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: TextFormField(
            controller: controller,
            obscureText: obscureText,
            validator: validator,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 16.0, top: 8.0, bottom: 8.0),
              border: InputBorder.none,
            ),
          ),
        ),
        Positioned(
          left: 16,
          top: 0,
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 4.0),
            child: Text(
              hintText,
              style: TextStyle(
                color: Colors.grey.shade700,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SocialButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  SocialButton({required this.icon, required this.color, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        backgroundColor: color,
        padding: EdgeInsets.all(10),
      ),
      child: Icon(icon, color: Colors.white),
    );
  }
}

















// import 'package:flutter/material.dart';
// import 'Login_Page.dart';
//
// class RegisterScreen extends StatefulWidget {
//   @override
//   _RegisterScreenState createState() => _RegisterScreenState();
// }
//
// class _RegisterScreenState extends State<RegisterScreen> {
//   final _formKey = GlobalKey<FormState>();
//
//   final TextEditingController _fullNameController = TextEditingController();
//   final TextEditingController _businessNameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _confirmPasswordController = TextEditingController();
//
//   bool _rememberMe = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue.shade900,
//       body: Center(
//         child: SingleChildScrollView(
//           child: Container(
//             padding: EdgeInsets.all(20.0),
//             width: MediaQuery.of(context).size.width * 0.8,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(10.0),
//             ),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Text(
//                     "Welcome! Register",
//                     style: TextStyle(
//                       fontSize: 22,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//
//                   SizedBox(height: 20),
//
//                   CustomTextField(
//                     controller: _fullNameController,
//                     hintText: 'Full Name',
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your full name';
//                       }
//                       return null;
//                     },
//                   ),
//
//                   SizedBox(height: 20),
//                   CustomTextField(
//                     controller: _emailController,
//                     hintText: 'Email',
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your email';
//                       } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
//                         return 'Please enter a valid email address';
//                       }
//                       return null;
//                     },
//                   ),
//
//                   SizedBox(height: 20),
//                   CustomTextField(
//                     controller: _passwordController,
//                     hintText: 'Password',
//                     obscureText: true,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your password';
//                       } else if (value.length < 6) {
//                         return 'Password must be at least 6 characters long';
//                       }
//                       return null;
//                     },
//                   ),
//                   SizedBox(height: 20),
//                   CustomTextField(
//                     controller: _confirmPasswordController,
//                     hintText: 'Confirm Password',
//                     obscureText: true,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please confirm your password';
//                       } else if (value != _passwordController.text) {
//                         return 'Passwords do not match';
//                       }
//                       return null;
//                     },
//                   ),
//
//                   SizedBox(height: 20),
//                   Row(
//                     children: [
//                       Checkbox(
//                         value: _rememberMe,
//                         onChanged: (value) {
//                           setState(() {
//                             _rememberMe = value!;
//                           });
//                         },
//                       ),
//                       Text("Remember me"),
//                     ],
//                   ),
//                   SizedBox(height: 20),
//                   ElevatedButton(
//                     onPressed: () {
//                       if (_formKey.currentState!.validate()) {
//                         // Process the registration data
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(content: Text('Processing Data')),
//                         );
//                       }
//                     },
//                     child: Text("Sign Up"),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.blue,
//                       padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
//                       textStyle: TextStyle(fontSize: 16),
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   Text("or sign in with"),
//                   SizedBox(height: 10),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       SocialButton(
//                         icon: Icons.facebook,
//                         color: Colors.blue,
//                         onPressed: () {},
//                       ),
//                       SizedBox(width: 20),
//                       SocialButton(
//                         icon: Icons.g_mobiledata,
//                         color: Colors.red,
//                         onPressed: () {},
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 20),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text("Already have an account? "),
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) => LoginScreen()),
//                           );
//                         },
//                         child: Text(
//                           "Login now",
//                           style: TextStyle(color: Colors.blue),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class CustomTextField extends StatelessWidget {
//   final String hintText;
//   final bool obscureText;
//   final TextEditingController controller;
//   final String? Function(String?)? validator;
//
//   CustomTextField({
//     required this.hintText,
//     this.obscureText = false,
//     required this.controller,
//     this.validator,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Container(
//           height: 50,
//           decoration: BoxDecoration(
//             border: Border.all(color: Colors.grey),
//             borderRadius: BorderRadius.circular(10.0),
//           ),
//           child: TextFormField(
//             controller: controller,
//             obscureText: obscureText,
//             validator: validator,
//             decoration: InputDecoration(
//               contentPadding: EdgeInsets.only(left: 16.0, top: 8.0, bottom: 8.0),
//               border: InputBorder.none,
//             ),
//           ),
//         ),
//         Positioned(
//           left: 16,
//           top: 0,
//           child: Container(
//             color: Colors.white,
//             padding: EdgeInsets.symmetric(horizontal: 4.0),
//             child: Text(
//               hintText,
//               style: TextStyle(
//                 color: Colors.grey.shade700,
//                 fontSize: 12,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// class SocialButton extends StatelessWidget {
//   final IconData icon;
//   final Color color;
//   final VoidCallback onPressed;
//
//   SocialButton({required this.icon, required this.color, required this.onPressed});
//
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: onPressed,
//       style: ElevatedButton.styleFrom(
//         shape: CircleBorder(),
//         backgroundColor: color,
//         padding: EdgeInsets.all(10),
//       ),
//       child: Icon(icon, color: Colors.white),
//     );
//   }
// }
//
//
//
//
//
//
//
//
//
//
//
//
//
//
