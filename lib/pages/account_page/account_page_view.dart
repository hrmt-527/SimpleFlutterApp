import 'package:flutter/material.dart';

class AccountPageView extends StatefulWidget {
  AccountPageView({Key? key}) : super(key: key);

  _AccountPageView createState() => _AccountPageView();
}

class _AccountPageView extends State<AccountPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            ProfileView(),
            ProfileListView(),
          ],
        ),
      ),
    );
  }
}

class ProfileView extends StatefulWidget {
  ProfileView({Key? key}) : super(key: key);
  _ProfileView createState() => _ProfileView();
}

class _ProfileView extends State<ProfileView> {
  double width = 0;
  double height = 0;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.all(2.0),
      constraints: BoxConstraints(
          maxHeight: .3 * height,
          maxWidth: (width - 2.0),
          minHeight: .3 * height,
          minWidth: (width - 2.0)),
      decoration: BoxDecoration(
          border: Border.all(width: 2),
          borderRadius: BorderRadius.all(Radius.circular(2.7))),
      child: Icon(Icons.verified_user_rounded),
    );
  }
}

class ProfileListView extends StatefulWidget {
  ProfileListView({Key? key}) : super(key: key);
  _ProfileListView createState() => _ProfileListView();
}

class _ProfileListView extends State<ProfileListView> {
  double width = 0;
  double height = 0;
  List profileOptionList = [];

  @override
  void initState() {
    super.initState();
    profileOptionList = ["Change Password", "Settings", "Logout"];
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Container(
      height: height * .5,
      child: ListView.builder(
        padding: EdgeInsets.all(2),
        //   physics: ClampingScrollPhysics(),
        itemCount: profileOptionList.length,
        itemBuilder: (context, index) {
          return ABC(data: profileOptionList[index]);
          // ListTile(
          //   contentPadding: EdgeInsets.only(left: 7, top: 4),
          //   shape: RoundedRectangleBorder(
          //       side: BorderSide(color: Colors.blueGrey, width: 2),
          //       borderRadius: BorderRadius.all(Radius.circular(2))),
          //   title: Text(profileOptionList[index]),
          //   onTap: () {
          //     print(profileOptionList[index]);
          //   },
          // );
        },
      ),
    );

    // return Container(
    //     height: .5 * height,
    //     margin: EdgeInsets.all(2.0),
    //     color: Colors.amberAccent,
    //     // constraints: BoxConstraints(
    //     //     maxHeight: .3 * height,
    //     //     maxWidth: (width - 2.0),
    //     //     minHeight: .3 * height,
    //     //     minWidth: (width - 2.0)), BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(1))),

    //     child: ListView.builder(
    //       padding: EdgeInsets.all(2),
    //       //   physics: ClampingScrollPhysics(),
    //       itemCount: profileOptionList.length,
    //       itemBuilder: (context, index) {
    //         return ListTile(
    //           shape: Border.all(
    //               width: 10, color: Colors.white, style: BorderStyle.solid),
    //           title: Text(profileOptionList[index]),
    //           tileColor: Colors.black,
    //         );
    //       },
    //     ));
  }
}

class ABC extends StatelessWidget {
  ABC({required this.data});
  final String data;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Text(
        data,
        style: TextStyle(fontSize: 20),
      ),
      shape:
          Border.all(width: 1, color: Colors.white, style: BorderStyle.solid),
    );
  }
}
