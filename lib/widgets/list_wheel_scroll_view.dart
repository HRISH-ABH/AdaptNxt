import 'package:flutter/material.dart';

class ListWheelScroll extends StatefulWidget {
  final List<String> items;
  final ValueChanged<String> onSelected;

  const ListWheelScroll({
    Key? key,
    required this.items,
    required this.onSelected,
  }) : super(key: key);

  @override
  _ListWheelScrollState createState() => _ListWheelScrollState();
}

class _ListWheelScrollState extends State<ListWheelScroll> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
   
    final Color backgroundColor = Colors.white; 

    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        scrolledUnderElevation: 0,
      ),
      backgroundColor: backgroundColor, 
      body: Container(
        decoration: BoxDecoration(
          color: backgroundColor, 
          borderRadius: BorderRadius.circular(15.0), 
        ),
        padding: const EdgeInsets.symmetric(vertical: 20), 
        height: 250, 
        child: ListWheelScrollView.useDelegate(
          itemExtent: 50, 
          diameterRatio:2.5, 
          physics:const  FixedExtentScrollPhysics(),
          onSelectedItemChanged: (index) {
            setState(() {
              _selectedIndex = index;
              widget.onSelected(widget.items[index]);
            });
          },
          childDelegate: ListWheelChildBuilderDelegate(
            builder: (context, index) {
              return Column(
                children: [
                  Text(
                    widget.items[index],
                    style: TextStyle(
                      fontSize: 20, 
                      color: _selectedIndex == index
                          ? Colors.black 
                          : Colors.grey, 
                      fontWeight: _selectedIndex == index
                          ? FontWeight.bold
                          : FontWeight.normal,
                      decoration: TextDecoration.none, 
                    ),
                  ),
                  if (index != widget.items.length - 1) 
                    Container(
                      width: 80, 
                      margin: const EdgeInsets.only(top: 4.0),
                      child: Divider(
                        color: Colors.grey.withOpacity(0.5),
                        thickness: 0.5, 
                      ),
                    ),
                ],
              );
            },
            childCount: widget.items.length,
          ),
        ),
      ),
    );
  }
}
