import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finance_management_app/core/theme/theme_cubit.dart';

class ToggleSwitch extends StatefulWidget {
  final bool isThemeSwitch;
  final bool? initialValue;
  final Function(bool)? onChanged;

  const ToggleSwitch({
    super.key,
    this.isThemeSwitch = true,
    this.initialValue,
    this.onChanged,
  });

  @override
  State<ToggleSwitch> createState() => _ToggleSwitchState();
}

class _ToggleSwitchState extends State<ToggleSwitch> {
  late bool _isSwitched;

  @override
  void initState() {
    super.initState();
    _isSwitched = widget.initialValue ?? false;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isThemeSwitch) {
      final themeMode = context.watch<ThemeCubit>().state;
      final isDark = themeMode == ThemeMode.dark;
      return _buildSwitch(isDark, (value) {
        context.read<ThemeCubit>().toggleTheme(value);
        if (widget.onChanged != null) {
          widget.onChanged!(value);
        }
      });
    } else {
      return _buildSwitch(_isSwitched, (value) {
        setState(() {
          _isSwitched = value;
        });
        if (widget.onChanged != null) {
          widget.onChanged!(value);
        }
      });
    }
  }

  Widget _buildSwitch(bool value, ValueChanged<bool> onChanged) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      height: 35,
      width: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: value
            ? Theme.of(context).primaryColor
            : Colors.grey.withValues(alpha: 0.4),
      ),
      child: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            left: value ? 30 : 5,
            top: 2.5,
            child: GestureDetector(
              onTap: () => onChanged(!value),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: value
                      ? Theme.of(context).colorScheme.secondary
                      : Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 4,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Center(
                  child: value
                      ? Icon(Icons.check, size: 16, color: Colors.white)
                      : null,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
