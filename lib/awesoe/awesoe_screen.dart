import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:productivime/awesoe/index.dart';

class AwesoeScreen extends StatefulWidget {
  const AwesoeScreen({
    Key key,
    @required AwesoeBloc awesoeBloc,
  })  : _awesoeBloc = awesoeBloc,
        super(key: key);

  final AwesoeBloc _awesoeBloc;

  AwesoeScreenState createState() {
  @override
    return AwesoeScreenState();
  }
}

class AwesoeScreenState extends State<AwesoeScreen> {
  AwesoeScreenState();
  
  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AwesoeBloc, AwesoeState>(
        cubit: widget._awesoeBloc,
        builder: (
          BuildContext context,
          AwesoeState currentState,
        ) {
          if (currentState is UnAwesoeState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (currentState is ErrorAwesoeState) {
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(currentState.errorMessage ?? 'Error'),
                Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: RaisedButton(
                    color: Colors.blue,
                    child: Text('reload'),
                    onPressed: _load,
                  ),
                ),
              ],
            ));
          }
           if (currentState is InAwesoeState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(currentState.hello),
                ],
              ),
            );
          }
          return Center(
              child: CircularProgressIndicator(),
          );
          
        });
  }

  void _load() {
    widget._awesoeBloc.add(LoadAwesoeEvent());
  }
}
