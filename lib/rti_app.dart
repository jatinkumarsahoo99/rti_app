import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/app_theme/app_theme_provider.dart';
import 'app/common_widget/common_button.dart';
import 'app/common_widget/rti_drop_down.dart';
import 'app/common_widget/rti_drop_down2.dart';
import 'app/common_widget/rti_text_field.dart';
import 'app/common_widget/rtx_drop_down_search.dart';
import 'app/data/app_constant.dart';
import 'app/module/splash_screen/splash_screen.dart';
import 'app/screen_routes/screen_routes.dart';

class RtiApp extends StatefulWidget {
  const RtiApp({super.key});

  @override
  State<RtiApp> createState() => _RtiAppState();
}

class _RtiAppState extends State<RtiApp> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppThemeProvider>(
      builder: (_, provider, child) {
        applicationContext = context;

        final ThemeData theme = provider.themeData;
        return MaterialApp(
          navigatorKey: navigatorKey,
          title: 'RTI APP',
          debugShowCheckedModeBanner: false,
          theme: theme,
          routes: ScreenRoutes.appRoutes,
          home: const SplashScreen(),
          initialRoute: "/splashScreen",
          builder: (BuildContext context, Widget? child) {
            return Builder(
              builder: (BuildContext context) {
                return MediaQuery(
                  data: MediaQuery.of(context).copyWith(
                    textScaleFactor: MediaQuery.of(context).size.width > 360
                        ? 1.0
                        : MediaQuery.of(context).size.width >= 340
                            ? 0.9
                            : 0.8,
                  ),
                  child: child ?? const SizedBox(),
                );
              },
            );
          },
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? _selectedItem;
  final List<String> _items = ['Apple', 'Banana', 'Cherry', 'Date'];

  void _onMenuOpen() {
    print("Dropdown menu opened");
  }

  void _onMenuClose() {
    print("Dropdown menu closed");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RTITextField(
                controller: TextEditingController(),
                // errorText: _errorFName,
                padding: const EdgeInsets.only(left: 16, right: 16),
                titleText: "Enter your full name",
                hintText: "Enter your full name",
                keyboardType: TextInputType.name,
                radius: 100,
                onChanged: (String txt) {},
              ),
              CommonButton(
                padding: const EdgeInsets.only(left: 16, right: 16),
                buttonText: "Get Started",
                onTap: () {
                  // NavigationServices(context).gotoTabScreen();
                },
              ),
              CommonButton(
                padding: const EdgeInsets.only(left: 16, right: 16),
                buttonText: "Get Started",
                width: 150,
                backgroundColor: Colors.white,
                textColor: Colors.black,
                onTap: () {
                  // NavigationServices(context).gotoTabScreen();
                },
              ),
              CommonDropdown<String>(
                items: _items,
                selectedItem: _selectedItem,
                itemLabel: (item) => item,
                hintText: 'Choose a fruit',
                backgroundColor: Colors.white,
                borderRadius: 100.0,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                // textStyle: const TextStyle(color: Colors.black, fontSize: 16),
                dropdownHeight: 50.0,
                dropdownMaxHeight: 155,
                onMenuOpen: _onMenuOpen,
                onMenuClose: _onMenuClose,
                menuBackgroundColor: Colors.white,
                onChanged: (value) {
                  setState(() {
                    _selectedItem = value;
                  });
                  print("Selected Item: $value");
                },
              ),
              const SizedBox(height: 20),
              if (_selectedItem != null) Text("Selected: $_selectedItem", style: const TextStyle(fontSize: 18)),
              CommonDropdown<String>(
                items: _items,
                selectedItem: _selectedItem,
                itemLabel: (item) => item,
                hintText: 'Disabled dropdown',
                dropdownHeight: 50.0,
                dropdownMaxHeight: 155,
                backgroundColor: Colors.white,
                borderRadius: 100,
                isEnabled: false, // Disable dropdown
                onChanged: (value) {
                  print("Should not be called since dropdown is disabled");
                },
              ),
              CommonDropdown2<String>(
                items: _items,
                selectedItem: _selectedItem,
                itemLabel: (item) => item,
                hintText: 'Choose a fruit',
                backgroundColor: Colors.white,
                menuBackgroundColor: Colors.white, // Set menu background color
                borderRadius: 12.0,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                dropdownIcon: const Icon(Icons.arrow_drop_down_circle),
                onMenuOpen: _onMenuOpen,
                onMenuClose: _onMenuClose,
                dropdownMaxHeight: 200, // Max height of the dropdown
                onChanged: (value) {
                  setState(() {
                    _selectedItem = value;
                  });
                  print("Selected Item: $value");
                },
              ),

              /*CommonDropdownSearch<String>(
                items: _items,
                selectedItem: _selectedItem,
                itemLabel: (item) => item,
                hintText: 'Choose a fruit',
                backgroundColor: Colors.white,
                menuBackgroundColor: Colors.lightBlue[50], // Set menu background color
                borderRadius: 12.0,
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                textStyle: TextStyle(color: Colors.black, fontSize: 16),
                dropdownIcon: Icon(Icons.arrow_drop_down_circle),
                onMenuOpen: _onMenuOpen,
                onMenuClose: _onMenuClose,
                dropdownMaxHeight: 350, // Max height of the dropdown
                onChanged: (value) {
                  setState(() {
                    _selectedItem = value;
                  });
                  print("Selected Item: $value");
                },
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
