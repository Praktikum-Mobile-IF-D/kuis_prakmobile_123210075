import 'package:flutter/material.dart';
import 'package:responsi_123210075/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text('Login Screen'),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
                prefixIcon: Icon(Icons.verified_user),
              ),
              validator: (String? val) {
                return (val != null && !val.contains('@')
                    ? 'Email harus menggunakan @'
                    : null);
              },
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              obscureText: true,
              controller: passwordController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
                prefixIcon: Icon(Icons.key),
              ),
              validator: (String? val) {
                return (val != null && val.length < 8 
                    ? 'Password harus minimal 8 karakter'
                    : null);
              },
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () {
                  if (emailController.text == 'admin' &&
                      passwordController.text == 'admin') {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return HomeScreen();
                    }));
                  }
                },
                child: Text('Login'))
          ],
        ),
      ),
    );
  }
}
