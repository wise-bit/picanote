import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primaryColor: Color(0xffffbc4f),
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Search'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  final List<String> list = List.generate(10, (index) => "Texto $index");

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class cardObj{
  String _link;
  String _date;
  String _content;
  cardObj({String link = "textCard", String date = "Title", String content = "imageCard"}){
    this._date = date;
    this._content = content;
    this._link = link;
  }

  void set date(String theDate){
    _date = theDate;
  }
  String get date{
    return _date;
  }
  void set link(String theLink){
    _link = theLink;
  }
  String get link{
    return _link;
  }
  void set content(String theContent){
    _content = theContent;
  }
  String get content{
    return _content;
  }

  String get preview{
    if(_content.length > 320){
      return '\n' + _content.substring(0, 300) + '...';
    }
    return _content;
  }
}

class cardList{
  List<cardObj> cards = [];

  void append(cardObj card){
    cards.add(card);
  }

  cardObj getCard(int index){
    return cards[index];
  }

  List getList(){
    return cards;
  }

}

class Search extends SearchDelegate{
  @override
  List<Widget> buildActions(BuildContext context){
    return <Widget>[
      IconButton(
        icon: Icon(Icons.close),
        onPressed: (){
          query = "";
        }
      )
    ];
  }
  @override
  Widget buildLeading(BuildContext context){
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: (){
        Navigator.pop(context);
      },
    );
  }
  String res;
  @override
  Widget buildResults(BuildContext context){
    return Container(
      child: Center(
        child: Text(res),
      ),
    );
  }
  final List<cardObj> listExample;
  Search(this.listExample);

  List<String> recentList = ["English", "Math"];
  @override
  Widget buildSuggestions(BuildContext context){
    List<cardObj> suggestionList = [];
    if(query.isEmpty){
      for(int i = 0; i < listExample.length; i++){
        suggestionList.add(listExample[i]);
      }
    }
    else{
      for(int i = 0; i < listExample.length; i++){
        if(listExample[i].content == "imageCard"){
          // if imagecard
          return ListView.builder(
            itemCount: suggestionList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  suggestionList[index].date,
                ),
                onTap: (){
                  res = suggestionList[index].date;
                  showResults(context);
                },
              );
            },
          );
        }
        // if textcard
        else{
          return ListView.builder(
            itemCount: suggestionList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  suggestionList[index].date,
                ),
                onTap: (){
                  res = suggestionList[index].date;
                  showResults(context);
                },
              );
            },
          );
        }
      }
    }
  }
}


class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  cardList listCards = new cardList();

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    Widget _body(cardObj card){
      if(card.content == "imageCard"){
        return Container(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          padding: EdgeInsets.fromLTRB(10,10,10,0),
          height: 300,
          width: double.maxFinite,
          child: Card(
            elevation: 5,
            color: Color(0xffffd4a6),
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                ),
                ListTile(
                  tileColor: Color(0xffedcaa4),
                  title: Text(card._date),
                ),
                Container(
                    alignment: Alignment.center,
                    child: Container(
                      height: 226,
                      decoration: BoxDecoration(
                        color: const Color(0xff7c94b6),
                        image: DecorationImage(
                          image: NetworkImage(card._link),
                          fit: BoxFit.fitWidth,
                          alignment: Alignment.topCenter,
                        ),
                      ),
                    )
                ),
              ],

            ),
          ),
        );
      }
      else if(card.link == "textCard"){
        return Container(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          padding: EdgeInsets.fromLTRB(10,10,10,0),
          height: 200,
          width: double.maxFinite,
          child: Card(
            elevation: 5,
            color: Color(0xffffd4a6),
            child: Column(
                children: <Widget>[
                    Container(
                        alignment: Alignment.center,
                    ),
                    ListTile(
                      tileColor: Color(0xffedcaa4),
                      title: Text(card._date),
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(8.0),
                        ),
                        Flexible(
                          child:Text(
                              card.preview,
                              textAlign: TextAlign.left
                          ),
                        )

                      ]
                    )
                  ],

            ),
          ),
        );
      }

    }

    cardObj cardOwl = new cardObj(content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras euismod tristique metus, sit amet commodo ante vehicula nec. Nam finibus, augue et imperdiet porta, ante augue convallis felis, eu viverra felis elit vel erat. Cras suscipit lacus a ex placerat tempor. Duis facilisis iaculis risus dignissim molestie. Suspendisse id tortor ultrices, porta enim vitae, feugiat massa. Quisque quam mauris, vehicula in maximus nec, rhoncus sed sapien. Cras placerat, lacus vel fermentum tempus, nisi nunc vehicula orci, ut posuere ex mauris ut enim. Phasellus euismod quis risus ac varius. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur dapibus mi gravida lacus condimentum bibendum.", date: "Monday");
    cardObj coolGuy = new cardObj(link: "https://upload.wikimedia.org/wikipedia/commons/2/2c/Ice-Cube_2014-01-09-Chicago-photoby-Adam-Bielawski.jpg", date: "Ice Cube");
    listCards.append(cardOwl);
    listCards.append(coolGuy);


    final List<String> list = List.generate(10, (index) => "Text $index");
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Color(0xfffff3e6),
      body: Stack(

        children: <Widget>[
          ListView(
            padding: EdgeInsets.only(top: 80),
            children: [_body(cardOwl), _body(coolGuy)],
          ),
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: AppBar(
              // Here we take the value from the MyHomePage object that was created by
              // the App.build method, and use it to set our appbar title.
              title: Text(
                  widget.title,
                  style: TextStyle(
                  //color: Colors.white,
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              actions: <Widget>[
                IconButton(
                  //color: Colors.white,
                  onPressed:(){
                    showSearch(context: context, delegate: Search(listCards.getList()));
                  },
                  icon: Icon(Icons.search),
                )
              ],
            ),
          ),
        ]

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
