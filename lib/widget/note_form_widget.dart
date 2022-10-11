import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NoteFormWidget extends StatelessWidget {
  final bool? isImportant;
  final int? number;
  final String? title;
  final String? description;
  final String? createdTime;
  ValueChanged<bool> onChangedImportant;
  ValueChanged<int> onChangedNumber;
  ValueChanged<String> onChangedTitle;
  ValueChanged<String> onChangedDescription;
  ValueChanged<String> onChangedcreatedTime;

  NoteFormWidget({
    Key? key,
    this.isImportant = false,
    this.number = 0,
    this.title = '',
    this.description = '',
    this.createdTime = '',
    required this.onChangedImportant,
    required this.onChangedNumber,
    required this.onChangedTitle,
    required this.onChangedDescription,
    required this.onChangedcreatedTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Switch(
                    value: isImportant ?? false,
                    onChanged: onChangedImportant,
                  ),


                  //Expanded(
                    //child: Slider(
                      //value: (number ?? 0).toDouble(),
                      //min: 0,
                      //max: 5,
                      //divisions: 5,
                      //onChanged: (number) => onChangedNumber(number.toInt()),
                    //),
                  //)

                ],
              ),
              buildTitle(),
              SizedBox(height: 6),
              buildDescription(),
              SizedBox(height: 18),
              buildDatetime(context),

            ],
          ),
        ),
      );

  Widget buildTitle() => TextFormField(
        maxLines: 1,
        initialValue: title,
        style: TextStyle(
          color: Colors.white70,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Заголовок',
          hintStyle: TextStyle(color: Colors.white70),
        ),
        validator: (title) =>
            title != null && title.isEmpty
                ? 'Заголовок не может быть пустым' : null,
        onChanged: onChangedTitle,
      );

  Widget buildDescription() => TextFormField(
        maxLines: 5,
        initialValue: description,
        style: TextStyle(color: Colors.white60, fontSize: 18),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Описание',
          hintStyle: TextStyle(color: Colors.white60),
        ),
        validator: (title) => title != null && title.isEmpty
            ? 'Описание не может быть пустым' : null,
        onChanged: onChangedDescription,
      );

  Widget buildDatetime(BuildContext context) => ElevatedButton (
    child: Text('Select date'),
    onPressed: () async {
      DateTime? newTime = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1914),
          lastDate: DateTime(2077));
    },


    );


}
