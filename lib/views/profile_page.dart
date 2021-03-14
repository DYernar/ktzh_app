import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Профиль',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 15.0,),
              Padding(
                padding: EdgeInsets.only(left: 35.0, right: 35.0, top: 15, bottom: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Личные данные',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'изменить',
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.blueAccent,
                          ),
                        )
                      ],
                    )

              ],
          )
              ),
              Padding(
                padding: EdgeInsets.only(top: 5.0, left: 30.0, right: 30.0),
                child: Container(
                    height: 150.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.white,
                      border: Border.all(color: Colors.black12)
                    ),
                    child: Column (
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row (
                        children: <Widget>[
                            Container(
                            //height: double.infinity,
                            alignment: Alignment.topLeft,
                            child: Image.asset(
                              'assets/images/human.png',
                              fit: BoxFit.contain,
                              width: 125.0,
                            )
                        ),
                          Container (
                            height: 145.0,
                            width: 200,
                            alignment: Alignment.topLeft,
                            child:
                            Column (
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(height: 5.0),
                                Text(
                                        'Mark Lawrence',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontSize: 25.0,
                                            fontWeight: FontWeight.bold
                                        )
                                    ),
                                    Divider(
                                      color: Colors.white,
                                      height: 10.0,
                                      thickness: 10.0,
                                    ),

                              Text(
                                      'mark.lawrence@nu.edu.kz',
                                textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 17.0
                                      ),
                                    ),
                                SizedBox(height: 5.0),
                                SizedBox(height: 1.0,
                                  width: 180.0,
                                  child: const DecoratedBox(
                                    decoration: const BoxDecoration(
                                        color: Colors.grey,
                                    ),
                                  ),),

                                SizedBox(height: 5.0),
                               Text (
                                        '+7 789 123 4564',
                                    textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontSize: 17.0
                                        )
                                    ),

                                SizedBox(height: 5.0),
                                SizedBox(height: 1.0,
                                  width: 180.0,
                                  child: const DecoratedBox(
                                    decoration: const BoxDecoration(
                                      color: Colors.grey,
                                    ),
                                  ),),

                                SizedBox(height: 5.0),
                              Text (
                                        'Nazarbayev University',
                                        style: TextStyle(
                                            fontSize: 17.0
                                        )
                                    ),


                                SizedBox(height: 5.0),
                                SizedBox(height: 1.0,
                                  width: 180.0,
                                  child: const DecoratedBox(
                                    decoration: const BoxDecoration(
                                      color: Colors.grey,
                                    ),
                                  ),),
                                  ],
                                ),
                          ),],

                              ),
                        ],),
                ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
                    child: Container(
                      height: 70.0,
                      decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                          color: Colors.white,
                          border: Border.all(color: Colors.black12)
                      ),
                      child: Column (
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                width: 220,
                              height: 68,
                              alignment: Alignment.center,
                                      child: Text(
                                    'История заказов',
                                    style: TextStyle(
                                      fontSize: 21,
                                    ),
                                  ),
                                    ),
                              Container(
                                height: 68,
                                width: 120,
                                alignment: Alignment.centerRight,
                                child: Image.asset('assets/images/right-arrow.png',
                                  alignment: Alignment.centerRight,
                                  width: 25,
                                )
                              )
                            ],
                          )
                        ],
                      )
                    ),
                ),
              Padding(
                padding: EdgeInsets.only(top: 15.0, left: 30.0, right: 30.0),
                child: Container(
                    height: 70.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                        color: Colors.white,
                        border: Border.all(color: Colors.black12)
                    ),
                    child: Column (
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              width: 193,
                              height: 68,
                              alignment: Alignment.center,
                              child: Text(
                                'Сделать заказ',
                                style: TextStyle(
                                  fontSize: 21,
                                ),
                              ),
                            ),
                            Container(
                                height: 68,
                                width: 147,
                                alignment: Alignment.centerRight,
                                child: Image.asset('assets/images/right-arrow.png',
                                  alignment: Alignment.centerRight,
                                  width: 25,
                                )
                            )
                          ],
                        )
                      ],
                    )
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0, left: 30.0, right: 30.0),
                child: Container(
                    height: 70.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                        color: Colors.white,
                        border: Border.all(color: Colors.black12)
                    ),
                    child: Column (
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              width: 85,
                              height: 68,
                              alignment: Alignment.center,
                              child: Text(
                                'FAQ',
                                style: TextStyle(
                                  fontSize: 21,
                                ),
                              ),
                            ),
                            Container(
                                height: 68,
                                width: 255,
                                alignment: Alignment.centerRight,
                                child: Image.asset('assets/images/right-arrow.png',
                                  alignment: Alignment.centerRight,
                                  width: 25,
                                )
                            )
                          ],
                        )
                      ],
                    )
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0, left: 30.0, right: 30.0),
                child: Container(
                    height: 70.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                        color: Colors.white,
                        border: Border.all(color: Colors.black12)
                    ),
                    child: Column (
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              width: 130,
                              height: 68,
                              alignment: Alignment.center,
                              child: Text(
                                'Помощь',
                                style: TextStyle(
                                  fontSize: 21,
                                ),
                              ),
                            ),
                            Container(
                                height: 68,
                                width: 210,
                                alignment: Alignment.centerRight,
                                child: Image.asset('assets/images/right-arrow.png',
                                  alignment: Alignment.centerRight,
                                  width: 25,
                                )
                            )
                          ],
                        )
                      ],
                    )
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0, left: 30.0, right: 30.0),
                child: Container(
                    alignment: Alignment.center,
                    height: 40.0,
                    width: 220.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.blue[400],
                        border: Border.all(color: Colors.black12)
                    ),
                    child:
                        Text(
                          'Выход',
                          style: TextStyle (
                            fontSize: 18,
                            color: Colors.white,
                          )
                        )
                    )
                ),
            ],
                    ),
                    ],
                    ),
                );
  }
}
