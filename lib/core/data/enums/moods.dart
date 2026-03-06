enum Moods {
  happy(
    assetName: 'assets/images/mood/happy.svg',
    label: "Happy",
    tags: [
      "happiness",
      "gratitude",
      "friendship",
      "love",
      "life",
      "harmony"
    ],
    description: "Feeling good and positive"
  ),
  sad(
    assetName: 'assets/images/mood/sad.svg',
    label: "Sad",
    tags: [
      "hope",
      "resilience",
      "love",
      "friendship",
      "life",
      "forgiveness",
      "gratitude"
    ],
    description: "Feeling down or melancholy"
  ),
  angry(
    assetName: 'assets/images/mood/angry.svg',
    label: "Angry",
    tags: [
      "anger",
      "patience",
      "forgiveness",
      "empathy",
      "wisdom",
      "justice",
      "integrity"
    ],
    description: "Something is bothering you"
  ),
  overwhelmed(
    assetName: 'assets/images/mood/overwhelmed.svg',
    label: "Overwhelmed",
    tags: [
      "mindfulness",
      "patience",
      "hope",
      "resilience",
      "life",
      "self-reflection"
    ],
    description: "Too many things going on at once"
  ),
  confused(
    assetName: 'assets/images/mood/confused.svg',
    label: "Confused",
    tags: [
      "wisdom",
      "knowledge",
      "self-reflection",
      "purpose",
      "life",
      "growth"
    ],
    description: "Feeling lost and confused"
  ),
  inspired(
    assetName: 'assets/images/mood/inspired.svg',
    label: "Inspired",
    tags: [
      "motivation",
      "inspiration",
      "success",
      "leadership",
      "growth",
      "courage",
      "perseverance",
      "creativity",
      "change"
    ],
    description: "Ready to achieve something"
  ),
  calm(
    assetName: 'assets/images/mood/calm.svg',
    label: "Calm",
    tags: [
      "mindfulness",
      "harmony",
      "gratitude",
      "wisdom",
      "life",
      "humility"
    ],
    description: "Calm and relaxed"
  );

  final String assetName;
  final String label;
  final List<String> tags;
  final String description;

  const Moods({
    required this.assetName,
    required this.label,
    required this.tags,
    required this.description
  });
}