import 'package:flutter/material.dart';
import 'package:flutter_animal/components/animal_detail.dart';
import 'package:flutter_animal/components/animal_header.dart';
import 'package:flutter_animal/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme(),
      home: AnimalPage(),
    );
  }
}

class AnimalPage extends StatefulWidget {
  const AnimalPage({Key? key}) : super(key: key);

  @override
  _AnimalPageState createState() => _AnimalPageState();
}

class _AnimalPageState extends State<AnimalPage> {
  int selectedAnimalId = 0;
  String selectedSpecies = '';

  final List<String> animalNames = [
    "Dog",
    "Cat",
    "Pig",
    "Bear",
  ];

  final List<List<String>> animalSpeciesOptions = [
    ["포메라니안", "푸들"],
    ["터키쉬", "페르시안"],
    ["흑돼지", "멧돼지"],
    ["판다", "북극곰"],
  ];

  final List<Map<String, String>> animalSpeciesDescriptions = [
    {
      "포메라니안": "작고 푹신한 품종으로 활발한 성격으로 알려져 있습니다.",
      "푸들": "곱슬털로 유명한 지능적이고 저자극성 품종입니다."
    },
    {
      "터키쉬": "수영 능력과 흰색 털로 유명한 품종.",
      "페르시안": "길고 고급스러운 털과 차분한 태도를 지닌 품종."
    },
    {
      "흑돼지": "검은색을 띠는 국내산 돼지 품종.",
      "멧돼지": "엄니와 뻣뻣한 털로 유명한 야생종."
    },
    {
      "판다": "독특한 흑백 털로 유명한 곰 종.",
      "북극곰": "북극 환경에 적응한 곰 종."
    },
  ];

  final List<List<String>> animalSpeciesImages = [
    ["assets/pomeranian.jpg", "assets/poodle.jpg"],
    ["assets/turkish.jpg", "assets/persian.jpg"],
    ["assets/black_pig.jpg", "assets/wild_boar.jpg"],
    ["assets/panda.jpg", "assets/polar_bear.jpg"],
  ];

  void _onSelectAnimal(int id) {
    setState(() {
      selectedAnimalId = id;
      selectedSpecies = animalSpeciesOptions[id][0];
    });
  }

  void _onSelectSpecies(String species) {
    setState(() {
      selectedSpecies = species;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAnimalAppBar(),
      body: Column(
        children: [
          AnimalHeader(onSelectAnimal: _onSelectAnimal),
          Expanded(
            child: AnimalDetail(
              animalName: animalNames[selectedAnimalId],
              speciesOptions: animalSpeciesOptions[selectedAnimalId],
              onSelectSpecies: _onSelectSpecies,
              speciesDescriptions: animalSpeciesDescriptions[selectedAnimalId],
              speciesImages: animalSpeciesImages[selectedAnimalId],
            ),
          ),
        ],
      ),
    );
  }

  AppBar _buildAnimalAppBar() {
    return AppBar(
      title: Text('Animal Details'),
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          // Handle back navigation if needed
        },
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.info),
          onPressed: () {
            // Handle info action if needed
          },
        ),
        SizedBox(width: 16),
      ],
      elevation: 0.0,
    );
  }
}
