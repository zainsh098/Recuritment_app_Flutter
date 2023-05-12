import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  int _currentStep = 0;
  Color _getStepColor(int step) {
    if (step < _currentStep) {
      return Colors.green;
    } else if (step == _currentStep) {
      return Colors.blue;
    } else {
      return Colors.grey;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                const Text(
                  "You are logged in as candidate",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    fontFamily: "Circular std",
                    color: Colors.black,
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.logout),
                  onPressed: () {
                    // handle logout action here
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),





          Expanded(
            flex: 1,

            child: Stepper(
              elevation: 3,


              margin: EdgeInsets.all(15),
              currentStep: _currentStep,
              onStepContinue: () {
                setState(() {
                  if (_currentStep < 2) {
                    _currentStep++;

                  } else {
                    // handle form submission here
                  }
                });
              },
              onStepCancel: () {
                setState(() {
                  if (_currentStep > 0) {
                    _currentStep--;
                  }
                });
              },
              steps: [
                Step(

                  title: const Text(
                    "Personal Info",
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: "Circular std",
                      color: Colors.black,
                    ),
                  ),
                  content: Column(
                    children: [
                      // add profile picture input here
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Full Name",
                        ),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Area",
                        ),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Country",
                        ),
                      ),
                       Row(

                        children: [
                          Flexible(
                             flex: 3,
                            fit: FlexFit.tight,
                            child: const Text(
                              "Gender: ",

                              style: TextStyle(
                                fontFamily: "Circular std",
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Radio(
                            value: "Male",
                            groupValue: null, // set gender value here
                            onChanged: (value) {
                              setState(() {
                                // update gender value here
                              });
                            },
                          ),
                          const Text(
                            "Male",
                            style: TextStyle(
                              fontFamily: "Circular std",
                              color: Colors.black,
                            ),
                          ),
                          Radio(
                            value: "Female",
                            groupValue: null, // set gender value here
                            onChanged: (value) {
                              setState(() {
                                // update gender value here
                              });
                            },
                          ),
                          const Text(
                            "Female",
                            style: TextStyle(
                              fontFamily: "Circular std",
                              color: Colors.black,
                            ),
                          ),
                          Radio(
                            value: "Other",
                            groupValue: null, // set gender value here
                            onChanged: (value) {
                              setState(() {
                                // update gender value here
                              });
                            },
                          ),
                          const Text(
                            "Other",
                            style: TextStyle(
                              fontFamily: "Circular std",
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Email Address",
                        ),
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: "Password",
                        ),
                      ),
                    ],
                  ),
                ),
                Step(
                  title: const Text(
                    "Career Info",
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: "Circular std",
                      color: Colors.black,
                    ),
                  ),
                  content: Column(
                    children: [
// add career info fields here
                    ],
                  ),
                ),
                Step(
                  title: const Text(
                    "Social Profile",
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: "Circular std",
                      color: Colors.black,
                    ),
                  ),
                  content: Column(
                    children: [
// add social profile fields here
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],


      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          setState(() {
            if (_currentStep < 2) {
              _currentStep++;

            } else {
// handle form submission here
            }
          });
        },
        child: const Text(
          "Continue",
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Circular std",
            fontSize: 28,
          ),
        ),
      ),





    );
  }
}
