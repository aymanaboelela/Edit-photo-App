import 'package:add_image/View/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: null,
        title: Text(
          'Login Page',
          style:
              TextStyle(color: Colors.white), // تغيير لون نص العنوان في AppBar
        ),
      ),
      body: Container(
        // تعيين لون الخلفية إلى الأسود
        padding:const  EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset("assets/fci.jpg"),
              TextFormField(
                style:const  TextStyle(
                    color: Colors.white), // تغيير لون النص في حقول النص
                decoration:const  InputDecoration(
                  labelText: 'Email',
                  labelStyle:
                      TextStyle(color: Colors.white), // تغيير لون نص التسمية
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            const   SizedBox(height: 20),
              TextFormField(
                style:const  TextStyle(
                    color: Colors.white), 
                decoration:const InputDecoration(
                  labelText: 'Password',
                  labelStyle:
                      TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
        const       SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                  //TextFormField  اكتب هما الكود بتاع الفير بيز الي هيدخلك للصفحه وبرو في كود هتكتبو في 
                  // ؟؟
                  //ممكن تسيبه كدا هيخش علي طول 
                  
                },
                child: Text('Login'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, 
                  textStyle:
                      TextStyle(color: Colors.white), 
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
