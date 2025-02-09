import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailOrPhoneController = TextEditingController();
  final TextEditingController _answerController = TextEditingController();

  final List<String> _securityQuestions = [
    "What is your pet's name?",
    "What is your mother's maiden name?",
    "What was the name of your first school?"
  ];

  String? _selectedQuestion;

  void _sendOTP() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('OTP Sent Successfully!')),
      );
      // Navigate to OTP verification screen (if needed)
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Forgot Password")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: "Security Question"),
                items: _securityQuestions.map((question) {
                  return DropdownMenuItem(value: question, child: Text(question));
                }).toList(),
                onChanged: (value) => setState(() => _selectedQuestion = value),
                validator: (value) =>
                value != null ? null : "Please select a security question",
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _answerController,
                decoration: const InputDecoration(labelText: "Answer"),
                validator: (value) =>
                value != null && value.isNotEmpty ? null : "Please enter your answer",
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _emailOrPhoneController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(labelText: "Email or Phone Number"),
                validator: (value) =>
                value != null && value.isNotEmpty ? null : "Enter email or phone number",
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _sendOTP,
                child: const Text("Send OTP"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
