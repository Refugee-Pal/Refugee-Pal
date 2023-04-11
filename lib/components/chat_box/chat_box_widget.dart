import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chat_box_model.dart';
export 'chat_box_model.dart';

class ChatBoxWidget extends StatefulWidget {
  const ChatBoxWidget({
    Key? key,
    this.chat,
    this.messages,
  }) : super(key: key);

  final ChatsRecord? chat;
  final MessagesRecord? messages;

  @override
  _ChatBoxWidgetState createState() => _ChatBoxWidgetState();
}

class _ChatBoxWidgetState extends State<ChatBoxWidget> {
  late ChatBoxModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatBoxModel());

    _model.textController ??= TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 1.0,
      height: 100.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Material(
            color: Colors.transparent,
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(28.0),
            ),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.77,
              height: 56.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
                borderRadius: BorderRadius.circular(28.0),
                border: Border.all(
                  color: FlutterFlowTheme.of(context).primary,
                  width: 2.0,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                      child: TextFormField(
                        controller: _model.textController,
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: FFLocalizations.of(context).getText(
                            '69oo4eqr' /* Message */,
                          ),
                          hintStyle: FlutterFlowTheme.of(context).bodyMedium,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          focusedErrorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              color: FlutterFlowTheme.of(context).secondaryText,
                            ),
                        validator:
                            _model.textControllerValidator.asValidator(context),
                      ),
                    ),
                  ),
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30.0,
                    borderWidth: 1.0,
                    buttonSize: 56.0,
                    fillColor: FlutterFlowTheme.of(context).primary,
                    icon: FaIcon(
                      FontAwesomeIcons.solidPaperPlane,
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      size: 35.0,
                    ),
                    onPressed: () async {
                      if (widget.chat!.lastmessageuser ==
                          valueOrDefault(currentUserDocument?.name, '')) {
                        if (dateTimeFormat(
                              'M/d H:mm',
                              widget.chat!.lastmessagetime,
                              locale: FFLocalizations.of(context).languageCode,
                            ) ==
                            dateTimeFormat(
                              'M/d H:mm',
                              getCurrentTimestamp,
                              locale: FFLocalizations.of(context).languageCode,
                            )) {
                          final messagesCreateData1 = {
                            ...createMessagesRecordData(
                              text: _model.textController.text,
                              user:
                                  valueOrDefault(currentUserDocument?.name, ''),
                              showTime: false,
                              showName: false,
                            ),
                            'time': FieldValue.serverTimestamp(),
                          };
                          await MessagesRecord.createDoc(widget.chat!.reference)
                              .set(messagesCreateData1);
                        } else {
                          final messagesCreateData2 = {
                            ...createMessagesRecordData(
                              text: _model.textController.text,
                              user:
                                  valueOrDefault(currentUserDocument?.name, ''),
                              showName: false,
                              showTime: true,
                            ),
                            'time': FieldValue.serverTimestamp(),
                          };
                          await MessagesRecord.createDoc(widget.chat!.reference)
                              .set(messagesCreateData2);
                        }
                      } else {
                        if (dateTimeFormat(
                              'M/d H:mm',
                              widget.chat!.lastmessagetime,
                              locale: FFLocalizations.of(context).languageCode,
                            ) ==
                            dateTimeFormat(
                              'M/d H:mm',
                              getCurrentTimestamp,
                              locale: FFLocalizations.of(context).languageCode,
                            )) {
                          final messagesCreateData3 = {
                            ...createMessagesRecordData(
                              text: _model.textController.text,
                              user:
                                  valueOrDefault(currentUserDocument?.name, ''),
                              showName: true,
                              showTime: false,
                            ),
                            'time': FieldValue.serverTimestamp(),
                          };
                          await MessagesRecord.createDoc(widget.chat!.reference)
                              .set(messagesCreateData3);
                        } else {
                          final messagesCreateData4 = {
                            ...createMessagesRecordData(
                              text: _model.textController.text,
                              user:
                                  valueOrDefault(currentUserDocument?.name, ''),
                              showName: true,
                              showTime: true,
                            ),
                            'time': FieldValue.serverTimestamp(),
                          };
                          await MessagesRecord.createDoc(widget.chat!.reference)
                              .set(messagesCreateData4);
                        }
                      }

                      final chatsUpdateData = {
                        ...createChatsRecordData(
                          lastmessage: _model.textController.text,
                          lastmessageuser:
                              valueOrDefault(currentUserDocument?.name, ''),
                        ),
                        'lastmessagetime': FieldValue.serverTimestamp(),
                      };
                      await widget.chat!.reference.update(chatsUpdateData);
                      setState(() {
                        _model.textController?.clear();
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 15.0,
            borderWidth: 1.0,
            buttonSize: 65.0,
            fillColor: FlutterFlowTheme.of(context).primary,
            icon: FaIcon(
              FontAwesomeIcons.phone,
              color: FlutterFlowTheme.of(context).primaryBtnText,
              size: 35.0,
            ),
            onPressed: () {
              print('IconButton pressed ...');
            },
          ),
        ],
      ),
    );
  }
}
