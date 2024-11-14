import 'package:yes_no_app_jahdiel_4sa/domain/entities/message.dart';

class YesNoModel {
  final String answer;
  final bool forced;
  final String image;

  YesNoModel({
    required this.answer,
    required this.forced,
    required this.image,
  });

  factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => YesNoModel(
    answer: json["answer"],
    forced: json["forced"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "answer": answer,
    "forced": forced,
    "image": image,
  };

  // Modified to include 'timestamp'
  Message toMessageEntitie() => Message(
    text: answer == 'yes'
      ? 'Sí'
      : answer == 'no' ? 'No'
      : "Quizás",
    fromWho: FromWho.hers,
    imageUrl: image,
    timestamp: DateTime.now(), // Include the current timestamp
    // This is not necessary based on the constructor signature, so leaving it as null
  );
}
