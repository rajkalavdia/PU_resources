
import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:pu_resourcse/IT/SEM1/basicElectricalEngineering.dart';
import 'package:pu_resourcse/IT/SEM1/programmingForProblemSolving.dart';



class Branches extends StatefulWidget {
  const Branches({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<Branches> createState() => _BranchesState();
}

class _BranchesState extends State<Branches>{
  List<Map<String, dynamic>> dataList = [
    {
      "level": 0,
      "title": "Faculty Of Engineering",
      "children": [
        {
          "level": 1,
          "title": "IT",
          "children": [
            {
              "level": 2,
              "title": "Semester-1",
              "children": [
                {"level": 3, "title": "Programming for Problem Solving"},
                {"level": 3, "title": "Basic Electrical Engineering"},
                {"level": 3, "title": "Engineering Graphics"},
                {"level": 3, "title": "Computer Peripherals And Software Tools"},
                {"level": 3, "title": "Mathematics - 1"},
                {"level": 3, "title": "Communication Skills - 1"},
              ],
            },
            {
              "level": 2,
              "title": "Semester-2",
              "children": [
                {"level": 3, "title": "Object Oriented Programming with C++"},
                {"level": 3, "title": "Basic Electronics"},
                {"level": 3, "title": "Mathematics - 2"},
                {"level": 3, "title": "Engineering Physics"},
                {"level": 3, "title": "Environmental Science"},
                {"level": 3, "title": "Communication Skills - 2"},
              ],
            },
            {
              "level": 2,
              "title": "Semester-3",
              "children": [
                {"level": 3, "title": "Digital Electronics"},
                {"level": 3, "title": "Data Structure and Algorithms"},
                {"level": 3, "title": "Product Realization"},
                {"level": 3, "title": "Python Programming"},
                {"level": 3, "title": "Database Management System"},
                {"level": 3, "title": "Discrete Mathematics"},
                {"level": 3, "title": "Professional Communication Skills"},
              ],
            },
            {
              "level": 2,
              "title": "Semester-4",
              "children": [
                {"level": 3, "title": "Operating System"},
                {"level": 3, "title": "Computer Networks"},
                {"level": 3, "title": "Java Programming"},
                {"level": 3, "title": "Computer Organization & Architecture"},
                {"level": 3, "title": "Probability, Statistics and Numerical Methods"},
                {"level": 3, "title": "Professional Grooming & Personality Development"},
              ],
            },
            {
              "level": 2,
              "title": "Semester-5",
              "children": [
                {"level": 3, "title": "Data Visualization and Data Analytics"},
                {"level": 3, "title": "Advanced Java Programming"},
                {"level": 3, "title": "Design and Analysis of Algorithm"},
                {"level": 3, "title": "Web Programming"},
                {"level": 3, "title": "Theory of Computation"},
                {"level": 3, "title": "Renewable Energy Source"},
                {"level": 3, "title": "Professionalism & Corporate Ethics"},
              ],
            },
            {
              "level": 2,
              "title": "Semester-6",
              "children": [
                {"level": 3, "title": "Artificial Intelligence"},
                {"level": 3, "title": "Cyber Security"},
                {"level": 3, "title": "Data Mining and Business Intelligence"},
                {"level": 3, "title": "Data Compression"},
                {"level": 3, "title": "Web Development & Framework"},
                {"level": 3, "title": "Project 1"},
                {"level": 3, "title":"Empolybility Skills"}
              ],
            },
            {
              "level": 2,
              "title": "Semester-7",
              "children": [
                {"level": 3, "title": "Operating System"},
                {"level": 3, "title": "Computer Networks"},
                {"level": 3, "title": "Java Programming"},
                {"level": 3, "title": "Computer Organization & Architecture"},
                {"level": 3, "title": "Probability, Statistics and Numerical Methods"},
                {"level": 3, "title": "Professional Grooming & Personality Development"},
              ],
            },
            {
              "level": 2,
              "title": "Semester-8",
              "children": [
                {"level": 3, "title": "Operating System"},
                {"level": 3, "title": "Computer Networks"},
                {"level": 3, "title": "Java Programming"},
                {"level": 3, "title": "Computer Organization & Architecture"},
                {"level": 3, "title": "Probability, Statistics and Numerical Methods"},
                {"level": 3, "title": "Professional Grooming & Personality Development"},
              ],
            },
          ],
        },
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.separated(
        itemCount: dataList.length,
        itemBuilder: (BuildContext context, int index) => _buildList(dataList[index]),
        separatorBuilder: (BuildContext context, int index) => const Divider(height: 1),
      ),
    );
  }

  Widget _buildList(Map<String, dynamic> node) {
    double lp = 0;
    double fontSize = 28;
    if (node["level"] == 1) {
      lp = 20;
      fontSize = 24;
    } else if (node["level"] == 2) {
      lp = 30;
      fontSize = 20;
    }

    if (node["children"] != null) {
      return Padding(
        padding: EdgeInsets.only(left: lp),
        child: ExpansionTile(
          leading: const Icon(Icons.info),
          title: Text(
            node["title"],
            style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
          ),
          children: node["children"].map<Widget>((child) => _buildList(child)).toList(),
        ),
      );
    } else {
      return Padding(
        padding: EdgeInsets.only(left: lp),
        child: ListTile(
          title: Text(
            node["title"],
            style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
          ),
          onTap: () {
            // Navigate to the respective subject page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                if (node["title"] == "Programming for Problem Solving") {
                  return programmingForProblemSolving(title: node["title"]);
                } else if (node["title"] == "Basic Electrical Engineering") {
                  return basicElectricalEngineering(title: node["title"],);
                } else if (node["title"] == "Basic Electrical Engineering") {
                  return basicElectricalEngineering(title: node["title"],);
                }
                // Add conditions for other subject pages

                // If the subject page doesn't exist, navigate to a default page
                return SubjectPage(title: node["title"]);
              }),
            );
          },
        ),
      );
    }
  }
}

class SubjectPage extends StatelessWidget {
  final String title;

  const SubjectPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body:GridView.builder(
        itemCount: 20,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        "assets/images/pdf.png",
                        height: 120,
                        width: 100,
                      ),
                      Text(
                        "pdf Name",
                         style: TextStyle(
                          fontSize: 18
                      ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
         ),
    );
  }
}
