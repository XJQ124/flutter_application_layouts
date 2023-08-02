import 'package:flutter/material.dart'; //导入Flutter的material包，包含用于构建Material Design风格应用程序的工具和小部件。

void main() => runApp(const MyApp());

//void main（）是flutter应用程序的入口
//箭头是一个单函数表达式
class MyApp extends StatelessWidget {
  //StatelessWidget它是一个不可变的小部件，不能根据内部状态更改，然后这个MyApp继承这个类，有它的特性
  const MyApp({super.key}); //const 表示这是一个常量构造函数，Flutter中的常量构造函数在创建小部件时可以提供性能优势。
  //通过const进行初始化。({super.key}) 是构造函数的参数列表。在这里，super.key 是一个命名参数。命名参数用花括号 {} 括起来，并且以 参数名: 参数值 的形式传递。
  //super 是指对父类的引用
  //key 是 StatelessWidget 类的一个属性，它用于标识小部件，并在小部件树中进行识别和管理。key 是 Key 类型的对象。
  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32), //padding：内边距，然后与外面保持32像素的距离
      child: Row(
        children: [
          Expanded(
            //让expanded在Row中占据可用空间。
            /*1*/
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, //用于指定在交叉轴方向上子组件的对齐方式。
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(
                      bottom: 8), //EdgeInsets是一个边距类，用于指定上下左右的边距大小
                  //这个地方是在底部添加一个8像素的内边距，其他方向设置为默认值
                  child: const Text(
                    'Oeschinen Lake Campground',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          /*3*/
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          const Text('41'),
        ],
      ),
    );
    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );
    //下面是文本部分的内容
    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: const Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
        'Alps. Situated 1,578 meters above sea level, it is one of the '
        'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
        'half-hour walk through pastures and pine forest, leads you to the '
        'lake, which warms to 20 degrees Celsius in the summer. Activities '
        'enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true,
      ),
    );

    return MaterialApp(
      //MaterialApp 是根级别的小部件，用于配置材料设计应用程序的基本结构。
      //这是在Flutter中启动应用程序的函数
      title: 'Flutter layout demo',
      home: Scaffold(
        //使用 Scaffold 小部件作为主屏幕
        appBar: AppBar(
          //最上方的那个
          title: const Text('Flutter layout demo'),
        ),
        body: ListView(
          //与上面对应
          children: [
            Image.asset('images/lake.jpg',
                width: 600, height: 240, fit: BoxFit.cover),
            titleSection,
            buttonSection, //将按钮部分添加到正文当中
            textSection, //将文本部分写入正文
          ],
        ),
      ),
    );
  }

  //下面是实现按钮行
  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
