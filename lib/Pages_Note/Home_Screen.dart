import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'database/operation.dart';
import 'Edit.dart';
import 'package:sqflite/sqflite.dart';
import 'package:notes/Pages_Note/database/LocalDataBase.dart';


class HomeMain_Screen extends StatefulWidget {

  State<StatefulWidget> createState() {
    return HomeScreen_test();
  }
}

class HomeScreen_test extends State<HomeMain_Screen> {
  SqlDb database = SqlDb();
  List GetdataList = [];
  final List colorsItem = OperationdataInsert().colors;

  Future redData() async {
    List<Map> response = await database.readData('SELECT * FROM notes');
    GetdataList.addAll(response);
    if(this.mounted){
      setState(() {

      });}
  }


@override
void initState(){
  redData();
  super.initState();

}


  Widget build(BuildContext context) {
    double colornote = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('My Note',
            style: TextStyle(fontSize: 30, color: Colors.white)),
        centerTitle: true,
        toolbarHeight: 80,
        backgroundColor: Theme.of(context).primaryColor,
        automaticallyImplyLeading: false,
      ),
      body: Container(
          child: GetdataList.isNotEmpty ? ListView(
        children: [

                   ListView.builder(
                    itemCount: GetdataList.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.all(10),
                    itemBuilder: (context, i) {
                      return Dismissible(
                          key: Key(
                              "$i"), // هنا دالة ال Dismissible تقوم بعمل سواب حذف للست اي بتقدر تعمل سواب لاي عنصر في اللست
                          // وراح ينحذف معك بضيف لمسه جماليه, طيببتاخد مفتاح او رقم الاندكس الي بدك تحذفه وطبعا اللست ككل عشان تقدر تعمل لىكل عنصر من عناصرها سواب

                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            margin: EdgeInsets.symmetric(vertical: 10),
                            shadowColor: colorsItem[GetdataList[i]['color']],
                            child: Row(
                              children: [
                                Container(
                                    width: 5,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: colorsItem[GetdataList[i]['color']], width: 60),
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(12),
                                          topRight: Radius.circular(12)),
                                    )),
                                Container(
                                  width: colornote - 30,
                                  padding: EdgeInsets.all(20),
                                  child: ListTile(
                                    contentPadding: EdgeInsets.all(5),
                                    title: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 20.0),
                                      child: Text(
                                        "${GetdataList[i]['title']}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1,
                                      ),
                                    ),
                                    dense: true,
                                    subtitle: Text(
                                        "${GetdataList[i]['note']}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2),
                                    onTap: () {
                                      print('***************************');
                                      print(i);

                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => EditNote(
                                                   id: i+1, Title: GetdataList[i]['title'],
                                                   note: GetdataList[i]['note'],
                                                   Color:  GetdataList[i]['color'] )));
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ));
                    },
                  ),


        ],
      )
              : Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Container(
                    child: Image.asset(
                      'images/note.jpg',
                      height: 300,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    'No Notes :(',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'you have no task to do',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ],
              )),

      ),


      floatingActionButton: FloatingActionButton(
        child: Container(
          width: 60,
          height: 60,
          child: Icon(
            Icons.add,
            size: 40,
          ),
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [
                    0.4,
                    1.0,
                  ],
                  colors: [  Color.fromARGB(255, 19, 33, 224) ,Colors.red]
              )
          ),
        ),
        onPressed: ()  {
          Navigator.of(context).pushNamed('AddNote');
        },
      ),



    );
  }
}
