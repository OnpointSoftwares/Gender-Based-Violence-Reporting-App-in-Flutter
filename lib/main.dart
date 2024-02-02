import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _userType = 'Client'; // Default user type

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GBV Login'),
        backgroundColor: Colors.blue[600],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                  'https://taxmartkenya.co.ke/wp-content/uploads/2021/11/488809.jpg'),
              Container(
                width: 200, // Set the width of the dropdown
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: _userType,
                  onChanged: (String? newValue) {
                    setState(() {
                      _userType = newValue!;
                    });
                  },
                  items: <String>['Client', 'Admin']
                      .map<DropdownMenuItem<String>>(
                        (String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    },
                  ).toList(),
                ),
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _login();
                    },
                    child: Text('Login'),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      _signup();
                    },
                    child: Text('Signup'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      final String email = _emailController.text.trim();
      final String password = _passwordController.text.trim();
      final String userType = _userType;

      // Implement your login logic here based on userType
      // For now, just print the values
      print('User Type: $userType');
      print('Email: $email');
      print('Password: $password');
    }
  }

  void _signup() {
    // Navigate to the SignupPage
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignupPage()),
    );
  }
}
class SignupPage extends StatelessWidget {
  final TextEditingController _signupEmailController = TextEditingController();
  final TextEditingController _signupPasswordController =
  TextEditingController();
  final TextEditingController _confirmPasswordController =
  TextEditingController();
  String _userType = 'Client'; // Default user type

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GBV Signup Page'),
        backgroundColor: Colors.blue[600],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
                'https://taxmartkenya.co.ke/wp-content/uploads/2021/11/488809.jpg'),

            Text('Welcome to Signup Page'),
            SizedBox(height: 20),
            DropdownButton<String>(
              value: _userType,
              onChanged: (String? newValue) {
                // Handle dropdown value change
                if (newValue != null) {
                  _userType = newValue;
                }
              },
              items: <String>['Client', 'Admin'].map<DropdownMenuItem<String>>(
                    (String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                },
              ).toList(),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _signupEmailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _signupPasswordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 10),
            TextField(
              controller: _confirmPasswordController,
              decoration: InputDecoration(labelText: 'Confirm Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _performSignup();
              },
              child: Text('Signup'),
            ),
          ],
        ),
      ),
    );
  }

  void _performSignup() {
    final String signupEmail = _signupEmailController.text.trim();
    final String signupPassword = _signupPasswordController.text.trim();
    final String confirmPassword = _confirmPasswordController.text.trim();

    // Implement your signup logic here
    // Validate the inputs, check for password match, etc.
    // For now, just print the values
    print('User Type: $_userType');
    print('Signup Email: $signupEmail');
    print('Signup Password: $signupPassword');
    print('Confirm Password: $confirmPassword');
  }
}
