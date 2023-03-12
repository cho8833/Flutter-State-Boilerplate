import 'package:flutter/material.dart';

// 22/10/07 edited by Charlie

void selectNavigateDialog(BuildContext context) {
  showDialog(
      barrierColor: const Color.fromRGBO(0, 0, 0, 0.3),
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        var buttonStyle = TextButton.styleFrom(
            padding: EdgeInsets.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            minimumSize: Size.zero,
            foregroundColor: const Color(0xff808080)
        );
        return Material(
          color: Colors.transparent,
          // Button for pop context when pressing rest of screen
          child: MaterialButton(
            padding: EdgeInsets.zero,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            enableFeedback: false,
            onPressed: () {
              Navigator.pop(context);
            },
            // can be Center, Column, etc..
            child: Stack(
              children: [
                // edit position where you want
                Positioned(
                  right: 16,
                  bottom: 80,
                  // dialog contents
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
                      child: Wrap(
                        direction: Axis.vertical,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: buttonStyle,
                            child: Row(
                              children: [
                                Container(
                                  width: 20,
                                  alignment: Alignment.centerRight,
                                  margin: const EdgeInsets.only(right: 10),
                                ),
                                const Text('Camera')
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 13,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: buttonStyle,
                            child: Row(
                              children: [
                                Container(
                                  width: 20,
                                  alignment: Alignment.centerRight,
                                  margin: const EdgeInsets.only(right: 10),
                                ),
                                const Text('Style Quiz')
                              ],
                            ),
                          )
                        ],
                      )),
                )
              ],
            ),
          ),
        );
      });
}