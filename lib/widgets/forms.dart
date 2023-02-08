import 'package:flutter/material.dart';



List<String> exercises = [];
String userExercise = '';
String userWeight = '';

class _CustomFormState extends State<CustomForm>
{
  final weightController = TextEditingController();
  final exerciseController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    exerciseController.dispose();
    weightController.dispose();
    super.dispose();
  }
  void addExercise(String exercise) {
    setState(() {
      exercises.add(exercise);
    });
  }

  void removeExercise(String exercise) {
    setState(() {
      exercises.remove(exercise);
    });
  }
  
  var exercises = <String>[];
  var weights = <String>[];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        
           TextField(
            controller: exerciseController,
            onChanged: (value) {
              setState(() {
                userExercise = value;
              });
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Øvelse',
            ),
          ),
     TextField(
            controller: weightController,
            onChanged: (value) {
              setState(() {
                userWeight = value;
              });
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'KG',
            ),
          ),
        ButtonBar(
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                setState(() {
                  exercises.add(userExercise);
                  weights.add(userWeight);
                });
              },
              child: const Text('Submit'),
            ),
          ]
        ),
        
        Expanded(
          child: ListView.builder(
            itemCount: exercises.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('Øvelse: ${exercises[index]}'),
                subtitle: Text('KG: ${weights[index]}'),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      exercises.removeAt(index);
                    });
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
class CustomForm extends StatefulWidget {
  const CustomForm({Key? key}) : super(key: key);
  @override
  State<CustomForm> createState() => _CustomFormState();
  
}