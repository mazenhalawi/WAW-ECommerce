import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waw_app/Blocs/HomeBloc.dart';
import 'package:waw_app/Views/Alert.dart';

class HomeScene extends StatefulWidget {
  static const SceneName = 'HomeScene';

  @override
  _HomeSceneState createState() => _HomeSceneState();
}

class _HomeSceneState extends State<HomeScene>
    with AutomaticKeepAliveClientMixin<HomeScene> {
  HomeBloc _bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_bloc == null) {
      _bloc = Provider.of<HomeBloc>(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    _bloc.getCampaigns();
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(250, 247, 250, 1),
        child: RefreshIndicator(
          onRefresh: () => _bloc.getCampaigns(),
          child: StreamBuilder(
            stream: _bloc.campaign$,
            builder:
                (BuildContext context, AsyncSnapshot<List<Campaign>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                Alert(
                        context: context,
                        title: 'Failure',
                        content: snapshot.error)
                    .show();
              } else if (!snapshot.hasData) {
                Alert(
                        context: context,
                        title: 'No Data Found',
                        content: 'No data found. Please try again.')
                    .show();
              } else if (snapshot.hasData) {
                final campaigns = snapshot.data;
                return ListView(
                  children: campaigns.map((e) => Text(e.product.name)).toList(),
                );
              }

              return Container();
            },
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
