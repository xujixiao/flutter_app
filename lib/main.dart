import 'package:flutter/material.dart';

/*添加对应的依赖项目*/
import 'package:english_words/english_words.dart';

import 'ClickWidget.dart';
import 'TextWidget.dart';
import 'storage/StorageUtils.dart';

//void main() => runApp(CustomApp());
//void main() => runApp(ListViewApp());

//void main() => runApp(TextWidgetApp());
//void main() => runApp(ClickWidget());

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.blue,
      textSelectionColor: Colors.red,
    ),
    home: MainViewApp(),
    routes: <String, WidgetBuilder>{
      '/goListView': (BuildContext context) => ListViewApp(),
      '/goTextView': (BuildContext context) => CustomApp(),
      '/goFlutterApp': (BuildContext context) => ClickWidget(),
    },
  ));
}

class TestMainViewApp extends StatelessWidget {
  TextStyle getDefaultTextStyle() {
    return TextStyle(color: Colors.red, fontSize: 20);
  }

  Widget getTextWidget() {
    return Container(
      padding: EdgeInsets.all(18.0),
      child: Card(
        margin: EdgeInsets.all(38.0),
        color: Colors.blue,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.3))),
        child: Text('hello world', style: getDefaultTextStyle()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'flutter study',
      home: Scaffold(
          appBar: AppBar(
            title: Text('flutter study'),
          ),
          body: new Center(
            child: Column(
              children: <Widget>[
                Text(
                  '测试',
                  style: getDefaultTextStyle(),
                ),
                getTextWidget(),
              ],
            ),
          )),
    );
  }
}

class MainViewApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '测试一个新的布局',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textSelectionColor: Colors.red,
        backgroundColor: Colors.white,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('第一个flutter项目'),
          backgroundColor: Colors.blue,
        ),
        bottomNavigationBar: BottomNavigationBar(
            items:const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.star),
                title:Text('我的'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('你的')
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.update),
                title: Text('flutter')
              )
            ]
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            MaterialButton(
              child: Text(
                '跳转listview',
                style: TextStyle(fontSize: 18, color: Colors.red),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed("/goListView");
              },
            ),
            MaterialButton(
              child: Text(
                'goTextView',
                style: TextStyle(fontSize: 18, color: Colors.red),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed("/goTextView");
                print("click");
              },
            ),
            MaterialButton(
              child: Text(
                'goFlutterApp',
                style: TextStyle(fontSize: 18, color: Colors.red),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return Scaffold(
                    appBar: AppBar(
                      title: Text('my page'),
                    ),
                    body: Center(
                      child: FlatButton(
                          onPressed: () {
                            print('xujixiao');
                          },
                          child: Text('pop')),
                    ),
                  );
                }));
              },
            ),
            Text(
              '中华人民共和国',
              style: TextStyle(fontSize: 19),
            ),
            Icon(
              Icons.star,
              color: Colors.red[500],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  '测试代码',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'roboto',
                    letterSpacing: 0.5,
                    fontSize: 20,
                  ),
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.end,
                ),
                GestureDetector(
                  onTap: () {
                    print("徐继晓点击了row 中的gesture控件");
                    StorageUtils.set("name", "xujixiao");
                  },
                  onLongPress: () {
                    getdata() async {
                      String token = await StorageUtils.get("name");
                      print(token);
                    }

                    getdata();
                  },
                  child: Container(
                    height: 39,
//                padding: const EdgeInsets.all(8.0),
//                margin: const EdgeInsets.symmetric(horizontal: 8),
                    child: Center(
                      child: Text(
                        "点击一下",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: new Text('我是一段文本'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ListViewApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '这是一个listview',
      home: RandomWords(),
    );
  }
}

/// 创建动态的控件类型
class RandomWordState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    color: Colors.blue,
  );

  @override
  Widget build(BuildContext context) {
    /*生成的常规字符串textview*/
//    final wordPair = WordPair.random();
//    return Text(wordPair.asPascalCase);

    return Scaffold(
      appBar: AppBar(
        title: Text('this is listview'),
      ),
      body: _buildSuggestions(),
    );
  }

  /// 创建listview的widget
  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) {
            return Divider();
          }
          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  ///  创建单行的widget控件
  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Text(
            pair.asPascalCase,
            style: _biggerFont,
          ),
          Column(
            children: <Widget>[
              Text(
                '徐继晓',
                style: TextStyle(fontSize: 20, color: Colors.red),
              ),
              Text(
                '徐继晓',
                style: TextStyle(fontSize: 20, color: Colors.red),
              ),
            ],
          )
        ],
      ),
      onTap: () {
        print("徐继晓点击了一下");
      },
      onLongPress: () {
        print("徐继晓长安了一下");
      },
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  State createState() {
    return RandomWordState();
  }
}

/// 添加固定状态的控件类型
class CustomApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'welcom to flutter app',
      home: Scaffold(
        appBar: AppBar(
          title: Text('welcom to my app'),
        ),
        body: Center(
//          child: Text('helloworld '),

//          /*创建动态的控件*/
          child: RandomWords(),
//
        ),
      ),
    );
  }
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
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

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
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
