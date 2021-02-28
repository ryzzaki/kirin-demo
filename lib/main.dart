import 'package:flutter/material.dart';
import 'package:kirin/kirin.dart';

void main() {
  runApp(KirinDemo());
}

class KirinDemo extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kirin Demo',
      debugShowCheckedModeBanner: false,
      home: HomePage(title: 'Kirin UI Demo'),
    );
  }
}

class HomePage extends StatefulWidget {
  // ME: this is like props
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    KirinToast toast = KirinToast(context, "Loading...");
    KirinDialog dialog = KirinDialog(context, "This is a native dialog...",
        "A very long description below the title", [
      KirinDialogAction("Cancel", onPressed: () => Navigator.of(context).pop()),
      KirinDialogAction("Ok", onPressed: () => Navigator.of(context).pop())
    ]);

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            KirinHeading("Title: Top picks for you"),
            SizedBox(height: 20),
            KirinButton("Disabled Button", disabled: true),
            SizedBox(height: 20),
            KirinInput(placeholder: 'placeholder text', label: "Input Label"),
            SizedBox(height: 20),
            KirinInput(placeholder: 'another placeholder text'),
            SizedBox(height: 20),
            KirinButton(
              "Open a Loading Toast",
              onPressed: () => toast.pop(durationSeconds: 5),
            ),
            SizedBox(height: 20),
            KirinButton("Open an Alert Dialog", onPressed: dialog.show),
          ],
        ),
      ),
    );
  }
}
