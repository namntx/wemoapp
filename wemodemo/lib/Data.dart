import 'package:flutter/material.dart';
import 'model/Client.dart';
import 'Contans.dart';

class WemoApp extends StatefulWidget {
  //
  WemoApp() : super();
 
  final String title = 'Flutter Data Table';
 
  @override
  WemoAppState createState() => WemoAppState();
}

class WemoAppState extends State<WemoApp> {

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

  List<Client> _clients;
  GlobalKey<ScaffoldState> _scaffoldKey;
  @override
  void initState() {
    super.initState();
    _clients = [];
    _scaffoldKey = GlobalKey();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _refreshIndicatorKey.currentState.show());
    _getClients();
  }
 
  _getClients() {
    Contans.getClients().then((clients) {
      setState(() {
        _clients = clients;
      });
    });
  }

  Future<Null> _refresh() {
    return Contans.getClients().then((clients) {
      setState(() => _clients = clients);
    });
  }

  SingleChildScrollView _dataBody() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: [
            DataColumn(
              label: Text('FULL NAME'),
            ),
            DataColumn(
              label: Text('ADDRESS'),
            ),
            DataColumn(
              label: Text('PHONE'),
            )
          ],
          rows: _clients
              .map(
                (client) => DataRow(cells: [
                  DataCell(
                    Text(
                      client.fullName.toUpperCase(),
                    )
                  ),
                  DataCell(
                    Text(
                      client.addR.toUpperCase(),
                    )
                  ),
                  DataCell(
                    Text(
                      client.numPhone.toUpperCase(),
                    )
                  )
                ]),
              )
              .toList(),
        ),
      ),
    );
  }
 
  // UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("WEMO APP"),
        actions: <Widget>[
          new IconButton(
              icon: const Icon(Icons.refresh),
              tooltip: 'Refresh',
              onPressed: () {
                _refreshIndicatorKey.currentState.show();
              }),
        ],
      ),
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: _refresh,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: _dataBody(),
            ),
          ],
        ),
      )
    );
  }


}

