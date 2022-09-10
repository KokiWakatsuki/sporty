import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // ���̃E�B�W�F�b�g�́A�A�v���P�[�V�����̃��[�g�ƂȂ���̂ł��B
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // ���ꂪ���Ȃ��̃A�v���P�[�V�����̃e�[�}�ł��B

        // �A�v���P�[�V������ "flutter run "�Ŏ��s���Ă݂Ă��������B�A�v���P�[�V�����ɐ��c�[���o�[������̂��킩��Ǝv���܂��B
        // �A�v���P�[�V�����ɐ��c�[���o�[�����邱�Ƃ��킩��܂��B���ɁA�A�v�����I���������ɁA���̂��Ƃ������Ă݂Ă��������B
        // Colors.green�ɕύX���A"hot reload "�����s���܂��B
        // "hot reload "�����s���Ă݂Ă��������i"flutter run "�����s�����R���\�[���� "r "�������Ă��������B
        // �܂��́AFlutter IDE�� "hot reload "���邽�߂ɕύX��ۑ����邾���ł��j�B
        // �J�E���^�[�̓[���Ƀ��Z�b�g����Ȃ����Ƃɒ��ӂ��Ă��������B
        // �ċN������Ă��Ȃ����Ƃɒ��ӂ��Ă��������B
        // primarySwatch: �F.��,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
    // ���̃E�B�W�F�b�g�́A�A�v���P�[�V�����̃g�b�v�y�[�W�ƂȂ�܂��B���̃E�B�W�F�b�g�̓X�e�[�g�t���ł��B
    // �Ƃ����̂́AState�I�u�W�F�N�g(�ȉ��Œ�`)�������A���̃I�u�W�F�N�g�ɂ́A���̃E�B�W�F�b�g���ǂ̂悤�Ɍ����邩�ɉe����^����t�B�[���h���܂܂�Ă��邩��ł��B

    // ���̃N���X�́A�X�e�[�g�̐ݒ�ł��B���̃N���X�́A�e�N���X����񋟂��ꂽ�l (���̏ꍇ�A�^�C�g��) ��ێ����܂��B
    // �e�E�B�W�F�b�g�i���̏ꍇ�̓A�v���E�B�W�F�b�g�j����񋟂���AState�̃r���h���\�b�h�Ŏg�p�����l�i���̏ꍇ�̓^�C�g���j��ێ����܂��B
    // �r���h���\�b�h�Ŏg�p�����l�i���̏ꍇ�̓^�C�g���j��ێ����܂��BWidget�̃T�u�N���X���̃t�B�[���h��
    // ��� "final "�ƃ}�[�N����܂��B
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // ����setState�̌Ăяo���́AFlutter�t���[�����[�N�ɁA����State�ɉ����ύX�����������Ƃ�`���܂��B
      // ����State�ɉ����ύX�����������Ƃ�Flutter�t���[�����[�N�ɓ`���A�ȉ���build���\�b�h���Ď��s�����A�f�B�X�v���C�ɍX�V���ꂽ�l�𔽉f�����܂��B
      // �Ď��s���A�\���ɍX�V���ꂽ�l�𔽉f�����܂��B�����AsetState()���Ă΂���
      // �ύX�����ꍇ�Abuild���\�b�h�͍ăR�[������Ȃ��̂ŁA�����\������܂���B
      // �Ăяo������_counter��ύX�����ꍇ�A�r���h���\�b�h�͍ēx�Ăяo����Ȃ����߁A�����N����Ȃ��悤�Ɍ����܂��B
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
      // ���̃��\�b�h��setState���Ă΂�邽�тɍĎ��s����܂��A�Ⴆ�Ώ�L��_incrementCounter���\�b�h�ōs��ꂽ�悤��
      // ���Ă΂�邽�тɍĎ��s����܂��B

      // Flutter�t���[�����[�N�́A�r���h���\�b�h�̍Ď��s�������ɂȂ�悤�ɍœK������Ă��܂��B
      // �X�V���K�v�Ȃ��̂����ׂă��r���h����΂悢�̂ŁAFlutter�t���[�����[�N�̓r���h���\�b�h�̍Ď��s�������ɂȂ�悤�ɍœK������Ă��܂��B
      // ���̂��߁A�E�B�W�F�b�g�̃C���X�^���X���ʂɕύX����K�v���Ȃ��A�X�V���K�v�Ȃ��̂��č\�z���邾���ł��B
    return Scaffold(
      appBar: AppBar(
        // �����ł́AApp.build���\�b�h�ō쐬���ꂽMyHomePage�I�u�W�F�N�g����l���擾���A�A�v���o�[�̃^�C�g����ݒ肵�Ă��܂��B
        // App.build���\�b�h�ɂ���č쐬���ꂽMyHomePage�I�u�W�F�N�g����l���擾���A������g�p����appbar�̃^�C�g����ݒ肵�Ă��܂��B
        title: Text(widget.title),
      ),
      body: Center(
        // Center �́A���C�A�E�g�E�B�W�F�b�g�ł��B�q�v�f��1���A�����e�̒����ɔz�u���܂��B
        child: Column(
          // Column�����C�A�E�g�E�B�W�F�b�g�ł��B�q�v�f�̃��X�g���󂯎��A�������c�ɕ��ׂ܂��B
          // �f�t�H���g�ł́A�q�E�B�W�F�b�g�̐��������ɍ��킹�ăT�C�Y�𒲐����A�e�E�B�W�F�b�g�̍����Ɠ����ɂȂ�悤�ɂ��܂��B

          // �f�o�b�O�y�C���g�v�i�R���\�[���Łup�v�������AAndroid Studio �� Flutter Inspector �Łu�f�o�b�O�y�C���g�̐؂�ւ��v�A�N�V������I�ԁA
          // �܂��� Visual Studio Code �́u�f�o�b�O�y�C���g�̐؂�ւ��v�R�}���h�j�����s����ƁA�e�E�B�W�F�b�g�̃��C���[�t���[�����\������܂��B

          // Column�ɂ͗l�X�ȃv���p�e�B������A���g�̃T�C�Y��q�E�B�W�F�b�g�̈ʒu�𐧌䂷�邱�Ƃ��ł��܂��B
          // �����ł́AmainAxisAlignment���g�p���āA�q�E�B�W�F�b�g�𐂒������ɃZ���^�����O���Ă��܂��B��͐����Ȃ̂ŁA�厲�͐������ł��i������ �����j�B
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
      ), // ���̖����̃J���}�́A�r���h���\�b�h�̎������������~���ɂ�����̂ł��B
    );
  }
}
