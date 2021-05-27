import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_x/Lng/LngPage.dart';
import 'package:flutter_x/Lng/app_setting.dart';
import 'package:flutter_x/Lng/lacalization/app_localization.dart';
import 'package:flutter_x/Lng/lacalization/localization_constants.dart';
import 'package:flutter_x/Lng/language.dart';
import 'package:flutter_x/Note/NotePage.dart';
import 'package:flutter_x/Page/BottomNavigation.dart';
import 'package:flutter_x/Page/CardView.dart';
import 'package:flutter_x/Page/CarouselSlider.dart';
import 'package:flutter_x/Page/CollapsingToolbarPage.dart';
import 'package:flutter_x/Page/Dialog.dart';
import 'package:flutter_x/Page/DrawerNavigation.dart';
import 'package:flutter_x/Page/FIrebaseOtpPage.dart';
import 'package:flutter_x/Page/FacebookLoginPage.dart';
import 'package:flutter_x/Page/FileUpload.dart';
import 'package:flutter_x/Page/FirebaseNotiPage.dart';
import 'package:flutter_x/Page/ImagePicker.dart';
import 'package:flutter_x/Page/ImageUpload.dart';
import 'package:flutter_x/Page/InternetConnectivity.dart';
import 'package:flutter_x/Page/Login.dart';
import 'package:flutter_x/Obj/CardData.dart';
import 'package:flutter_x/Page/LoginRegisterPage.dart';
import 'package:flutter_x/Page/LoginUi.dart';
import 'package:flutter_x/Page/QRcode.dart';
import 'package:flutter_x/Page/RetrofitPage.dart';
import 'package:flutter_x/Page/SendData.dart';
import 'package:flutter_x/Page/SharedPreference.dart';
import 'package:flutter_x/Page/TestUI.dart';
import 'package:flutter_x/Page/TrustLocation.dart';
import 'package:flutter_x/Page/google_map_picker.dart';
import 'package:flutter_x/phone_auth/get_phone.dart';
import 'package:flutter_x/themes/theme.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import 'Page/ProductBox.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays(
      [SystemUiOverlay.bottom, SystemUiOverlay.top]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => AppSetting()),
          StreamProvider(
              create: (context) => Connectivity().onConnectivityChanged),
        ],
        child: MaterialApp(
          title: 'FlutterX',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: MyHomePage(title: 'FlutterX'),
        ));

  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  var text = ["Card View","Login UI","Retrofit API","Shared Preference","Image Upload","Login and Register",
              "CollapsingToolbar","Facebook Login","Firebase Notification","Firebase OTP","Google Map Picker",
             "Sqlite Note","Drawer Navigation","Bottom Navigation","Image Slider","Internet Condition","Language","Image Picker",
             "Login","Test UI","Send data","File Upload","QR code","Custom Dialog","Trust Location"];

  @override
  void initState() {
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return Consumer<AppSetting>(builder: (context, appSetting, child) {
      return new MaterialApp(
          locale: appSetting.currentLanguage(),
          darkTheme: AppTheme.darkTheme,
          themeMode: appSetting.currentTheme(),
          //theme: AppTheme.lightTheme,
          title: "Home Screen",
          theme: new ThemeData(
              primaryColor: Colors.blue,
              primarySwatch: Colors.blue,
              accentColor: Colors.red),

          supportedLocales: Language.languageList()
              .map((language) =>
              Locale(language.languageCode, language.countryCode))
              .toList(),
          localizationsDelegates: [
            AppLocalization.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          localeResolutionCallback: (deviceLocale, supportedLocale) {
            for (var locale in supportedLocale) {
              if (locale.languageCode == deviceLocale.languageCode &&
                  locale.countryCode == deviceLocale.countryCode) {
                return deviceLocale;
              }
            }
            return supportedLocale.first;
          },


          debugShowCheckedModeBanner: false,
          home: new Scaffold(
              appBar: new AppBar(
                title: new Text(
                  "FlutterX",
                  style: new TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),

              body: ListView.builder(
                /*shrinkWrap: true,
              padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),*/
                itemCount: text.length,
                itemBuilder: (BuildContext context, int position) {

                  return Container(
                      padding: EdgeInsets.all(3),
                      height: 100,
                      child: Card(
                          child: new InkWell(
                              onTap: (){
                                if(position==0){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => CardView()),
                                  );
                                }else if(position==1){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => LoginUiPage()),
                                  );
                                }else if(position==2){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => RetrofitPage()),
                                  );
                                }else if(position==3){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => SharedPreferencePage()),
                                  );
                                }else if(position==4){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => ImageUploadPage()),
                                  );
                                }else if(position==5){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => LoginRegisterPage()),
                                  );
                                }else if(position==6){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => CollapsingToolbarPage()),
                                  );
                                }else if(position==7){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => FacebookLoginPage()),
                                  );
                                }else if(position==8){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => FirebaseNotiPage()),
                                  );
                                }else if(position==9){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => FirebaseOtpPage()),
                                  );
                                }else if(position==10){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => GoogleMapPickerPage()),
                                  );
                                }else if(position==11){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => NotePage()),
                                  );
                                }else if(position==12){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => DrawerNavigationPage()),
                                  );
                                }else if(position==13){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => BottomNavigationPage()),
                                  );
                                }else if(position==14){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => CarouselSliderPage()),
                                  );
                                }else if(position==15){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => InternetConditionPage()),
                                  );
                                }else if(position==16){
                                  Fluttertoast.showToast(msg: getTranslatedValue(context, 'language'),toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => LngPage()),
                                  );
                                }else if(position==17){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => ImagePickerPage()),
                                  );
                                }else if(position==18){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => LoginPage()),
                                  );
                                }else if(position==19){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => TestUIPage()),
                                  );
                                }else if(position==20){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => SendDataPage()),
                                  );
                                }else if(position==21){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => FileUploadPage()),
                                  );
                                }else if(position==22){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => QRcodePage()),
                                  );
                                }else if(position==23){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => DialogPage()),
                                  );
                                }else if(position==24){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => TrustLocationPage()),
                                  );
                                }
                              },
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Text(text[position],style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                                  ]))));
                },
              ))
      );
    });
  }

}


