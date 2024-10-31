import 'package:flutter/material.dart';

class StarWidget extends StatefulWidget {
  final bool isFavorite;
  final ValueChanged<bool>? onChanged;
  const StarWidget({super.key, required this.isFavorite, this.onChanged});

  @override
  State<StarWidget> createState() => _StarWidgetState();
}

class _StarWidgetState extends State<StarWidget> {
  late bool _isFavorite;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.isFavorite;
  }

  void _toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
    if (widget.onChanged != null) {
      widget.onChanged!(_isFavorite);
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        _isFavorite ? Icons.star : Icons.star_border,
        color: _isFavorite ? Colors.yellow.shade600 : Colors.grey,
        size: 40,
      ),
      onPressed: _toggleFavorite,
    );
  }
}
