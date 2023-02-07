import 'package:flutter/material.dart';



List<String> exercises = [];
String userInput = '';

class _CustomFormState extends State<CustomForm>
{
  final myController = TextEditingController();
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
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
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        
           TextField(
            controller: myController,
            onChanged: (value) {
              setState(() {
                userInput = value;
              });
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Øvelse',
            ),
          ),

          
        
      const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),

          child: TextField( 
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'KG',
            ),
          ),
        ),
        ButtonBar(
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                setState(() {
                  exercises.add(userInput);
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
                title: Text(exercises[index]),
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

class FormState extends ChangeNotifier
{
  List<String> exercises = [];

  void addExercise(String exercise) {
    exercises.add(exercise);
    notifyListeners();
  }

  void removeExercise(String exercise) {
    exercises.remove(exercise);
    notifyListeners();
  }
 


  String _exercise = '';
  String _weight = '';

  String get exercise => _exercise;
  String get weight => _weight;

  void setExercise(String exercise) {
    _exercise = exercise;
    notifyListeners();
  }

  void setWeight(String weight) {
    _weight = weight;
    notifyListeners();
  }

}

class CustomForm extends StatefulWidget {

  @override
  State<CustomForm> createState() => _CustomFormState();
  
}