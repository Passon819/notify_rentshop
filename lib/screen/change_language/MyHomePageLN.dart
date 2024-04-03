import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../messaging_screen/NotificationsPage.dart';

class MyHomePageLN extends StatefulWidget {
  //MyHomePageLN({Key key}) : super(key: key);
  const MyHomePageLN({
    super.key,
  });

  @override
  _MyHomePageLNState createState() => _MyHomePageLNState();
}

class _MyHomePageLNState extends State<MyHomePageLN> {
  String dropdownValue = 'English - US';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("localization".tr()),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              child: Row(
                children: [
                  Text(
                    'title'.tr() + ":",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                      child: Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      'app_local_demo'.tr(),
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  )),
                ],
              ),
            ),
            Container(
              width: width,
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Row(
                children: [
                  Text(
                    'details'.tr() + ":",
                    style: TextStyle(fontSize: 15),
                  ),
                  Expanded(
                      child: Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text('demo_details'.tr(),
                        style: TextStyle(fontSize: 15)),
                  ))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 50),
              width: width,
              alignment: Alignment.center,
              child: Container(
                height: 40,
                padding: EdgeInsets.only(left: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  border: Border.all(color: Colors.black, width: .9),
                ),
                child: Container(
                    padding: EdgeInsets.only(left: 4, right: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        DropdownButton<String>(
                          icon: Container(
                            padding: EdgeInsets.only(
                              left: 10,
                            ),
                            height: 30,
                            width: 30,
                          ),
                          iconSize: 18,
                          elevation: 16,
                          value: dropdownValue,
                          style: TextStyle(color: Colors.black),
                          underline: Container(
                            padding: EdgeInsets.only(left: 4, right: 4),
                            color: Colors.transparent,
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              if (newValue == 'English - US') {
                                setState(() {
                                  dropdownValue = 'English - US';
                                  // icon = "th.png";
                                  context.setLocale(Locale('en', 'US'));
                                });
                              } else if (newValue == 'Thai - TH') {
                                setState(() {
                                  dropdownValue = 'Thai - TH';
                                  context.setLocale(Locale('th', 'TH'));
                                });
                              }
                            });
                          },
                          items: <String>['English - US', 'Thai - TH']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 3),
                          child: Icon(
                            Icons.keyboard_arrow_down,
                            size: 18,
                          ),
                        )
                      ],
                    )),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NotificationsPage()),
                  );
                },
                child: Text('next page'))
          ],
        ),
      ),
    );
  }
}
