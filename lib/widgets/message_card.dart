import 'package:flutter/material.dart';
import 'package:flutter_ai_app/models/message.dart';

class MessageCard extends StatelessWidget {
  final Message message;
  const MessageCard({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return message.msgType == MessageType.bot ? Row(
      children: [
        CircleAvatar(
          radius: 18,
          backgroundColor: Colors.white,
          child: Image.asset("assets/images/logo.png", width: 24,),
        ),
        Container(
          constraints: BoxConstraints(
            maxWidth: size.width * 0.6
          ),
          margin: EdgeInsets.only(bottom: size.height * .02,
          left: size.width * .02
          ),
          padding: EdgeInsets.symmetric(
            vertical: size.height * .01,
            horizontal: size.width * .02
          ),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black54),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(15),
              bottomRight: Radius.circular(15),
              topLeft: Radius.circular(15)
            )
          ),
          child: Text(
            message.msg
          ),
        )
      ],
    ) : Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          constraints: BoxConstraints(
            maxWidth: size.width * 0.6
          ),
          margin: EdgeInsets.only(bottom: size.height * .02,
              right: size.width * .02
          ),
          padding: EdgeInsets.symmetric(
              vertical: size.height * .01,
              horizontal: size.width * .02
          ),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black54),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                  topLeft: Radius.circular(15)
              )
          ),
          child: Text(
              message.msg
          ),
        ),
        CircleAvatar(
          radius: 18,
          backgroundColor: Colors.white,
          child: Icon(Icons.person,
           color: Colors.blue,
          ),
        ),
      ],
    );
  }
}
