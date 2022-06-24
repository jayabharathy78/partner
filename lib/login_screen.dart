import 'package:flutter/material.dart';
import 'package:partner/verification_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _mobileTextEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (()=>FocusScope.of(context).unfocus()),
      child: SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
          children: [
              Stack(
                children: [
                  Container(
                    height: 250.0,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("assets/images/background.png")),
                      color: Colors.redAccent,
                    ),
                    child: const SizedBox(),
                  ),
                   const Positioned(
                    top: 5,
                      left: 5,
                      child: SizedBox(
                        width: 40,
                        child: Icon(
                    Icons.arrow_back,
                          size: 24,
                          color: Colors.white,
                  ),
                      )),
                  Positioned(
                    top: 100,
                    left: 150,
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        // color: Colors.grey,
                        image: const DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage("assets/images/logo.png"),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  const Text(
                    "Enter Mobile Number",
                    style: TextStyle(fontSize: 25),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Aquaconnect will send an OTP to your mobile number",
                    style: const TextStyle(color: Colors.grey),
                  ),
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextFormField(
                        keyboardType: TextInputType.numberWithOptions(),
                        maxLength: 10,
                        controller: _mobileTextEditingController,
                        validator: (String? value) {
                          if (value!.length != 10) {
                            return "Mobile number must be 10 digit";
                          }else {
                            return null;
                          }
                        },
                        decoration: const InputDecoration(
                            prefix: Text("+91"),
                            suffixIcon: Icon(Icons.phone,color: Colors.blueAccent,),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey, width: 1.0),
                            )),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Checkbox(
                          value: _isChecked,
                          onChanged: (bool? value) {
                            setState(() => _isChecked = value!);
                          },
                      ),
                      const Expanded(child: const Text("I'd like to recive invoice and other updates on WhatsApp"),)
                    ],
                  ),
                  SizedBox(height: 100,),
                  ElevatedButton(onPressed: (){
                    if(_formKey.currentState!.validate()){
                      _formKey.currentState!.save();
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> VerificationScreen(mobile: _mobileTextEditingController.value.text,)));
                    }

                  }, child: SizedBox(width:MediaQuery.of(context).size.width,height:30,child: const Align(alignment:Alignment.bottomCenter,child: const Text("Get OTP")))),

                ],
              )
          ],
        ),
            )),
      ),
    );
  }
}
