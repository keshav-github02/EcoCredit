import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../services/database.dart';
import '../services/widget_support.dart';

class AdminApproval extends StatefulWidget {
  const AdminApproval({super.key});

  @override
  State<AdminApproval> createState() => _AdminApprovalState();
}

class _AdminApprovalState extends State<AdminApproval> {
  Stream<QuerySnapshot>? approvalStream;

  getOnTheLoad() {
    approvalStream = DatabaseMethods().getAdminApproval();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getOnTheLoad();
  }

  Widget allApprovals() {
    return StreamBuilder<QuerySnapshot>(
      stream: approvalStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return const Center(child: Text("Something went wrong"));
        }

        if (!snapshot.hasData) {
          return const Center(child: Text("No data yet..."));
        }

        // 🔎 Debug logs
        print("Docs count: ${snapshot.data!.docs.length}");
        for (var doc in snapshot.data!.docs) {
          print("Doc ID: ${doc.id}, Data: ${doc.data()}");
        }

        if (snapshot.data!.docs.isEmpty) {
          return const Center(child: Text("No approvals yet"));
        }

        return ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            DocumentSnapshot ds = snapshot.data!.docs[index];

            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Material(
                elevation: 2.0,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black45,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Image.asset(
                          "images/coca.png",
                          height: 120,
                          width: 120,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(width: 20.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.person,
                                  color: Colors.green, size: 28.0),
                              const SizedBox(width: 10.0),
                              Text(
                                ds["Name"] ?? "No Name",
                                style: AppWidget.normalTextstyle(20.0),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(Icons.location_on,
                                  color: Colors.green, size: 28.0),
                              const SizedBox(width: 10.0),
                              SizedBox(
                                width:
                                MediaQuery.of(context).size.width / 3,
                                child: Text(
                                  ds["Address"] ?? "No Address",
                                  style: AppWidget.normalTextstyle(20.0),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(Icons.inventory,
                                  color: Colors.green, size: 28.0),
                              const SizedBox(width: 10.0),
                              SizedBox(
                                width:
                                MediaQuery.of(context).size.width / 3,
                                child: Text(
                                  ds["Quantity"]?.toString() ?? "0",
                                  style: AppWidget.normalTextstyle(20.0),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5.0),
                          GestureDetector(
                            onTap: () {
                              // TODO: Approve logic
                              FirebaseFirestore.instance
                                  .collection("Requests")
                                  .doc(ds.id)
                                  .update({"Status": "Approved"});
                            },
                            child: Container(
                              height: 40,
                              width: 200,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  "Approve",
                                  style: AppWidget.whiteTextstyle(20.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 40.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Material(
                      elevation: 3.0,
                      borderRadius: BorderRadius.circular(60),
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(60),
                        ),
                        child: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: Colors.white,
                          size: 30.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width / 7),
                  Text(
                    "Admin Approval",
                    style: AppWidget.headlineTextstyle(25.0),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: Color(0xFFececf8),
                ),
                child: allApprovals(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
