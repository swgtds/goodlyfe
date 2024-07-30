import 'package:flutter/material.dart';
import 'package:goodlyfe/models/questions.dart';
import 'package:goodlyfe/widgets/answer_card.dart';
import 'package:goodlyfe/widgets/next_button.dart';
import 'package:goodlyfe/screens/result_screen.dart';
class GhqScreen extends StatefulWidget {
    const GhqScreen({super.key});

    @override
    State< GhqScreen> createState() => _GhqScreenState();
}

class _GhqScreenState extends State< GhqScreen> {

    int? selectedAnswerIndex;
    int questionIndex = 0;
    int stress = 0;
    int adp = 0;
    int confidence = 0;

    void pickAnswer(int value) {
    setState(() {
        selectedAnswerIndex = value;
        //final question = questions[questionIndex];
        // ignore: unrelated_type_equality_checks
       if(questionIndex>=0 && questionIndex<=5) {
        if (selectedAnswerIndex == 0) {
        stress=0;
        }
        if (selectedAnswerIndex == 1) {
        stress++;
        }
        if (selectedAnswerIndex == 2) {
        stress+=2;
        }
        if (selectedAnswerIndex == 3) {
        stress+=3;
        }
       }
      else if(questionIndex>=6 && questionIndex<=9){
         if (selectedAnswerIndex == 0) {
        adp+=3;
        }
        if (selectedAnswerIndex == 1) {
        adp+=2;
        }
        if (selectedAnswerIndex == 2) {
        adp++;
        }
        if (selectedAnswerIndex == 3) {
        adp=0;
        } 
      }
        else{
           if (selectedAnswerIndex == 0) {
        confidence+=3;
        }
        if (selectedAnswerIndex == 1) {
        confidence+=2;
        }
        if (selectedAnswerIndex == 2) {
        confidence++;
        }
        if (selectedAnswerIndex == 3) {
        confidence=0;
        }
        }
    });
    }

    void goToNextQuestion() {
    setState(() {
        if (questionIndex < questions.length - 1) {
        questionIndex++;
        selectedAnswerIndex = null;
        }
    });
    }


    @override
    Widget build(BuildContext context) {
    final question = questions[questionIndex];
    bool isLastQuestion = questionIndex == questions.length - 1;


    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 140, 182, 250),
        appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: const Text('General Health Questionnaire'),
        centerTitle: true,
        ),
        body:
        Padding(
        padding: const EdgeInsets.all(24.0),
        child:
        Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            Text(
                question.question,
                style: const TextStyle(
                    fontSize: 21,
                    color: Color.fromARGB(255, 0, 0, 0)
                ),
                textAlign: TextAlign.center,
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: question.options.length,
                itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: selectedAnswerIndex == null
                    ? () => pickAnswer(index)
                : null,
                    child: AnswerCard(
                    currentIndex: index,
                    question: question.options[index],
                    isSelected: selectedAnswerIndex == index,
                    selectedAnswerIndex: selectedAnswerIndex,
                    correctAnswerIndex: selectedAnswerIndex,
                    ),
                );
                },
            ),

            isLastQuestion
                ? RectangularButton(
                onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                    builder: (_) => ResultScreen(
                        stress: stress,
                        adp: adp,
                        confidence: confidence,
                    ),
                    ),
                );
                },
                label: 'Finish',
            )
                : RectangularButton(
                onPressed:
                selectedAnswerIndex != null ? goToNextQuestion : null,
                label: 'Next',
            ),

            ],
        ),
        ),
    );
    }
}