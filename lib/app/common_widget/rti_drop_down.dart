/*
import 'package:flutter/material.dart';

import '../app_theme/text_styles.dart';

class CommonDropdown<T> extends StatelessWidget {
  final List<T> items;
  final T? selectedItem;
  final String Function(T) itemLabel; // Function to get the label of each item
  final ValueChanged<T?> onChanged;
  final String hintText;
  final double? dropdownHeight;
  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final double borderRadius;
  final TextStyle? textStyle;

  const CommonDropdown({
    super.key,
    required this.items,
    required this.onChanged,
    required this.itemLabel,
    this.selectedItem,
    this.hintText = 'Select an item',
    this.dropdownHeight,
    this.contentPadding,
    this.backgroundColor,
    this.borderRadius = 8.0,
    this.textStyle,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      child: Container(
        padding: contentPadding ?? const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        height: dropdownHeight,
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.white,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<T>(
            value: selectedItem,
            hint: Text(hintText,
                style: textStyle ??
                    TextStyles(context).googlePoppinsFontsForText(
                        fontWeight: FontWeight.w400, fontSize: 13, color: const Color.fromRGBO(0, 0, 0, 0.8))),
            isExpanded: true,
            style: textStyle ??
                TextStyles(context).googlePoppinsFontsForText(
                    fontWeight: FontWeight.w400, fontSize: 13, color: const Color.fromRGBO(0, 0, 0, 0.8)),
            items: items.map((T item) {
              return DropdownMenuItem<T>(
                value: item,
                child: Text(itemLabel(item),
                    style: textStyle ??
                        TextStyles(context).googlePoppinsFontsForText(
                            fontWeight: FontWeight.w400, fontSize: 13, color: const Color.fromRGBO(0, 0, 0, 0.8))),
              );
            }).toList(),
            onChanged: onChanged,
            icon: const Icon(Icons.arrow_drop_down),
            // itemHeight: dropdownHeight ?? kMinInteractiveDimension,
          ),
        ),
      ),
    );
  }
}
*/

import 'package:flutter/material.dart';

import '../app_theme/text_styles.dart';

class CommonDropdown<T> extends StatefulWidget {
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

  const CommonDropdown({
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
  _CommonDropdownState<T> createState() => _CommonDropdownState<T>();
}

class _CommonDropdownState<T> extends State<CommonDropdown<T>> {
  bool isDropdownOpen = false;

  @override
  void dispose() {
    _triggerCloseCallback();
    super.dispose();
  }

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
        child: DropdownButtonHideUnderline(
          child: DropdownButton<T>(
            value: widget.selectedItem,
            hint: Text(
              widget.hintText,
              style: widget.textStyle ??
                  TextStyles(context).googlePoppinsFontsForText(
                      fontWeight: FontWeight.w400, fontSize: 13, color: const Color.fromRGBO(0, 0, 0, 0.8)),
            ),
            isExpanded: true,
            style: widget.textStyle ??
                TextStyles(context).googlePoppinsFontsForText(
                    fontWeight: FontWeight.w400, fontSize: 13, color: const Color.fromRGBO(0, 0, 0, 0.8)),
            items: widget.items.map((T item) {
              return DropdownMenuItem<T>(
                value: item,
                child: Container(
                  color: widget.menuBackgroundColor, // Set menu background color
                  child: Text(
                    widget.itemLabel(item),
                    style: widget.textStyle ??
                        TextStyles(context).googlePoppinsFontsForText(
                            fontWeight: FontWeight.w400, fontSize: 13, color: const Color.fromRGBO(0, 0, 0, 0.8)),
                  ),
                ),
              );
            }).toList(),
            onChanged: widget.isEnabled
                ? (T? newValue) {
              setState(() {
                widget.onChanged(newValue);
              });
              _triggerCloseCallback();
            }
                : null, // Disable the dropdown if `isEnabled` is false
            onTap: widget.isEnabled
                ? () {
              _triggerOpenCallback();
            }
                : null, // Disable tap if `isEnabled` is false
            icon: widget.dropdownIcon ?? const Icon(Icons.arrow_drop_down),
            menuMaxHeight: widget.dropdownMaxHeight,
            disabledHint: Text(
              widget.hintText,
              style: widget.textStyle?.copyWith(color: Colors.grey) ??
                  TextStyles(context).googlePoppinsFontsForText(
                      fontWeight: FontWeight.w400, fontSize: 13, color: Colors.grey),
            ), // Hint for disabled state
          ),
        ),
      ),
    );
  }
}

