import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:diet_and_teeth_app/diets_dashboard/models/daily_diet_model.dart';
import 'package:diet_and_teeth_app/diets_dashboard/ui/cario_chart_widget.dart';
import 'package:diet_and_teeth_app/diets_dashboard/ui/daily_diet_list_widget.dart';
import 'package:diet_and_teeth_app/diets_dashboard/ui/modal_bottom_sheet_widget.dart';
import 'package:diet_and_teeth_app/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DietsScreen extends StatefulWidget {
  @override
  _DietsScreenState createState() => _DietsScreenState();
}

class _DietsScreenState extends State<DietsScreen> {
  void _startAddingNewDaylyDiet(BuildContext context) {
    var _database = Provider.of<Database>(context, listen: false);
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return MultiProvider(
          providers: [
            Provider(
              create: (ctx) => DailyDiet(),
            ),
            Provider<Database>.value(value: _database),
          ],
          child: ModalBottomSheetWidget(),
        );
      },
    );
  }

  StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    final _connectivity = Provider.of<Connectivity>(context, listen: false);
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen((_) {
      setState(() {});
    });
  }

  @override
  dispose() {
    super.dispose();
    _connectivitySubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Suas Dietas',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            fontFamily: 'KidsHandwriting',
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final availableSize = constraints.maxHeight;
          return Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: _buildFloatingActionButton(context),
            body: DietsPageBody(
              availableSize: availableSize,
            ),
          );
        },
      ),
    );
  }

  Widget _buildFloatingActionButton(BuildContext context) {
    final _connectivity = Provider.of<Connectivity>(context, listen: false);
    return FutureBuilder<ConnectivityResult>(
        future: _connectivity.checkConnectivity(),
        builder: (context, snapshot) {
          switch (snapshot.data) {
            case ConnectivityResult.mobile:
            case ConnectivityResult.wifi:
              return FloatingActionButton(
                child: Icon(Icons.restaurant),
                onPressed: () {
                  _startAddingNewDaylyDiet(context);
                },
              );
              break;
            case ConnectivityResult.none:
              return Container();
              break;
            default:
              return Container();
          }
        });
  }
}

class DietsPageBody extends StatefulWidget {
  DietsPageBody({
    Key key,
    @required this.availableSize,
  }) : super(key: key);

  final double availableSize;

  @override
  _DietsPageBodyState createState() => _DietsPageBodyState();
}

class _DietsPageBodyState extends State<DietsPageBody> {
  StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    final _connectivity = Provider.of<Connectivity>(context, listen: false);
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen((_) {
      setState(() {});
    });
  }

  @override
  dispose() {
    super.dispose();
    _connectivitySubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final _connectivity = Provider.of<Connectivity>(context, listen: false);
    return FutureBuilder<ConnectivityResult>(
      future: _connectivity.checkConnectivity(),
      builder: (context, AsyncSnapshot<ConnectivityResult> snapshot) {
        switch (snapshot.data) {
          case ConnectivityResult.mobile:
          case ConnectivityResult.wifi:
            // return normal content
            return Container(
              height: widget.availableSize,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: widget.availableSize * 0.3,
                    child: CarioChartWidget(),
                  ),
                  SizedBox(
                    height: widget.availableSize * 0.01,
                  ),
                  Container(
                    height: widget.availableSize * 0.65,
                    child: DailyDietListWidget(),
                  )
                ],
              ),
            );
            break;
          case ConnectivityResult.none:
            //return Widget No internet connection
            return Container(
              height: widget.availableSize,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      'Sem Internet!!!',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'KidsHandwriting',
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Image.asset("assets/images/shrug.png"),
                    height: widget.availableSize * 0.25,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      'Conecte-se para poder criar, editar ou visualizar suas dietas.',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'KidsHandwriting',
                      ),
                    ),
                  ),
                ],
              ),
            );
            break;
          default:
            return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
