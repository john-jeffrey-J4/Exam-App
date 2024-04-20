import 'package:flutter/material.dart';

class ShowAnswerWidget extends StatefulWidget {
  const ShowAnswerWidget(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;

  @override
  State<ShowAnswerWidget> createState() => _ShowAnswerWidgetState();
}

class _ShowAnswerWidgetState extends State<ShowAnswerWidget> {
  @override
  Widget build(BuildContext context) {
    final showData = widget.summaryData;
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: showData.map(
            (data) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 30.0,
                    height: 30.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: data["correct_answer"] == data["user_answer"]
                          ? Colors.blue
                          : Colors.purple,
                    ),
                    child: Center(
                      child: Text(
                        ((data["question_index"] as int) + 1).toString(),
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textField(
                          data["question"].toString(),
                          Colors.white,
                          18,
                        ),
                        textField(
                          data["correct_answer"].toString(),
                          Colors.purple,
                        ),
                        textField(
                          data["user_answer"].toString(),
                          Colors.blue,
                        ),
                      ],
                    ),
                  )
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}

textField(String data, Color fontColor, [double fontize = 15]) {
  return Text(
    data,
    style: TextStyle(color: fontColor, fontSize: fontize),
  );
}
