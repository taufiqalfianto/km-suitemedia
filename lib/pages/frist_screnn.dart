import 'package:flutter/material.dart';
import 'package:kamppus_merdeka/pages/second_screen.dart';

class FristScreen extends StatefulWidget {
  const FristScreen({super.key});

  @override
  State<FristScreen> createState() => _FristScreenState();
}

class _FristScreenState extends State<FristScreen> {
  TextEditingController _textEditingController =
      TextEditingController(text: '');
  bool isPalindrome = false;

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  bool isPalindromeCheck(String text) {
    String cleanText = text.replaceAll(RegExp(r'[^\w\s]'), '').toLowerCase();
    String reversedText = cleanText.split('').reversed.join('');
    return cleanText == reversedText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  'assets/bg.png',
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 116,
                  height: 116,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.person_add,
                      size: 42,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 51,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 33),
                  child: Column(
                    children: [
                      //NAME FIELD
                      TextFormField(
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'Name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 32,
                            ),
                          ),
                        ),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      //PALINDROME FIELD
                      TextField(
                        controller: _textEditingController,
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'Palindrome',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 32,
                            ),
                          ),
                        ),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 45,
                      ),
                      //CHECK PLAINDROME
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              // Check if the entered text is not empty
                              String text = _textEditingController.text;
                              if (text.isEmpty) {
                                // Check if the entered text is a palindrome
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Center(
                                          child: Text('Field Must Required')),
                                    );
                                  },
                                );
                              } else if (text.isNotEmpty) {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Center(
                                          child: Text(isPalindrome
                                              ? "Palindrome"
                                              : "Not Palindrome")),
                                    );
                                  },
                                );
                                isPalindrome = isPalindromeCheck(text);
                              } else {
                                isPalindrome = false;
                              }
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF2A637B),
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            'CHECK',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      //NEXT BUTTON
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 40,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF2A637B),
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SecondScreen(),
                              ),
                            );
                          },
                          child: Text(
                            'NEXT',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
