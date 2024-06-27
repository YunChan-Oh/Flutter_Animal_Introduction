import 'package:flutter/material.dart';

class AnimalDetail extends StatefulWidget {
  final String animalName;
  final List<String> speciesOptions;
  final Function(String) onSelectSpecies;
  final Map<String, String> speciesDescriptions;
  final Map<String, String> speciesImages;

  const AnimalDetail({
    Key? key,
    required this.animalName,
    required this.speciesOptions,
    required this.onSelectSpecies,
    required this.speciesDescriptions,
    required this.speciesImages,
  }) : super(key: key);

  @override
  _AnimalDetailState createState() => _AnimalDetailState();
}

class _AnimalDetailState extends State<AnimalDetail> {
  late String selectedSpecies;
  late String selectedImage;
  late String selectedDescription;

  @override
  void initState() {
    super.initState();
    // Initialize with the first species option
    selectedSpecies = widget.speciesOptions[0];
    selectedImage = widget.speciesImages[selectedSpecies] ?? '';
    selectedDescription = widget.speciesDescriptions[selectedSpecies] ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDetailNameAndHabitat(),
              _buildDetailRatingAndReviewCount(),
              _buildDetailSpeciesOptions(),
              SizedBox(height: 20),
              _buildSelectedSpeciesImage(),
              _buildDetailDescription(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailNameAndHabitat() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.animalName,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Habitat",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRatingAndReviewCount() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Icon(Icons.star, color: Colors.yellow),
          Icon(Icons.star, color: Colors.yellow),
          Icon(Icons.star, color: Colors.yellow),
          Icon(Icons.star, color: Colors.yellow),
          Icon(Icons.star, color: Colors.yellow),
          Spacer(),
          Text("review "),
          Text("(26)", style: TextStyle(color: Colors.blue)),
        ],
      ),
    );
  }

  Widget _buildDetailSpeciesOptions() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Species Options"),
          SizedBox(height: 10),
          Wrap(
            spacing: 10,
            children: widget.speciesOptions
                .map((species) => _buildSpeciesButton(species))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildSpeciesButton(String species) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectedSpecies = species;
          selectedImage = widget.speciesImages[species] ?? '';
          selectedDescription = widget.speciesDescriptions[species] ?? '';
        });
        widget.onSelectSpecies(species);
      },
      style: ElevatedButton.styleFrom(
        primary: selectedSpecies == species ? Colors.blueAccent : Colors.grey,
      ),
      child: Text(species),
    );
  }

  Widget _buildDetailDescription() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Species Description",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            selectedDescription.isNotEmpty
                ? selectedDescription
                : 'No description available.',
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 10),
          _buildSelectedSpeciesImageInDetail(),
        ],
      ),
    );
  }

  Widget _buildSelectedSpeciesImageInDetail() {
    return selectedImage.isNotEmpty
        ? Image.asset(
            selectedImage,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          )
        : SizedBox.shrink(); // Hide if no image selected
  }

  Widget _buildSelectedSpeciesImage() {
    return selectedImage.isNotEmpty
        ? Image.asset(
            selectedImage,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          )
        : SizedBox.shrink(); // Hide if no image selected
  }
}
