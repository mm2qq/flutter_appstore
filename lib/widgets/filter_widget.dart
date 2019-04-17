import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../blocs/app_history_bloc.dart';
import 'action_sheet_wrapper.dart';

class FilterWidget extends StatefulWidget {
  FilterWidget({
    Key key,
    this.color,
    this.maxHeight,
    @required this.bloc,
    @required this.onTapEnvironment,
    @required this.onTapVersion,
  }) : super(key: key);

  final Color color;

  final double maxHeight;

  final AppHistoryBloc bloc;

  final ValueChanged<String> onTapEnvironment;

  final ValueChanged<String> onTapVersion;

  @override
  _FilterWidgetState createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget>
    with SingleTickerProviderStateMixin {
  List<String> _environments;

  List<String> _versions;

  int _environmentIndex;

  int _versionIndex;

  String _confirmEnvironment;

  String _confirmVersion;

  @override
  void initState() {
    _environmentIndex = 0;
    _versionIndex = 0;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    widget.bloc.result.listen((result) {
      setState(() {
        _environments = result == null ? null : result.environments;
        _versions = result == null ? null : result.versions;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          CupertinoButton(
            child: Row(
              children: <Widget>[
                Text(
                  _confirmEnvironment == null
                      ? '环境'
                      : '环境($_confirmEnvironment)',
                  style: TextStyle(
                    inherit: false,
                    color: CupertinoColors.black,
                    fontSize: 12.0,
                  ),
                ),
                Icon(
                  Icons.arrow_drop_down,
                  color: CupertinoColors.black,
                ),
              ],
            ),
            padding: EdgeInsets.all(0.0),
            onPressed: () {
              _handleTapEnvironment(context);
            },
          ),
          CupertinoButton(
            child: Row(
              children: <Widget>[
                Text(
                  _confirmVersion == null ? '版本' : '版本($_confirmVersion)',
                  style: TextStyle(
                    inherit: false,
                    color: CupertinoColors.black,
                    fontSize: 12.0,
                  ),
                ),
                Icon(
                  Icons.arrow_drop_down,
                  color: CupertinoColors.black,
                ),
              ],
            ),
            padding: EdgeInsets.all(0.0),
            onPressed: () {
              _handleTapVersion(context);
            },
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      ),
      color: widget.color == null ? Color(0xFFF9F9F9) : widget.color,
      height: widget.maxHeight == null ? 40.0 : widget.maxHeight,
    );
  }

  void _handleTapEnvironment(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return ActionSheetWrapper(
          child: CupertinoPicker.builder(
            childCount: _environments == null ? 0 : _environments.length,
            itemExtent: 32.0,
            onSelectedItemChanged: (index) {
              _environmentIndex = index;
            },
            scrollController: FixedExtentScrollController(
              initialItem: _environmentIndex,
            ),
            itemBuilder: (BuildContext context, int index) {
              return Text(
                _environments[index],
                style: TextStyle(
                  inherit: false,
                  color: CupertinoColors.black,
                  fontSize: 17.0,
                ),
              );
            },
          ),
          onConfirmed: () {
            if (_environments != null && _environments.length > 0) {
              final _environment = _environments[_environmentIndex];

              if (_confirmEnvironment != _environment) {
                setState(() {
                  _confirmEnvironment = _environment;
                  widget.onTapEnvironment(_environment);
                });
              }
            }
          },
        );
      },
    );
  }

  void _handleTapVersion(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return ActionSheetWrapper(
          child: CupertinoPicker.builder(
            childCount: _versions == null ? 0 : _versions.length,
            itemExtent: 32.0,
            onSelectedItemChanged: (index) {
              _versionIndex = index;
            },
            scrollController: FixedExtentScrollController(
              initialItem: _versionIndex,
            ),
            itemBuilder: (BuildContext context, int index) {
              return Text(
                _versions[index],
                style: TextStyle(
                  inherit: false,
                  color: CupertinoColors.black,
                  fontSize: 17.0,
                ),
              );
            },
          ),
          onConfirmed: () {
            if (_versions != null && _versions.length > 0) {
              final _version = _versions[_versionIndex];

              if (_confirmVersion != _version) {
                setState(() {
                  _confirmVersion = _version;
                  widget.onTapVersion(_version);
                });
              }
            }
          },
        );
      },
    );
  }
}
