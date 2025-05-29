import 'package:flutter/material.dart';
import 'package:yesno_app/domain/entities/message.dart';

class HerMessageBubble extends StatelessWidget {
  final Message message;
  const HerMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final DateTime time = message.sentAt.toLocal();
    final String hourText =
        '${_formatHour(time.hour)}:${_twoDigits(time.minute)} ${_getAmPm(time.hour)}';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: colors.secondary, borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  message.text,
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      hourText,
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
        const SizedBox(height: 5),
        if (message.imageUrl != null) _ImageBubble(imageUrl: message.imageUrl!),
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

class _ImageBubble extends StatelessWidget {
  final String imageUrl;
  const _ImageBubble({required this.imageUrl});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        imageUrl,
        width: size.width * 0.7,
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;

          return Container(
            width: size.width * 0.7,
            height: 150,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: const Text("Mi amor esta escribiendo"),
          );
        },
      ),
    );
  }
}
