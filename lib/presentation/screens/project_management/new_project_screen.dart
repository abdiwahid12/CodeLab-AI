import 'package:flutter/material.dart';

class NewProjectScreen extends StatefulWidget {
  @override
  _NewProjectScreenState createState() => _NewProjectScreenState();
}

class _NewProjectScreenState extends State<NewProjectScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _description = '';
  String _language = 'Dart';
  String _template = 'Default';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New Project'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[  
              TextFormField(
                decoration: InputDecoration(labelText: 'Project Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a project name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Description'),
                onSaved: (value) {
                  _description = value!;
                },
              ),
              DropdownButtonFormField<String>(
                value: _language,
                decoration: InputDecoration(labelText: 'Select Language'),
                items: <String>['Dart', 'Python', 'JavaScript', 'Java']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _language = newValue!;
                  });
                },
              ),
              DropdownButtonFormField<String>(
                value: _template,
                decoration: InputDecoration(labelText: 'Select Template'),
                items: <String>['Default', 'Template 1', 'Template 2']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _template = newValue!;
                  });
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // Handle creation of new project
                      print('Project Created: $_name, $_description, $_language, $_template');
                    }
                  },
                  child: Text('Create Project'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}