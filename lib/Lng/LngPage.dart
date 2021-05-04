import 'package:flutter/material.dart';
import 'package:flutter_x/Lng/app_setting.dart';
import 'package:flutter_x/Lng/lacalization/localization_constants.dart';
import 'package:flutter_x/Lng/language.dart';
import 'package:flutter_x/Lng/prefs.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class LngPage extends StatefulWidget {
  @override
  LngPageState createState() => LngPageState();

  static void show(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => LngPage()));
  }
}

class LngPageState extends State<LngPage> {
  bool isDark = false;
  Language selectedLanguage;
  List<Language> languageList = [];

  void loadData() async {}

  @override
  void initState() {
    Prefs().getSetting().then((setting) {
      setState(() {
        languageList = Language.languageList();
        isDark = setting.isDark ?? false;
        if (setting.languageCode == null || setting.languageCode.isEmpty)
          selectedLanguage = languageList.first;
        else
          selectedLanguage = languageList.singleWhere(
              (element) => element.languageCode == setting.languageCode);
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Setting"),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("Dark Mode"),
            trailing: Switch(
              value: isDark,
              onChanged: (value) {
                setState(() {
                  isDark = value;
                });
                Provider.of<AppSetting>(context, listen: false).switchTheme();
              },
            ),
          ),
          ListTile(
            title: Text(getTranslatedValue(context, 'language')),
            trailing: DropdownButton(
                underline: SizedBox(),
                value: selectedLanguage,
                style: TextStyle(color: Colors.black),
                icon: Icon(
                  Icons.language,
                ),
                items: languageList
                    .map<DropdownMenuItem<Language>>(
                        (language) => DropdownMenuItem(
                            value: language,
                            child: Row(
                              children: [
                                Text(language.flag),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  language.name,
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                              ],
                            )))
                    .toList(),
                onChanged: (Language language) {
                  setState(() {
                    this.selectedLanguage = language;
                  });
                  Provider.of<AppSetting>(context, listen: false)
                      .onLanguageChange(language);
                }),
          )
        ],
      ),
    );
  }
}


