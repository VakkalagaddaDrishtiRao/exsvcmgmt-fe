// profile_page.dart
import 'package:app/Database/database_helper.dart';
import 'package:app/Services/services.dart';
import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();
  String armyNumber = "";
  String name = "";
  String phone = "";
  bool disable = false;
  bool disable1 = false;

  TextEditingController numberController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController rankController = TextEditingController();
  TextEditingController regController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController fnameController = TextEditingController();
  TextEditingController eduController = TextEditingController();
  TextEditingController relController = TextEditingController();
  TextEditingController casteController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController thesilController = TextEditingController();

  TextEditingController c1 = TextEditingController();
  TextEditingController c2 = TextEditingController();
  TextEditingController c3 = TextEditingController();
  TextEditingController c4 = TextEditingController();
  TextEditingController c5 = TextEditingController();
  TextEditingController c6 = TextEditingController();
  TextEditingController c7 = TextEditingController();
  TextEditingController c8 = TextEditingController();
  TextEditingController c9 = TextEditingController();
  TextEditingController c10 = TextEditingController();
  TextEditingController c11 = TextEditingController();
  TextEditingController c12 = TextEditingController();
  TextEditingController c13 = TextEditingController();
  TextEditingController c14 = TextEditingController();
  TextEditingController c15 = TextEditingController();
  TextEditingController c16 = TextEditingController();
  TextEditingController c17 = TextEditingController();
  TextEditingController c18 = TextEditingController();
  TextEditingController c19 = TextEditingController();
  TextEditingController c20 = TextEditingController();

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  Future<void> getUserData() async {
    Map<String, dynamic>? data = await DatabaseHelper().getUserData();
    armyNumber = data?['armyNumber'];
    name = data?['name'];
    phone = data?['phone'];
    setState(() {
      numberController.text = armyNumber;
      nameController.text = name;
      phoneController.text = phone;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'PERSONAL DETAILS',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[800],
                ),
              ),
              const SizedBox(height: 10),
              _buildTextFieldDisabled('Number', numberController),
              _buildTextField('Rank', rankController),
              _buildTextField('Regiment', regController),
              _buildTextFieldDisabled('Name', nameController),
              _buildTextField('Date of Birth', dobController),
              _buildTextField('Father\'s Name', fnameController),
              _buildTextField('Educational Qualification', eduController),
              _buildTextField('Religion', relController),
              _buildTextField('Caste', casteController),
              _buildTextField('Address', addressController),
              _buildTextField('Tehsil', thesilController),
              _buildTextFieldDisabled('Mobile Number', phoneController),

              const SizedBox(height: 10),
              if (disable == false)
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        addPersonalData();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Profile updated')),
                        );
                      }
                    },
                    child: const Text('Update'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.green,
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),

              const Divider(color: Colors.green, thickness: 2),
              Text(
                'PROFESSIONAL DETAILS',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[800],
                ),
              ),
              const SizedBox(height: 10),
              _buildTextField('Decoration', c1),
              _buildTextField('Character', c2),
              _buildTextField('Date of Enrolment', c3),
              _buildTextField('Date of Discharge', c4),
              _buildTextField('Reason of Discharge', c5),
              _buildTextField('Amount of Pension', c6),
              _buildTextField('Disability Pension', c7),
              // _buildTextField('% of Disability', c8),
              _buildTextField('Lump Sum Payment', c9),
              _buildTextField('Gratuity', c10),
              _buildTextField('Group Insurance', c11),
              _buildTextField('Leave Encashment', c12),
              _buildTextField('Financial Assistance', c13),
              _buildTextField('Commuted Pension', c14),
              _buildTextField('Discharge Book No', c15),
              _buildTextField('Discharge Book No Date', c16),
              _buildTextField('PPO No', c17),
              _buildTextField('PPO No Date', c18),
              _buildTextField('Present Occupation', c19),
              _buildTextField('Income', c20),
 const SizedBox(height: 10),
              if (disable1 == false)
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        addProData();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Profile updated')),
                        );
                      }
                    },
                    child: const Text('Save'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.green,
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),

              // const Divider(color: Colors.green, thickness: 2),
              // Text(
              //   'BIOMETRICS',
              //   style: TextStyle(
              //     fontSize: 18,
              //     fontWeight: FontWeight.bold,
              //     color: Colors.green[800],
              //   ),
              // ),
              // const SizedBox(height: 10),
              // _buildTextField('Identification Mark'),
              // _buildTextField('Left Thumb'),

              const Divider(color: Colors.green, thickness: 2),
              Text(
                'ENCLOSURES:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[800],
                ),
              ),
              const SizedBox(height: 10),
              _buildUploadField('Discharge book*'),
              _buildUploadField('Pension Payment Order*'),
              _buildUploadField('Passport Size Photo*'),
              _buildUploadField('PAN*'),
              _buildUploadField('EPIC*'),
              _buildUploadField('Adhaar Card*'),

              Row(
                children: [
                  Checkbox(value: false, onChanged: (bool? value) {}),
                  const Text('Declaration: The data provided here is true.'),
                ],
              ),
              _buildUpdateButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextFieldDisabled(
      String label, TextEditingController Controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: Controller,
        enabled: false,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.green),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController Controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: Controller,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.green),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }

  Widget _buildUploadField(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(label),
          ),
          Expanded(
            flex: 2,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Upload the Document'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.green,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUpdateButton() {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Profile updated')),
            );
          }
        },
        child: const Text('Update'),
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.green,
          backgroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }

  final UserService _userService = UserService();
  Future<void> addPersonalData() async {
    String? token = await DatabaseHelper().getToken();
    final response = await _userService.addUserPersonalData(
        nameController.text,
        phoneController.text,
        rankController.text,
        regController.text,
        dobController.text,
        fnameController.text,
        eduController.text,
        relController.text,
        casteController.text,
        addressController.text,
        thesilController.text,
        token);

    if (response.statusCode == 200) {
      ArtSweetAlert.show(
        context: context,
        artDialogArgs: ArtDialogArgs(
          type: ArtSweetAlertType.success,
          title: "Success",
          text: "Personal data submitted successfully",
        ),
      );
      setState(() {
        disable = true;
      });
    } else {
      ArtSweetAlert.show(
        context: context,
        artDialogArgs: ArtDialogArgs(
          type: ArtSweetAlertType.danger,
          title: "Error",
          text: "Failed to submitted Personal data",
        ),
      );
    }
  }

  Future<void> addProData() async {
    String? token = await DatabaseHelper().getToken();
    final response = await _userService.addUserProData(
        c1.text,
        c2.text,
        c3.text,
        c4.text,
        c5.text,
        c6.text,
        c7.text,
        c9.text,
        c10.text,
        c11.text,
        c12.text,
        c13.text,
        c14.text,
        c15.text,
        c16.text,
        c17.text,
        c18.text,
        c19.text,
        c20.text,
        token);

    if (response.statusCode == 200) {
      ArtSweetAlert.show(
        context: context,
        artDialogArgs: ArtDialogArgs(
          type: ArtSweetAlertType.success,
          title: "Success",
          text: "Professional data submitted successfully",
        ),
      );
      setState(() {
        disable = true;
      });
    } else {
      ArtSweetAlert.show(
        context: context,
        artDialogArgs: ArtDialogArgs(
          type: ArtSweetAlertType.danger,
          title: "Error",
          text: "Failed to submitted Professional data",
        ),
      );
    }
  }
}
