import 'package:flutter/material.dart';

//  列表视图
TableView(int index, bool ascending, List<DataColumn> columns,
    List<DataRow> rows, Function onRefresh) {
  return RefreshIndicator(
      onRefresh: onRefresh,
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: DataTable(
            sortColumnIndex: index,
            sortAscending: ascending,
            onSelectAll: (bool value) {},
            columns: columns,
            rows: rows),
      )
  );
}