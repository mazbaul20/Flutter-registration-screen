import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  String? selectedDay;
  String? selectedMonth;
  String? selectedYear;
  bool? agreeTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(
                      "Create Account",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Create an account to start using our app ",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
              // first name & last name
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "First Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        fillColor: Color(0xFFF8F8F8),
                      ),
                    ),
                  ),
                  SizedBox(width: 6),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "First Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        fillColor: Color(0xFFF8F8F8),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Color(0xFFF8F8F8),
                  labelText: "Email",
                ),
              ),
              SizedBox(height: 12),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Color(0xFFF8F8F8),
                  labelText: "Username",
                  suffixIcon: Icon(Icons.check_circle, color: Colors.grey),
                ),
              ),
              SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFF8F8F8),
                  border: Border.all(color: Colors.grey.shade400, width: 1.0),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    // ক) বাম পাশের "Birthday" স্ট্যাটিক টেক্সট
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Text(
                        "Birthday",
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),

                    // খ) মাঝখানের ও ডানপাশের ড্রপডাউনগুলো রেসপন্সিভ করার জন্য Expanded ব্যবহার
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // ১. Day Dropdown
                          DropdownButton<String>(
                            hint: const Text("Day"),
                            value: selectedDay,
                            underline: const SizedBox(),
                            items: List.generate(31, (index) => "${index + 1}")
                                .map((day) {
                                  return DropdownMenuItem(
                                    value: day,
                                    child: Text(day),
                                  );
                                })
                                .toList(),
                            onChanged: (value) =>
                                setState(() => selectedDay = value),
                          ),

                          // মাঝখানের চিকন সোজা দাগ (Divider)
                          Container(
                            height: 24,
                            width: 1,
                            color: Colors.grey.shade300,
                          ),

                          // ২. Month Dropdown
                          DropdownButton<String>(
                            hint: const Text("Month"),
                            value: selectedMonth,
                            underline: const SizedBox(),
                            items:
                                [
                                  "Jan",
                                  "Feb",
                                  "Mar",
                                  "Apr",
                                  "May",
                                  "Jun",
                                  "Jul",
                                  "Aug",
                                  "Sep",
                                  "Oct",
                                  "Nov",
                                  "Dec",
                                ].map((month) {
                                  return DropdownMenuItem(
                                    value: month,
                                    child: Text(month),
                                  );
                                }).toList(),
                            onChanged: (value) =>
                                setState(() => selectedMonth = value),
                          ),

                          // ডানপাশের চিকন সোজা দাগ (Divider)
                          Container(
                            height: 24,
                            width: 1,
                            color: Colors.grey.shade300,
                          ),

                          // ৩. Year Dropdown
                          DropdownButton<String>(
                            hint: const Text("Year"),
                            value: selectedYear,
                            underline: const SizedBox(),
                            items:
                                List.generate(
                                  50,
                                  (index) => "${2026 - index}",
                                ).map((year) {
                                  return DropdownMenuItem(
                                    value: year,
                                    child: Text(year),
                                  );
                                }).toList(),
                            onChanged: (value) =>
                                setState(() => selectedYear = value),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 12),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Color(0xFFF8F8F8),
                  labelText: "Password",
                ),
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 24,
                    width: 24,
                    child: Transform.scale(
                      scale: 1.3,
                      child: Checkbox(
                        value: agreeTerms,
                        activeColor: Colors.blue,
                        checkColor: Colors.white,
                        shape: const CircleBorder(),
                        side: const BorderSide(color: Colors.blue, width: 1),
                        onChanged: (value) {
                          setState(() {
                            agreeTerms = value!;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Row(
                      children: [
                        const Text(
                          "I agree to the ",
                          style: TextStyle(color: Colors.black87, fontSize: 14),
                        ),
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: const Text(
                            "terms and conditions",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              decorationStyle: TextDecorationStyle.solid,
                              decorationThickness: 1.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 12),
              FilledButton(
                onPressed: () {},
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text("CREATE ACCOUNT"),
              ),
              SizedBox(height: 12),
              Text(
                "OR",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              FilledButton(
                onPressed: () {},
                style: FilledButton.styleFrom(
                  backgroundColor: Color(0xFFF8FAF9),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  side: BorderSide(color: Colors.grey, width: 1),
                ),
                child: Text(
                  "Back to Login".toUpperCase(),
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
