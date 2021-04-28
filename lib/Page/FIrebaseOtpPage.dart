import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_x/phone_auth/get_phone.dart';
import 'package:flutter_x/providers/countries.dart';
import 'package:flutter_x/providers/phone_auth.dart';
import 'package:provider/provider.dart';

class FirebaseOtpPage extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CountryProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PhoneAuthDataProvider(),
        ),
      ],
      child: MaterialApp(
        home: PhoneAuthGetPhone(),
        debugShowCheckedModeBanner: false,
      ),
    );
    throw UnimplementedError();
  }


}

