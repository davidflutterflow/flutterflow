import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserGradeWidget extends StatefulWidget {
  const UserGradeWidget({Key key}) : super(key: key);

  @override
  _UserGradeWidgetState createState() => _UserGradeWidgetState();
}

class _UserGradeWidgetState extends State<UserGradeWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryColor,
          automaticallyImplyLeading: false,
          flexibleSpace: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 14),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                        child: FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30,
                          borderWidth: 1,
                          buttonSize: 50,
                          icon: Icon(
                            Icons.arrow_back_rounded,
                            color: Colors.white,
                            size: 30,
                          ),
                          onPressed: () {
                            print('IconButton pressed ...');
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                        child: Text(
                          'Back',
                          style: FlutterFlowTheme.of(context).title2.override(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                                fontSize: 16,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                  child: Text(
                    'Users base on grade',
                    style: FlutterFlowTheme.of(context).title2.override(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          fontSize: 18,
                        ),
                  ),
                ),
              ],
            ),
          ),
          actions: [],
          elevation: 2,
        ),
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                  child: StreamBuilder<List<UsersRecord>>(
                    stream: queryUsersRecord(
                      queryBuilder: (usersRecord) =>
                          usersRecord.orderBy('total_number'),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: CircularProgressIndicator(
                              color: FlutterFlowTheme.of(context).primaryColor,
                            ),
                          ),
                        );
                      }
                      List<UsersRecord> columnUsersRecordList = snapshot.data;
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        children: List.generate(columnUsersRecordList.length,
                            (columnIndex) {
                          final columnUsersRecord =
                              columnUsersRecordList[columnIndex];
                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      columnUsersRecord.email,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      columnUsersRecord.totalNumber.toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30,
                                          borderWidth: 1,
                                          buttonSize: 44,
                                          icon: Icon(
                                            Icons.remove,
                                            color: Colors.black,
                                            size: 20,
                                          ),
                                          onPressed: () async {
                                            if (FFAppState().alwaysTrue) {
                                              final usersUpdateData = {
                                                'gradeOne':
                                                    FieldValue.increment(-1),
                                              };
                                              await columnUsersRecord.reference
                                                  .update(usersUpdateData);
                                            }
                                            if (!(FFAppState().alwaysFalse)) {
                                              final usersUpdateData =
                                                  createUsersRecordData(
                                                totalNumber:
                                                    functions.calculateTotal(
                                                        columnUsersRecord),
                                              );
                                              await columnUsersRecord.reference
                                                  .update(usersUpdateData);
                                            }
                                          },
                                        ),
                                        Text(
                                          columnUsersRecord.gradeOne.toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1,
                                        ),
                                        FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30,
                                          borderWidth: 1,
                                          buttonSize: 44,
                                          icon: Icon(
                                            Icons.add_box_outlined,
                                            color: Colors.black,
                                            size: 20,
                                          ),
                                          onPressed: () async {
                                            if (FFAppState().alwaysTrue) {
                                              final usersUpdateData = {
                                                'gradeOne':
                                                    FieldValue.increment(1),
                                              };
                                              await columnUsersRecord.reference
                                                  .update(usersUpdateData);
                                            }
                                            if (!(FFAppState().alwaysFalse)) {
                                              final usersUpdateData =
                                                  createUsersRecordData(
                                                totalNumber:
                                                    functions.calculateTotal(
                                                        columnUsersRecord),
                                              );
                                              await columnUsersRecord.reference
                                                  .update(usersUpdateData);
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Divider(),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30,
                                          borderWidth: 1,
                                          buttonSize: 44,
                                          icon: Icon(
                                            Icons.remove,
                                            color: Colors.black,
                                            size: 20,
                                          ),
                                          onPressed: () async {
                                            if (FFAppState().alwaysTrue) {
                                              final usersUpdateData = {
                                                'gradeTwo':
                                                    FieldValue.increment(-1),
                                              };
                                              await columnUsersRecord.reference
                                                  .update(usersUpdateData);
                                            }
                                            if (!(FFAppState().alwaysFalse)) {
                                              final usersUpdateData =
                                                  createUsersRecordData(
                                                totalNumber:
                                                    functions.calculateTotal(
                                                        columnUsersRecord),
                                              );
                                              await columnUsersRecord.reference
                                                  .update(usersUpdateData);
                                            }
                                          },
                                        ),
                                        Text(
                                          columnUsersRecord.gradeTwo.toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1,
                                        ),
                                        FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30,
                                          borderWidth: 1,
                                          buttonSize: 44,
                                          icon: Icon(
                                            Icons.add_box_outlined,
                                            color: Colors.black,
                                            size: 20,
                                          ),
                                          onPressed: () async {
                                            if (FFAppState().alwaysTrue) {
                                              final usersUpdateData = {
                                                'gradeTwo':
                                                    FieldValue.increment(1),
                                              };
                                              await columnUsersRecord.reference
                                                  .update(usersUpdateData);
                                            }
                                            if (!(FFAppState().alwaysFalse)) {
                                              final usersUpdateData =
                                                  createUsersRecordData(
                                                totalNumber:
                                                    functions.calculateTotal(
                                                        columnUsersRecord),
                                              );
                                              await columnUsersRecord.reference
                                                  .update(usersUpdateData);
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }),
                      );
                    },
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
