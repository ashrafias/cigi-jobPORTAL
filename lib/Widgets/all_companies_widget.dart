//import 'package:career_portal/Search/profile_company.dart';
import 'package:flutter/material.dart';

class AllWorkersWidget extends StatefulWidget {
  final String userID;
  final String userName;

  final String userEmail;

  final String phoneNumber;
  final String userImageUrl;

  AllWorkersWidget({
    required this.userID,
    required this.userName,
    required this.userEmail,
    required this.phoneNumber,
    required this.userImageUrl,
  });

  @override
  State<AllWorkersWidget> createState() => _AllWorkersWidget();
}

class _AllWorkersWidget extends State<AllWorkersWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      color: Colors.white10,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: ListTile(
        onTap: () {
//Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProfileScreen(userID : widget.userID)));
        },
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        leading: Container(
          padding: const EdgeInsets.only(right: 12),
          decoration: const BoxDecoration(
              border: Border(
            right: BorderSide(width: 1),
          )),
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 20,
            child: Image.network(widget.userImageUrl == null
                ? 'https://www.w3schools.com/howto/img_avatar.png'
                : widget.userImageUrl),
          ),
        ),
        title: Text(
          widget.userName,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
/*subtitle  : Column (
  crossAxisAlignment : CrossAxisAlignment.start,
  mainAxisAlignment : MainAxisAlignment.start,
  children : [
    Text(
      'Visit Profile' )
  ]
)*/
      ),
    );
  }
}
