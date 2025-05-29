import 'package:flutter/material.dart';
import 'package:yesno_app/domain/entities/message.dart';

class MyMessageBubble extends StatelessWidget {
  final Message message;
  const MyMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final DateTime time = message.sentAt.toLocal();
    final String formattedTime =
        '${_formatHour(time.hour)}:${_twoDigits(time.minute)} ${_getAmPm(time.hour)}';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
              color: colors.primary, borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  message.text,
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      formattedTime,
                      style:
                          const TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                    const SizedBox(width: 5),
                    Icon(
                      message.isRead ? Icons.done_all : Icons.done,
                      size: 16,
                      color: message.isRead
                          ? Colors.lightBlueAccent
                          : Colors.white70,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  String _twoDigits(int n) => n.toString().padLeft(2, '0');
  String _formatHour(int hour) {
    final h = hour % 12;
    return (h == 0 ? 12 : h).toString();
  }

  String _getAmPm(int hour) => hour >= 12 ? 'PM' : 'AM';
}
