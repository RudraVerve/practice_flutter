import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  final _editFormKey = GlobalKey<FormState>();
  List<String> emailItems = [];
  List<TextEditingController> emailControllers = [];
  TextEditingController emailInputController = TextEditingController();
  // TextEditingController editEmailController = TextEditingController();
  void _addEmailItem() {
    if (emailInputController.text.isNotEmpty) {
      setState(() {
        if (emailItems.contains(emailInputController.text)) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Email Id Is Already Exist')),
          );
          emailInputController.clear();
        } else {
          emailItems.add(emailInputController.text);
          emailInputController.clear();
        }
      });
    }
  }

  String? validateEmail(String? value) {
    const emailPattern = r'^[^@\s]+@[^@\s]+\.[^@\s]+$';
    final regExp = RegExp(emailPattern);

    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  // void _editEmailItem(int index) {
  //   // Set the current email value to the text controller
  //   editEmailController.text = emailItems[index];
  //
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Email Todo"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Form(
                    key: _formKey,
                    child: TextFormField(
                      controller: emailInputController,
                      validator: validateEmail,
                      decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.mail_sharp, color: Colors.cyan),
                        hintText: 'Enter your email Id',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    child: const Icon(Icons.add, color: Colors.black),
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        _addEmailItem();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Please fix the errors')),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              height: 300,
              child: emailItems.isEmpty
                  ? const Center(child: Text('No email items added.'))
                  : ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text('${index}'),
                    title: Form(
                      key: _editFormKey,
                      child: TextFormField(
                        controller: emailControllers[index],
                        validator: validateEmail,
                        decoration: InputDecoration(
                          suffixIcon: const Icon(Icons.mail_sharp, color: Colors.cyan),
                          hintText: 'Enter your email Id',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.green),
                          onPressed: () {
                            // _editEmailItem(index);
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.remove, color: Colors.red),
                          onPressed: () {
                            setState(() {
                              emailItems.removeAt(index);
                            });
                          },
                        ),
                      ],
                    ),
                  );
                },
                itemCount: emailItems.length,
                separatorBuilder: (context, index) {
                  return const Divider(height: 15, thickness: 1);
                },
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(1),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.black, width: 1),
                ),
                child: emailItems.isEmpty
                    ? const Center(
                  child: Text(
                    "There is no email in the list",
                    style: TextStyle(fontSize: 20),
                  ),
                )
                    : ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        emailItems[index],
                        style: const TextStyle(fontSize: 15),
                      ),
                    );
                  },
                  itemCount: emailItems.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}