import 'package:asset_tracker/apis/apis.dart';
import 'package:asset_tracker/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class UserCard extends StatelessWidget {

  final DateFormat _formatter = DateFormat('yyyy-MM-dd HH:mm');

  final User user;
  final Function(User) onUserUpdated;

  UserCard({
    Key? key,
    required this.user,
    required this.onUserUpdated,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go('/users/${user.id}', extra: user);
      },
      child: Card(
        elevation: 15,
        shadowColor: Colors.black.withOpacity(0.25),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 15, left: 15, right: 15),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.network(user.avatar ?? _defaultAvatar),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(user.name ?? 'Unknown', style: TextStyles.h2.copyWith(fontSize: 16, fontWeight: FontWeight.w600)),
                                ),
                                const SizedBox(width: 15),
                                Switch(
                                  value: user.active ?? false,
                                  onChanged: (value) {
                                    // Update user status and notify the parent widget.
                                    user.active = value;
                                    onUserUpdated(user);
                                  },
                                  activeColor: const Color(0xff00D098),
                                  inactiveTrackColor: const Color(0xff62707E),
                                ),
                              ],
                            ),
                            _UserCardLine(label: 'Created On', text: _createdOn(user.createdAt)),
                            _UserCardLine(label: 'User ID', text: user.id ?? ''),
                            const SizedBox(height: 8),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: 20,
                decoration: BoxDecoration(
                  color: (user.active ?? false) ? const Color(0xff00D098) : const Color(0xff62707E),
                  borderRadius: const BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _createdOn(String? timestamp) {
    DateTime date = DateTime.tryParse(user.createdAt ?? '') ?? DateTime.fromMillisecondsSinceEpoch(0);
    return _formatter.format(date);
  }

  final String _defaultAvatar = 'https://cdn5.vectorstock.com/i/1000x1000/51/99/icon-of-user-avatar-for-web-site-or-mobile-app-vector-3125199.jpg';
}

class _UserCardLine extends StatelessWidget {

  final String label;
  final String text;

  const _UserCardLine({
    Key? key,
    required this.label,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyles.p.copyWith(color: const Color(0xff87909a), fontWeight: FontWeight.w600, fontSize: 12),
        ),
        Text(
          text,
          style: TextStyles.p.copyWith(color: const Color(0xff1B2934), fontWeight: FontWeight.w700, fontSize: 13),
        ),
      ],
    );
  }
}
