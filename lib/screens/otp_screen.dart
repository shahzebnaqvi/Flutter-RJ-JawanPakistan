import 'package:flutter/material.dart';

class OTPScreen extends StatefulWidget {
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final List<TextEditingController> _controllers =
      List.generate(8, (index) => TextEditingController());
  int currentIndex = 0;

  void _handleTextChanged(String value, int index) {
    if (value.length == 1) {
      if (index < 7) {
        FocusScope.of(context).nextFocus();
      }
    } else if (value.isEmpty && index > 0) {
      FocusScope.of(context).previousFocus();
    }
  }

  void _submitOTP() {
    String otp = _controllers.map((controller) => controller.text).join();
    print("Entered OTP: $otp");
    // You can now verify the OTP
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter OTP'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(8, (index) {
                    return SizedBox(
                      width: 50,
                      child: TextField(
                        controller: _controllers[index],
                        onChanged: (value) => _handleTextChanged(value, index),
                        textAlign: TextAlign.center,
                        maxLength: 1,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          counterText: '',
                        ),
                        keyboardType: TextInputType.number,
                        autofocus: index == 0,
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitOTP,
                child: Text('Verify OTP'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
