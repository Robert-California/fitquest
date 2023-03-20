import 'package:flutter/material.dart';

void main() {
  runApp(const HelloWorld());
}

class HelloWorld extends StatelessWidget {
  const HelloWorld({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BMR Calculator'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Basal Stofskifte. BMR refererer til den mængde energi, som kroppen bruger i hvile.',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent),
              ),
            ),
            const BmrForm(),
          ],
        ));
  }
}

class BmrForm extends StatefulWidget {
  const BmrForm({Key? key}) : super(key: key);

  @override
  _BmrFormState createState() => _BmrFormState();
}

class _BmrFormState extends State<BmrForm> {
  final _formKey = GlobalKey<FormState>();
  double? _weight;
  double? _height;
  double? _age;
  String? _gender;
  double? _result;

  double maleFormula(double weight, double height, double age) {
    return 66 + (13.7 * weight) + (5 * height) - (6.8 * age);
  }

  double femaleFormula(double weight, double height, double age) {
    return 655.1 + (9.6 * weight) + (1.8 * height) - (4.7 * age);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (_result != null)
            Text(
              'BMR: $_result',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Weight (kg)',
            ),
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your weight';
              }
              return null;
            },
            onSaved: (value) {
              _weight = double.parse(value!);
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Height (cm)',
            ),
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your height';
              }
              return null;
            },
            onSaved: (value) {
              _height = double.parse(value!);
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Age',
            ),
            keyboardType: TextInputType.numberWithOptions(decimal: false),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your age';
              }
              return null;
            },
            onSaved: (value) {
              _age = double.parse(value!);
            },
          ),
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              labelText: 'Gender',
            ),
            items: <String>['Male', 'Female'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _gender = value;
              });
            },
            onSaved: (value) {
              _gender = value;
            },
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                if (_gender == 'Male') {
                  setState(() {
                    _result = maleFormula(_weight!, _height!, _age!);
                  });
                } else if (_gender == 'Female') {
                  setState(() {
                    _result = femaleFormula(_weight!, _height!, _age!);
                  });
                }
              }
            },
            child: const Text('Calculate BMR'),
          ),
        ],
      ),
    );
  }
}
