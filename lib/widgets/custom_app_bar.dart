import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {

  final IconData leftIcon;
  final IconData rightIcon;
  final IconData? wishListIcon;
  final Function? leftCallback;
  final Function? wishListCallback;

  CustomAppBar(this.leftIcon, this.rightIcon, {this.wishListIcon, this.leftCallback, this.wishListCallback});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        left: 25,
        right: 25,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: leftCallback != null ? () => leftCallback!() : null,
            child: _buildIcon(leftIcon),
          ),
          Spacer(),
          if (wishListIcon != null)
            GestureDetector(
              onTap: wishListCallback != null ? () => wishListCallback!() : null,
              child: _buildIcon(wishListIcon!),
            ),
          SizedBox(width: 10), // Space between wishlist and right icon
          _buildIcon(rightIcon),
        ],
      ),
    );
  }

  Widget _buildIcon(IconData icon) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: Icon(icon),
    );
  }
}