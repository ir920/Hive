import 'package:flutter/material.dart';
import 'package:flutter_application_1/db/functions/function.dart';
import 'package:flutter_application_1/model/datamodel.dart';

class abc extends StatefulWidget {
  const abc({super.key});

  @override
  State<abc> createState() => _abcState();
}

class _abcState extends State<abc> {
   final _namecontroller =TextEditingController();
   final _agecontroller =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: _namecontroller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Name'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: _agecontroller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'age'),
                ),
              ),
              ElevatedButton.icon(
                  onPressed: () {
                    onAddstudentbuttonclicked();
                  },
                  icon: Icon(Icons.add),
                  label: Text('Add student')),
              SizedBox(
                height: 500,
                width: 300,
                child: ValueListenableBuilder(
                  valueListenable: studentListNotifier,
                  builder:
                      (BuildContext, List<studentmodel> studentlist, child) {
                    return ListView.separated(
                      itemCount: studentlist.length,
                      itemBuilder: (context, index) {
                        final data = studentlist[index];

                        return ListTile(
                          title: Text(data.name),
                          subtitle: Text(data.age),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider();
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
 Future <void> onAddstudentbuttonclicked() async {
  final name =_namecontroller.text.trim();
   final age  =_agecontroller.text.trim();
   if (name.isEmpty || age.isEmpty){
    return;
   }
    print("$name $age");

    studentmodel(name: name, age: age);
    final student = studentmodel(name: name, age: age);

    addstudent(student);
}
}

