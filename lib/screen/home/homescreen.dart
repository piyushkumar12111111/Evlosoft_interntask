import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../block/evse_block.dart';
import '../../block/evse_event.dart';
import '../../block/evse_state.dart';
import 'widgets/itemswidget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.read<EVSEBloc>().add(FetchEVSEEvent());

    return Scaffold(
      appBar: AppBar(title: Text("EVSE List")),
      body: BlocBuilder<EVSEBloc, EVSEState>(
        builder: (context, state) {
          if (state is EVSELoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is EVSELoaded) {
            return ListView.builder(
              itemCount: state.evses.length,
              itemBuilder: (context, index) {

                return ListItemWidget( thumbnail: state.evses[index].thumbnail,evname: state.evses[index].evseName, status: state.evses[index].status,maxVoltage: state.evses[index].maxVoltage,);
                // return ListTile(
                //   title: Text(state.evses[index].evseName),
                //   subtitle: Text("Status: ${state.evses[index].status}"),
                // );
              },
            );
          } else if (state is EVSEError) {
            return Center(child: Text(state.message));
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
