import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/main.dart';
import 'package:flutter/services.dart';
import 'package:counter_7/drawer.dart';

class MyFormPage extends StatefulWidget {
  const MyFormPage({super.key, required this.data, required this.tambahData});

  final List<dataBudget> data;
  final Function(dataBudget) tambahData;

  @override
  State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _judul = "";
  String _nominal = "";
  String tipeBudget = 'Pengeluaran';
  List<String> listTipeBudget = ['Pengeluaran', 'Pemasukan'];
  String tanggal = "";
  List<String> listData = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Budget'),
      ),

      // Menambahkan drawer menu
      drawer: PublicDrawer(
        data: widget.data,
        tambahData: widget.tambahData,
      ),

      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Judul",
                          labelText: "Judul",
                          // Menambahkan icon agar lebih intuitif
                          icon: const Icon(Icons.title),
                          // Menambahkan circular border agar lebih rapi
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        // Menambahkan behavior saat nama diketik
                        onChanged: (String? value) {
                          setState(() {
                            _judul = value!;
                          });
                        },
                        // Menambahkan behavior saat data disimpan
                        onSaved: (String? value) {
                          setState(() {
                            _judul = value!;
                          });
                        },
                        // Validator sebagai validasi form
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Judul tidak boleh kosong!';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                          hintText: "Nominal",
                          labelText: "Nominal",
                          // Menambahkan icon agar lebih intuitif
                          icon: const Icon(Icons.numbers),
                          // Menambahkan circular border agar lebih rapi
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        // Menambahkan behavior saat nama diketik
                        onChanged: (String? value) {
                          // String _nominal = _nominalController.text;
                          // int.parse(_nominal);
                          setState(() {
                            _nominal = value!;
                          });
                        },
                        // Menambahkan behavior saat data disimpan
                        onSaved: (String? value) {
                          // String _nominal = _nominalController.text;
                          // int.parse(_nominal);
                          setState(() {
                            _nominal = value!;
                          });
                        },
                        // Validator sebagai validasi form
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Nominal tidak boleh kosong!';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20.0),
                      ListTile(
                        leading: const Icon(Icons.class_),
                        title: const Text(
                          'Pilih Jenis',
                        ),
                        trailing: DropdownButton(
                          value: tipeBudget,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: listTipeBudget.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              tipeBudget = newValue!;
                            });
                          },
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        decoration: const InputDecoration(
                            icon:
                                Icon(Icons.calendar_today), //icon of text field
                            labelText: "Enter Date" //label text of field
                            ),
                        readOnly: true, // when true user cannot edit text
                        onChanged: (String? newValue) {
                          setState(() {
                            tanggal = newValue!;
                          });
                        },
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(), //get today's date
                              firstDate: DateTime(
                                  2000), //DateTime.now() - not to allow to choose before today.
                              lastDate: DateTime(2101));

                          if (pickedDate != null) {
                            String formattedDate =
                                DateFormat('dd/MM/yyyy').format(pickedDate);

                            setState(() {
                              tanggal = formattedDate;
                            });
                          }
                        },
                      ),
                      const SizedBox(height: 20.0),
                      TextButton(
                        child: const Text(
                          "Simpan",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            var intNominal = int.parse(_nominal);
                            widget.tambahData(
                              dataBudget(
                                  _judul, intNominal, tipeBudget, tanggal),
                            );

                            showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  elevation: 15,
                                  child: Container(
                                    child: ListView(
                                      padding: const EdgeInsets.only(
                                          top: 20, bottom: 20),
                                      shrinkWrap: true,
                                      children: <Widget>[
                                        Center(
                                            child:
                                                const Text('Informasi Data')),
                                        SizedBox(height: 20),
                                        // TODO: Munculkan informasi yang didapat dari form
                                        Text('Judul: $_judul'),
                                        Text('Nominal: $_nominal'),
                                        Text('Tipe: $tipeBudget'),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('Kembali'),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
