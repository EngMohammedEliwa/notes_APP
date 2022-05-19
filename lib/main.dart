import 'package:flutter/material.dart';
import 'package:notes/Pages_Note/addNite.dart';
import 'package:notes/Pages_Note/Home_Screen.dart';
import 'package:flutter/services.dart';
import 'dart:async';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(// هنا في ملاحظه انه هنا بقدر اضبط كل اعدادت الخط و الالون داخل البرنامج يعني بضبط ثيم البرنامج من لون و نوع الخط ولون الازرار والى اخره
        primaryColor: Colors.blue.shade900, // هنا اللون الاساسي للبرنامج تبعنا عنا بالطبق على الاب بار و ال دروار ....
        buttonColor: Colors.indigo,// هنا بنضع لون الازرار لكل التاطبيق لانه باي تطبيق ناجح لازم او غالبا اللون الازرار لازم يكون موحد
        textTheme: TextTheme( // هنا بنقوم بوضع الستايل الخاص بالنص الان فلتر موفره ستايلات كبيره فيك تختار ستايل معين وتخصص عليه تحت بالشكل الي بدك اياه
          // لكن اعيارك هنا انته حطيت ال textTheme بتقدر تعدل على اي ستايل جاهز من الي موجودين ب فلتر الان مثلا هي ال headline6 موجوده والها اعدادانت افتراضيه
          // مثل اللون وحجم الخط الفكره هنا انا هيني جبتها وعدلت عليها نفسها بما ينتاسب معي الان مش شرط انك في الثيم اعملت للازرار لون خلص ما بتقدر تخصص لكل زر لون لا
          // فيك تروح اذا بدك تغير للون معين للزر فيك تروح داخل الزر وتحط اللون الي بتشوفه مناسب معك او فيك تعمل هنا متغيران للالوان وتغير على كيفك بالي يمشي مع التطبيق
          headline6: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          headline3: TextStyle( fontSize: 22,fontWeight: FontWeight.bold, color: Colors.deepPurple),
          headline5: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black26),
          headline1: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.deepPurple),


        ),
      ),
      routes: {
        "AddNote": (context) => NewNote(),
        "Home": (context) => HomeMain_Screen(),
      },
      home:MyHomePage(title: 'Hello',) ,

    );
  }
}








class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5),
            ()=>Navigator.of(context).pushReplacementNamed('Home')
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery. of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home : Container(
        color: Colors.white,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset("images/logo22.png",width: 200,height: 200,),
                SizedBox(
                  height: 100,
                ),
                ElevatedButton(
                    onPressed: (){
                      Navigator.of(context).pushReplacementNamed('Home');

                    },
                    child: Container(
                      constraints: BoxConstraints(maxWidth: 300),
                      child: SizedBox(

                          width: size.width*60/100,
                          height: 40,

                          child: Center(child: Text("Get Started",style: TextStyle(fontSize: 20, color: Colors.white),))),
                    )
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}





