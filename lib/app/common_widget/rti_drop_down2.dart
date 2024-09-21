import 'package:flutter/material.dart';

import '../app_theme/text_styles.dart';

class CommonDropdown2<T> extends StatefulWidget {
  final List<T> items;
  final T? selectedItem;
  final String Function(T) itemLabel;
  final ValueChanged<T?> onChanged;
  final String hintText;
  final double? dropdownHeight;
  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final Color? menuBackgroundColor; // Custom menu background color
  final double borderRadius;
  final TextStyle? textStyle;
  final Icon? dropdownIcon; // Custom dropdown icon
  final VoidCallback? onMenuOpen; // Callback when dropdown opens
  final VoidCallback? onMenuClose; // Callback when dropdown closes
  final double? dropdownMaxHeight; // Maximum height for the dropdown menu
  final bool isEnabled; // Whether the dropdown is enabled or disabled

  const CommonDropdown2({
    super.key,
    required this.items,
    required this.onChanged,
    required this.itemLabel,
    this.selectedItem,
    this.hintText = 'Select an item',
    this.dropdownHeight,
    this.contentPadding,
    this.backgroundColor,
    this.menuBackgroundColor,
    this.borderRadius = 8.0,
    this.textStyle,
    this.padding,
    this.dropdownIcon,
    this.onMenuOpen,
    this.onMenuClose,
    this.dropdownMaxHeight,
    this.isEnabled = true, // Default is enabled
  });

  @override
  _CommonDropdown2State<T> createState() => _CommonDropdown2State<T>();
}

class _CommonDropdown2State<T> extends State<CommonDropdown2<T>> {
  bool isDropdownOpen = false;

  void _triggerOpenCallback() {
    if (!isDropdownOpen && widget.onMenuOpen != null) {
      widget.onMenuOpen!();
      isDropdownOpen = true;
    }
  }

  void _triggerCloseCallback() {
    if (isDropdownOpen && widget.onMenuClose != null) {
      widget.onMenuClose!();
      isDropdownOpen = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      child: Container(
        padding: widget.contentPadding ?? const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        height: widget.dropdownHeight,
        decoration: BoxDecoration(
          color: widget.backgroundColor ?? Colors.white,
          borderRadius: BorderRadius.circular(widget.borderRadius),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: PopupMenuButton<T>(
          itemBuilder: (BuildContext context) {
            return widget.items.map((T item) {
              return PopupMenuItem<T>(
                value: item,
                child: Text(
                  widget.itemLabel(item),
                  style: widget.textStyle ??
                      TextStyles(context).googlePoppinsFontsForText(
                          fontWeight: FontWeight.w400, fontSize: 13, color: const Color.fromRGBO(0, 0, 0, 0.8)),
                ),
              );
            }).toList();
          },
          onSelected: (T? newValue) {
            setState(() {
              widget.onChanged(newValue);
            });
            _triggerCloseCallback();
          },
          onCanceled: _triggerCloseCallback,
          color: widget.menuBackgroundColor, // Set menu background color
          constraints: BoxConstraints(maxHeight: widget.dropdownMaxHeight ?? double.infinity),
          enableFeedback: widget.isEnabled,
          onOpened: _triggerOpenCallback,
          child: Container(
            height: widget.dropdownHeight,
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.selectedItem != null ? widget.itemLabel(widget.selectedItem as T) : widget.hintText,
                  style: widget.textStyle ??
                      TextStyles(context).googlePoppinsFontsForText(
                          fontWeight: FontWeight.w400, fontSize: 13, color: const Color.fromRGBO(0, 0, 0, 0.8)),
                ),
                widget.dropdownIcon ?? const Icon(Icons.arrow_drop_down),
              ],
            ),
          ), // Called when the menu opens
        ),
      ),
    );
  }
}
