import 'package:flutter/material.dart';

class AnimalHeader extends StatefulWidget {
  final Function(int) onSelectAnimal;

  const AnimalHeader({Key? key, required this.onSelectAnimal}) : super(key: key);

  @override
  State<AnimalHeader> createState() => _AnimalHeaderState();
}

class _AnimalHeaderState extends State<AnimalHeader> {
  int selectedId = 0;

  List<String> selectedPic = [
    "assets/dog.jpg",
    "assets/cat.jpg",
    "assets/pig.jpg",
    "assets/bear.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildHeaderPic(),
        _buildHeaderSelector(),
      ],
    );
  }

  Widget _buildHeaderPic() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: AspectRatio(
        aspectRatio: 5 / 3,
        child: Image.asset(
          selectedPic[selectedId],
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildHeaderSelector() {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildHeaderSelectorButton(0, Icons.pets),
          _buildHeaderSelectorButton(1, Icons.pets),
          _buildHeaderSelectorButton(2, Icons.pets),
          _buildHeaderSelectorButton(3, Icons.pets),
        ],
      ),
    );
  }

  Widget _buildHeaderSelectorButton(int id, IconData mIcon) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: id == selectedId ? Colors.blueAccent : Colors.grey,
        borderRadius: BorderRadius.circular(20),
      ),
      child: IconButton(
        icon: Icon(mIcon, color: Colors.black),
        onPressed: () {
          setState(() {
            selectedId = id;
          });
          widget.onSelectAnimal(id);
        },
      ),
    );
  }
}
