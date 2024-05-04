import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

class DetailScreen extends StatefulWidget {
  final String name;
  final String imageurl;
  final double longitude;
  final double latitude;
  final int maxpower;
  final String evseid;
  final String status;

  const DetailScreen(
      {super.key,
      required this.name,
      required this.imageurl,
      required this.longitude,
      required this.latitude,
      required this.maxpower,
      required this.evseid,
      required this.status});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  String _address = "Address Loading..."; // Default address

  // Function to fetch address using latitude and longitude
  Future<void> getAddressFromLatLng(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
      Placemark place = placemarks[0]; // Using the first result
      setState(() {
        _address =
            "${place.street}, ${place.locality}, ${place.postalCode}, ${place.country}";
      });
    } catch (e) {
      setState(() {
        _address = "Failed to get address: $e";
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getAddressFromLatLng(widget.latitude, widget.longitude);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.evseid.toUpperCase(),
            style: TextStyle(color: Colors.black, fontSize: 15)),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              onPrimary: Colors.black,
            ),
            child: Text(
              "Help",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    color: Colors.blue,
                    child: Center(
                      child: Text(
                        "Charge Here",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(widget.imageurl)),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Icon(Icons.local_gas_station),
                SizedBox(width: 10),
                Text(
                  widget.evseid.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  Text(
                    widget.name,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.2,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite, color: Colors.red),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Icon(Icons.location_on),
                SizedBox(width: 10),
                Flexible(
                  child: Text(
                    _address,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Icon(Icons.access_time),
                SizedBox(width: 10),
                Text("Open . 24 hours",
                    style: TextStyle(color: Colors.green, fontSize: 12)),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Icon(Icons.battery_charging_full),
                SizedBox(width: 10),
                Text("Type 2  . ${widget.maxpower} kW",
                    style: TextStyle(color: Colors.green, fontSize: 12)),
                SizedBox(width: 10),
                Container(
                  decoration: BoxDecoration(
                    color: widget.status == "AVAILABLE"
                        ? Colors.green
                        : const Color.fromARGB(255, 253, 232, 46),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.status,
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Icon(Icons.attach_money),
                Text("0.25/kWh", style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width * 0.34,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Row(
                      children: [
                        Transform.rotate(
                          angle: 45 * (300 / 180),
                          child: Icon(
                            Icons.navigation,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text("Navigate", style: TextStyle(fontSize: 15)),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width * 0.34,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.share,
                        ),
                        SizedBox(width: 10),
                        Text("Share", style: TextStyle(fontSize: 15)),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
