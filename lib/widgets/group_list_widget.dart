import 'package:flutter/material.dart';

enum DebtType {
  owe,
  owed,
  settled,
}

class GroupListWidget extends StatelessWidget {
  final String image;
  final String groupName;
  final DebtType debtType;
  final double? amount;
  final List<Map<String, dynamic>>? debtPeek;

  const GroupListWidget({
    required this.image,
    this.amount,
    required this.groupName,
    required this.debtType,
    this.debtPeek,
    Key? key,
  }) : super(key: key);

  String debtToString(DebtType debtType) {
    switch (debtType) {
      case DebtType.owe:
        return 'You owe';
      case DebtType.owed:
        return 'You are owed';
      case DebtType.settled:
        return 'Settled Up';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: SizedBox(
                height: 100,
                width: 100,
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    groupName,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "${debtToString(debtType)} ${debtType != DebtType.settled ? '\$ ${amount!.toStringAsPrecision(2)}' : ''}",
                    style: TextStyle(
                      color: debtType == DebtType.settled
                          ? Colors.grey
                          : Colors.orange,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  debtType != DebtType.settled
                      ? Column(
                          children: debtPeek!
                              .map((debt) => Row(
                                    children: [
                                      Text(
                                        '${debtToString(debt['type'])} ${debtType == DebtType.owed ? 'by ${debt['user']}' : '${debt['user']}'} ',
                                        style:
                                            const TextStyle(color: Colors.grey),
                                      ),
                                      const SizedBox(width: 1),
                                      Text(
                                        '\$${debt['amount'].toString()}',
                                        style: const TextStyle(
                                            color: Colors.orange),
                                      )
                                    ],
                                  ))
                              .toList(),
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
