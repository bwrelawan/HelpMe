import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:helpme/module/entry_data/entry_controller.dart';

class EntryData extends StatefulWidget {
  const EntryData({super.key});

  @override
  State<EntryData> createState() => _EntryDataState();
}

class _EntryDataState extends State<EntryData> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EntryDataController>(
        init: EntryDataController(),
        builder: (EntryDataController entryDataController) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: const Text('Entry Keluhan'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Blok Nomor',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  DropdownButton(
                    hint: const Text('Pilih Nomor Blok',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    items: entryDataController.listBlokNo.map((item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                      );
                    }).toList(),
                    onChanged: (String? newVal) {
                      setState(() {
                        entryDataController.dropdownBlokNo = newVal;
                      });
                    },
                    value: entryDataController.dropdownBlokNo,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text('Lokasi',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  DropdownButton(
                    hint: const Text('Pilih Lokasi',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    items: entryDataController.listLokasi.map((item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                      );
                    }).toList(),
                    onChanged: (String? newVal) {
                      setState(() {
                        entryDataController.dropdownLokasi = newVal;
                      });
                    },
                    value: entryDataController.dropdownLokasi,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text('Keluhan',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(
                    height: 5,
                  ),
                  TextField(
                    controller: entryDataController
                        .textController, //Link controller to TextField
                    style: const TextStyle(fontSize: 18),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Masukan Keluhan yang anda alami"),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        entryDataController.postData();
                      },
                      child: Text('SUBMIT'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12), // <-- Radius
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
