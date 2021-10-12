import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:ministerio_de_salud/utils/convert_utils.dart';

// ignore: must_be_immutable
class InputHourOption extends StatefulWidget {
  final String title;
  final bool isRequired;
  final TextEditingController controller;

  const InputHourOption({
    Key? key,
    required this.title,
    this.isRequired = false,
    required this.controller,
  }) : super(key: key);

  @override
  State<InputHourOption> createState() => _InputHourOptionState();
}

class _InputHourOptionState extends State<InputHourOption> {
  @override
  void initState() {
    super.initState();
    getHour();
    // widget.options = ['- Seleccione una opción -', ...widget.options];
    // _chosenValue = widget.options[0];
    // widget.controller.text = _chosenValue;
  }

  getHour() {
    dateList = widget.controller.text.split(':');
    if (dateList.length == 2) {
      hora = int.parse(dateList[0]);
      minuto = int.parse(dateList[1]);
    } else {
      hora = DateTime.now().hour;
      minuto = DateTime.now().minute;
    }
  }

  int hora = 0;
  int minuto = 0;

  List<String> dateList = [];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      // margin: const EdgeInsets.only(bottom: 10, top: 10),
      width: double.infinity,
      child: _styleView(size),
    );
  }

  Widget _styleView(Size size) {
    if (size.width >= 720) {
      return Row(
        children: [
          SizedBox(
            width: 170,
            child: RichText(
              text: TextSpan(
                  text: widget.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                  children: <TextSpan>[
                    if (widget.isRequired)
                      const TextSpan(
                        text: ' *',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.red),
                      )
                  ]),
            ),
          ),
          Expanded(
            child: _itemInput(),
          )
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: RichText(
              text: TextSpan(
                  text: widget.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                  children: <TextSpan>[
                    if (widget.isRequired)
                      const TextSpan(
                        text: ' *',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.red),
                      )
                  ]),
            ),
          ),
          _itemInput(),
        ],
      );
    }
  }

  Widget _itemInput() {
    return TextField(
      // minLines: (widget.descrip) ? 3 : 1,
      // maxLines: (widget.descrip) ? 10 : 1,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 15),
        border: const OutlineInputBorder(),
        hintText: widget.title,
        // helperText: widget.helptext,
      ),
      controller: widget.controller,
      onTap: () {
        DatePicker.showTimePicker(context,
            showTitleActions: true,
            showSecondsColumn: false, onChanged: (date) {
          print('change $date');
        }, onConfirm: (date) {
          widget.controller.text = formatDateTimeHourToString(
              Duration(hours: date.hour, minutes: date.minute));
          getHour();
          print('confirm $date');
        },
            currentTime: DateTime(DateTime.now().year, DateTime.now().month,
                DateTime.now().day, hora, minuto),
            locale: LocaleType.es);
      },
      // onChanged: (n) {
      //   print("completo########");
      //   if(!ordenData.flagEdit){ordenData.flagEdit = true;}
      // },
    );
  }
}
