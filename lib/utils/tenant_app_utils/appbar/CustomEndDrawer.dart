import 'package:manage_hotel/utils/app_export.dart';
import 'package:manage_hotel/view/widgets/drawer_page/profile.dart';
import 'package:manage_hotel/view/widgets/drawer_page/settings.dart';

class CustomEndDrawer extends StatelessWidget {
  const CustomEndDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                  color: Color(0xff62a3da)
              ),
              currentAccountPicture: CircleAvatar(backgroundImage: AssetImage("assets/images/app_dp.jpeg"),),
              otherAccountsPictures: [
                Icon(Icons.dark_mode,color: Colors.white,)
              ],
              accountName: Text("Trivendra sahu"), accountEmail: Text("trivendrasahu022@gmail.com")),



          ListTile(
            leading: Icon(Icons.person),
            title: Text('My Profile'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> ProfileScreen())); // Close the drawer
            },
          ),
          ListTile(
            leading: Icon(Icons.devices),
            title: Text('Linked devices'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
            },
          ),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Payments'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> SettingsScreen())); // Close the drawer
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              Navigator.pushNamed(context, AppRouteName.loginScreen);
            },
          ),
          // Add more items here as needed
        ],
      ),
    );
  }


}

