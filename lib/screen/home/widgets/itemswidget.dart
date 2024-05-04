import 'package:flutter/material.dart';

class ListItemWidget extends StatefulWidget {
  final String evname;
  final String status;
   final String thumbnail;
  final int maxVoltage;
  const ListItemWidget({super.key, required this.evname, required this.status, required this.thumbnail, required this.maxVoltage});

  @override
  State<ListItemWidget> createState() => _ListItemWidgetState();
}

class _ListItemWidgetState extends State<ListItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
      
         decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2), // Soft shadow for subtle distinction
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        //  border: Border.all(color: Colors.grey.withOpacity(0.3), width: 1), // Optional border
        ),
      
        child: Row(
          children: [
            
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                
                  image: DecorationImage(
                    image: NetworkImage(
                      widget.thumbnail,),
              
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.evname,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    
                    Text(
                      "Voltage: ${widget.maxVoltage}",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                   SizedBox(width: 10),
                    Container(
                      decoration: BoxDecoration(
                        color: widget.status == "AVAILABLE" ? Colors.green : Colors.orange,
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
              ],
            ),
            
      
          ],
        ),
      ),
    );
  }
}