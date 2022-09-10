import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // このウィジェットは、アプリケーションのルートとなるものです。
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // これがあなたのアプリケーションのテーマです。

        // アプリケーションを "flutter run "で実行してみてください。アプリケーションに青いツールバーがあるのがわかると思います。
        // アプリケーションに青いツールバーがあることがわかります。次に、アプリを終了させずに、次のことを試してみてください。
        // Colors.greenに変更し、"hot reload "を実行します。
        // "hot reload "を実行してみてください（"flutter run "を実行したコンソールで "r "を押してください。
        // または、Flutter IDEで "hot reload "するために変更を保存するだけです）。
        // カウンターはゼロにリセットされないことに注意してください。
        // 再起動されていないことに注意してください。
        // primarySwatch: 色.青,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
    // このウィジェットは、アプリケーションのトップページとなります。このウィジェットはステートフルです。
    // というのは、Stateオブジェクト(以下で定義)を持ち、このオブジェクトには、このウィジェットがどのように見えるかに影響を与えるフィールドが含まれているからです。

    // このクラスは、ステートの設定です。このクラスは、親クラスから提供された値 (この場合、タイトル) を保持します。
    // 親ウィジェット（この場合はアプリウィジェット）から提供され、Stateのビルドメソッドで使用される値（この場合はタイトル）を保持します。
    // ビルドメソッドで使用される値（この場合はタイトル）を保持します。Widgetのサブクラス内のフィールドは
    // 常に "final "とマークされます。
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // このsetStateの呼び出しは、Flutterフレームワークに、このStateに何か変更があったことを伝えます。
      // このStateに何か変更があったことをFlutterフレームワークに伝え、以下のbuildメソッドを再実行させ、ディスプレイに更新された値を反映させます。
      // 再実行し、表示に更新された値を反映させます。もし、setState()を呼ばずに
      // 変更した場合、buildメソッドは再コールされないので、何も表示されません。
      // 呼び出さずに_counterを変更した場合、ビルドメソッドは再度呼び出されないため、何も起こらないように見えます。
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
      // このメソッドはsetStateが呼ばれるたびに再実行されます、例えば上記の_incrementCounterメソッドで行われたように
      // が呼ばれるたびに再実行されます。

      // Flutterフレームワークは、ビルドメソッドの再実行が高速になるように最適化されています。
      // 更新が必要なものをすべてリビルドすればよいので、Flutterフレームワークはビルドメソッドの再実行が高速になるように最適化されています。
      // そのため、ウィジェットのインスタンスを個別に変更する必要がなく、更新が必要なものを再構築するだけです。
    return Scaffold(
      appBar: AppBar(
        // ここでは、App.buildメソッドで作成されたMyHomePageオブジェクトから値を取得し、アプリバーのタイトルを設定しています。
        // App.buildメソッドによって作成されたMyHomePageオブジェクトから値を取得し、それを使用してappbarのタイトルを設定しています。
        title: Text(widget.title),
      ),
      body: Center(
        // Center は、レイアウトウィジェットです。子要素を1つ取り、それを親の中央に配置します。
        child: Column(
          // Columnもレイアウトウィジェットです。子要素のリストを受け取り、それらを縦に並べます。
          // デフォルトでは、子ウィジェットの水平方向に合わせてサイズを調整し、親ウィジェットの高さと同じになるようにします。

          // デバッグペイント」（コンソールで「p」を押す、Android Studio の Flutter Inspector で「デバッグペイントの切り替え」アクションを選ぶ、
          // または Visual Studio Code の「デバッグペイントの切り替え」コマンド）を実行すると、各ウィジェットのワイヤーフレームが表示されます。

          // Columnには様々なプロパティがあり、自身のサイズや子ウィジェットの位置を制御することができます。
          // ここでは、mainAxisAlignmentを使用して、子ウィジェットを垂直方向にセンタリングしています。列は垂直なので、主軸は垂直軸です（横軸は 水平）。
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // この末尾のカンマは、ビルドメソッドの自動書式化を円滑にするものです。
    );
  }
}
