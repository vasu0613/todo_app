import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/widgets/button.dart';

class DialogBox extends StatefulWidget {
  final TextEditingController taskController;
  final TextEditingController detailController;
  final TextEditingController dateController;
  final TextEditingController timeController;
  VoidCallback onAdd;
  VoidCallback onCancel;
  DialogBox({
    super.key,
    required this.taskController,
    required this.detailController,
    required this.dateController,
    required this.timeController,
    required this.onAdd,
    required this.onCancel,
  });

  @override
  State<DialogBox> createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {
  TimeOfDay selectedTime = TimeOfDay.now();

  Future<void> selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        widget.dateController.text = picked.toString().split(" ")[0];
      });
    }
  }

  Future<void> _selectTime() async {
    final TimeOfDay? pickedS = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.input,
    );
    if (pickedS != null && pickedS != selectedTime) {
      setState(() {
        widget.timeController.text = pickedS.format(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'A D D T A S K',
        style: GoogleFonts.inter(
          textStyle: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      content: SizedBox(
        height: MediaQuery.of(context).size.height * 0.4,
        width: MediaQuery.of(context).size.width * 0.9,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextField(
              controller: widget.taskController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(width: 3),
                ),
                contentPadding: EdgeInsets.all(20),
                hintText: 'Enter Task',
              ),
            ),
            TextField(
              controller: widget.detailController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(width: 3),
                ),
                contentPadding: EdgeInsets.all(20),
                hintText: 'Enter detail',
              ),
            ),
            TextField(
              controller: widget.dateController,
              keyboardType: TextInputType.datetime,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(width: 3),
                ),
                contentPadding: EdgeInsets.all(20),
                hintText: 'Enter date',
                suffixIcon: IconButton(
                  onPressed: selectDate,
                  icon: Icon(Icons.calendar_month),
                ),
              ),
            ),
            TextField(
              controller: widget.timeController,
              keyboardType: TextInputType.datetime,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(width: 3),
                ),
                contentPadding: EdgeInsets.all(20),
                hintText: 'E N T E R T I M E',
                suffixIcon: IconButton(
                  onPressed: () => _selectTime(),
                  icon: Icon(Icons.access_time_sharp),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Button(text: 'C A N C E L', onPressed: widget.onCancel),
                const SizedBox(width: 10),
                Button(text: 'A D D', onPressed: widget.onAdd),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
