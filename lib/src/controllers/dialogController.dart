import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DialogController extends ChangeNotifier {
  DateTime selectedDate = DateTime.now();

  DateTime updateDateTime(DateTime dateTime) {
    selectedDate = dateTime;
    notifyListeners();
    return selectedDate;
  }
}

class MeuWidget extends StatelessWidget {
  const MeuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {
            context.read<DialogController>().updateDateTime(DateTime.now());
          },
          icon: Icon(Icons.abc),
        ),
        Text(context.watch<DialogController>().selectedDate.toString()),
      ],
    );
  }
}
