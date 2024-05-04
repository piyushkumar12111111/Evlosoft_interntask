import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../block/evse_block.dart';
import '../../block/evse_event.dart';
import '../../block/evse_state.dart';
import '../details/detailscreen.dart';
import 'widgets/itemswidget.dart';
import 'widgets/searchbox.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.read<EVSEBloc>().add(FetchEVSEEvent());

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              SearchWidget(),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Nearby Charges (24)",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              BlocBuilder<EVSEBloc, EVSEState>(
                builder: (context, state) {
                  if (state is EVSELoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is EVSELoaded) {
                    return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.evses.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailScreen(
                                      name: state.evses[index].evseName,
                                      imageurl: state.evses[index].thumbnail,
                                      evseid: state.evses[index].evseid,
                                      latitude: state.evses[index].latitude,
                                      longitude: state.evses[index].longitude,
                                      maxpower: state.evses[index].maxVoltage,
                                      status: state.evses[index].status)),
                            );
                          },
                          child: ListItemWidget(
                            thumbnail: state.evses[index].thumbnail,
                            evname: state.evses[index].evseName,
                            status: state.evses[index].status,
                            maxVoltage: state.evses[index].maxVoltage,
                          ),
                        );
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
            ],
          ),
        ),
      ),
    );
  }
}
