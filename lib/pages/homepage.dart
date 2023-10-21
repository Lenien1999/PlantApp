import 'package:flutter/material.dart';
import 'package:plantapp/model/plantmodel.dart';
import 'package:plantapp/style/textstyle.dart';

import '../widget/plantitem.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final searchController = TextEditingController();
  List<Plants> displayNewPlanList = List.from(plantsList);
  void searchList(String value) {
    if (value.isEmpty) {
      // Reset the list to the original list when the search text is empty
      setState(() {
        displayNewPlanList = List.from(plantsList);
      });
    } else {
      // Filter the list based on the search input
      setState(() {
        displayNewPlanList = plantsList
            .where((element) =>
                element.name.toLowerCase().contains(value.toLowerCase()))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 240, 235, 235),
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: const Icon(Icons.arrow_back_ios),
        centerTitle: true,
        title: Text(
          'Search Products',
          style: appstyle(color: Colors.black, size: 18, ff: FontWeight.w800),
        ),
        actions: [
          ClipRRect(
            borderRadius: BorderRadius.circular(200),
            child: SizedBox(
                width: 40, child: Image.asset('assets/images/avater.jpeg')),
          )
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 240, 235, 235),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.80,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          spreadRadius: 2,
                          offset: Offset(0, 1),
                          blurRadius: 2,
                          color: Colors.white)
                    ],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextFormField(
                    controller: searchController,
                    onChanged: (value) {
                      searchList(value);
                    },
                    decoration: InputDecoration(
                      suffixIcon: searchController.text.isNotEmpty
                          ? IconButton(
                              onPressed: () {
                                searchController.clear();
                                searchList('');
                                setState(() {});
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                              },
                              icon: const Icon(
                                Icons.close,
                                color: Colors.grey,
                              ))
                          : null,
                      border: InputBorder.none,
                      prefixIcon: const Icon(Icons.search),
                      hintText: 'Plants',
                      hintStyle: appstyle(
                          color: Colors.black, size: 14, ff: FontWeight.w400),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 6,
                ),
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                                spreadRadius: 2,
                                offset: Offset(0, 1),
                                blurRadius: 2,
                                color: Colors.white)
                          ],
                          border: Border.all(
                              width: 2,
                              color: const Color.fromARGB(255, 245, 242, 242)),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        height: 50,
                        width: 50,
                        child: const Center(
                          child: Icon(
                            Icons.settings_applications,
                            color: Colors.black,
                          ),
                        )),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Found \n${displayNewPlanList.length} Results',
              style:
                  appstyle(color: Colors.black, size: 20, ff: FontWeight.bold),
            ),
            Expanded(
                child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.6,

                crossAxisCount: 2, // Number of columns
                mainAxisSpacing: 15.0, // Vertical spacing between items
                crossAxisSpacing: 30.0, // Horizontal spacing between items
              ),
              itemCount: displayNewPlanList.length,
              itemBuilder: (context, index) {
                final isEven = index.isEven;

                final plant = displayNewPlanList[index];
                return isEven
                    ? Transform.translate(
                        offset: const Offset(0, 20),
                        child: PlantItem(
                          isEven: isEven,
                          plant: plant,
                        ))
                    : PlantItem(
                        isEven: isEven,
                        plant: plant,
                      );
              },
            )),
          ],
        ),
      ),
    );
  }
}
