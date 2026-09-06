import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  static const List<_NotificationItem> _notifications = [
    _NotificationItem(
      title: 'Order update',
      message: 'Your kitchen items are ready to ship.',
      time: '2 min ago',
    ),
    _NotificationItem(
      title: 'New offer',
      message: 'Get fresh deals on electronics today.',
      time: '15 min ago',
    ),
    _NotificationItem(
      title: 'Beauty sale',
      message: 'Lip care and makeup products are now discounted.',
      time: '1 hr ago',
    ),
    _NotificationItem(
      title: 'Medical reminder',
      message: 'Wellness products are available with fast delivery.',
      time: '3 hr ago',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notifications',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(14),
        itemCount: _notifications.length,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final notification = _notifications[index];

          return Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Theme.of(context).dividerColor.withOpacity(0.25),
              ),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x0D000000),
                  blurRadius: 8,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 42,
                  height: 42,
                  decoration: const BoxDecoration(
                    color: Color(0xFFF1F0FF),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.notifications_none_outlined,
                    color: Color(0xFF7367D9),
                    size: 22,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        notification.title,
                        style: const TextStyle(
                          color: Color(0xFF222222),
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        notification.message,
                        style: const TextStyle(
                          color: Color(0xFF777777),
                          fontSize: 13,
                          height: 1.3,
                        ),
                      ),
                      const SizedBox(height: 7),
                      Text(
                        notification.time,
                        style: const TextStyle(
                          color: Color(0xFF9E9E9E),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _NotificationItem {
  const _NotificationItem({
    required this.title,
    required this.message,
    required this.time,
  });

  final String title;
  final String message;
  final String time;
}
