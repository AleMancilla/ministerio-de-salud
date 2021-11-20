import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:ministerio_de_salud/utils/convert_utils.dart';

// ignore: must_be_immutable
class InputDateOption extends StatefulWidget {
  final String title;
  final bool isRequired;
  final TextEditingController controller;

  const InputDateOption({
    Key? key,
    required this.title,
    this.isRequired = false,
    required this.controller,
  }) : super(key: key);

  @override
  State<InputDateOption> createState() => _InputDateOptionState();
}

class _InputDateOptionState extends State<InputDateOption> {
  @override
  void initState() {
    super.initState();
    getFecha();
    // widget.options = ['- Seleccione una opción -', ...widget.options];
    // _chosenValue = widget.options[0];
    // widget.controller.text = _chosenValue;
  }

  getFecha() {
    dateList = widget.controller.text.split('/');
    if (dateList.length == 3) {
      dia = int.parse(dateList[0]);
      mes = int.parse(dateList[1]);
      anio = int.parse(dateList[2]);
    } else {
      dia = DateTime.now().day;
      mes = DateTime.now().month;
      anio = DateTime.now().year;
    }
  }

  int dia = 0;
  int mes = 0;
  int anio = 0;

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
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(horizontal: 15),
            width: 170,
            child: SelectableText.rich(
              TextSpan(
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
            child: SelectableText.rich(
              TextSpan(
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
        DatePicker.showDatePicker(context,
            showTitleActions: true,
            minTime: DateTime(2020),
            maxTime: DateTime(DateTime.now().year + 1),
            onChanged: (date) {}, onConfirm: (date) {
          widget.controller.text = formatDateTimeToString(date, 'dd/MM/yyyy');
          getFecha();
        }, currentTime: DateTime(anio, mes, dia), locale: LocaleType.es);
      },
      // onChanged: (n) {
      //   print("completo########");
      //   if(!ordenData.flagEdit){ordenData.flagEdit = true;}
      // },
    );
  }
}
