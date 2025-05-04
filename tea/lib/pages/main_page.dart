import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tea/widgest/custom_button_bar.dart';
import 'package:tea/widgest/item_tea_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
    _tabController.addListener(_handleTabSelection);
    super.initState();
  }

  _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.sort_rounded,
                        color: Colors.white.withOpacity(0.5),
                        size: 30,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'Разработка мобильных приложений',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.pacifico(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                width: MediaQuery.of(context).size.width,
                height: 60,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 50, 54, 56),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Чай или ...',
                    hintStyle: GoogleFonts.pacifico(
                      fontSize: 20,
                      color: Colors.white.withOpacity(0.5),
                    ),
                    prefixIcon: const Icon(
                      Icons.search,
                      size: 30,
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
              TabBar(
                dividerColor: Colors.transparent,
                controller: _tabController,
                labelColor: Colors.green,
                unselectedLabelColor: Colors.white.withOpacity(0.5),
                isScrollable: true,
                indicator: const UnderlineTabIndicator(
                  borderSide: BorderSide(
                    color: Colors.green,
                    width: 3,
                  ),
                ),
                labelStyle: GoogleFonts.pacifico(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
                tabs: const [
                  Tab(text: 'Зелёный чай'),
                  Tab(text: 'Чёрный чай'),
                  Tab(text: 'Красный чай'),
                  Tab(text: 'Белый чай'),
                ],
              ),
              const SizedBox(height: 10),
              Center(
                child: [
                  const ItemTeaWidget(),
                  const ItemTeaWidget(),
                  const ItemTeaWidget(),
                  const ItemTeaWidget(),
                ][_tabController.index],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomButtonBar(),
    );
  }
}
