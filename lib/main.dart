

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_block_package/CounterBloc/counter_bloc.dart';
import 'package:flutter_block_package/CounterBloc/counter_event.dart';
import 'package:flutter_block_package/CounterBloc/counter_state.dart';
import 'package:flutter_block_package/Cubit/my_theme_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyThemeCubit(),
      child: BlocBuilder<MyThemeCubit, ThemeData>(
        builder: (context,theme) => MaterialApp(
          theme: theme,
          home: BlocProvider(
          create: (context) => CounterBloc()
          ,child: MyHomePage()),
        ),
      ),
    );
  }
}





class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.brightness_6),
            onPressed: ()=> context.read<MyThemeCubit>().ThemeChange()),
      ),
      body: MyCenterWidgets(),
      floatingActionButton:FloatingActions(),



    );
  }

}

class MyCenterWidgets extends StatelessWidget {
  const MyCenterWidgets({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Build çalıştı");
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          BlocBuilder<CounterBloc, CounterState>(
            builder: (context,snapshot){
              return Text("My Counter: ${snapshot.counter}",
                style: Theme.of(context).textTheme.headline4,
              );
            },
          )

        ],
      ),
    );
  }
}

class FloatingActions extends StatelessWidget {
  const FloatingActions({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        FloatingActionButton(
          onPressed:(){
            context.read<CounterBloc>().add(Increase());
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
        SizedBox(height: 10,),
        FloatingActionButton(
          onPressed: ()=>context.read<CounterBloc>().add(Decrease()),
          tooltip: 'Decrease',
          child: Icon(Icons.remove),
        )
      ],
    );
  }
}
