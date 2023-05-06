import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
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
    context.watch<FFAppState>();

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
          Align(
            alignment: AlignmentDirectional(0.0, -1.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 7.0, 0.0, 0.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.98,
                height: 60.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4.0,
                      color: Color(0x33000000),
                      offset: Offset(0.0, 2.0),
                    )
                  ],
                  borderRadius: BorderRadius.circular(30.0),
                  border: Border.all(
                    color: Color(0xFFDBE2E7),
                    width: 2.0,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                        child: TextFormField(
                          controller: _model.textController,
                          onFieldSubmitted: (_) async {
                            setState(() {
                              _model.textController?.clear();
                            });
                            if (widget.chat!.lastmessageuser ==
                                valueOrDefault(currentUserDocument?.name, '')) {
                              if (dateTimeFormat(
                                    'M/d H:mm',
                                    widget.chat!.lastmessagetime,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  ) ==
                                  dateTimeFormat(
                                    'M/d H:mm',
                                    getCurrentTimestamp,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  )) {
                                final messagesCreateData1 = {
                                  ...createMessagesRecordData(
                                    text: _model.textController.text,
                                    user: valueOrDefault(
                                        currentUserDocument?.name, ''),
                                    showTime: false,
                                    showName: false,
                                    isAnswer: false,
                                  ),
                                  'time': FieldValue.serverTimestamp(),
                                };
                                await MessagesRecord.createDoc(
                                        widget.chat!.reference)
                                    .set(messagesCreateData1);
                              } else {
                                final messagesCreateData2 = {
                                  ...createMessagesRecordData(
                                    text: _model.textController.text,
                                    user: valueOrDefault(
                                        currentUserDocument?.name, ''),
                                    showName: false,
                                    showTime: true,
                                    isAnswer: false,
                                  ),
                                  'time': FieldValue.serverTimestamp(),
                                };
                                await MessagesRecord.createDoc(
                                        widget.chat!.reference)
                                    .set(messagesCreateData2);
                              }
                            } else {
                              if (dateTimeFormat(
                                    'M/d H:mm',
                                    widget.chat!.lastmessagetime,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  ) ==
                                  dateTimeFormat(
                                    'M/d H:mm',
                                    getCurrentTimestamp,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  )) {
                                final messagesCreateData3 = {
                                  ...createMessagesRecordData(
                                    text: _model.textController.text,
                                    user: valueOrDefault(
                                        currentUserDocument?.name, ''),
                                    showName: true,
                                    showTime: false,
                                  ),
                                  'time': FieldValue.serverTimestamp(),
                                };
                                await MessagesRecord.createDoc(
                                        widget.chat!.reference)
                                    .set(messagesCreateData3);
                              } else {
                                final messagesCreateData4 = {
                                  ...createMessagesRecordData(
                                    text: _model.textController.text,
                                    user: valueOrDefault(
                                        currentUserDocument?.name, ''),
                                    showName: true,
                                    showTime: true,
                                  ),
                                  'time': FieldValue.serverTimestamp(),
                                };
                                await MessagesRecord.createDoc(
                                        widget.chat!.reference)
                                    .set(messagesCreateData4);
                              }
                            }
                          },
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
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Inter',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                              ),
                          validator: _model.textControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ),
                    if (_model.showAuxilliaries ?? true)
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30.0,
                        borderWidth: 1.0,
                        buttonSize: 56.0,
                        icon: FaIcon(
                          FontAwesomeIcons.image,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 30.0,
                        ),
                        onPressed: () async {
                          final selectedMedia =
                              await selectMediaWithSourceBottomSheet(
                            context: context,
                            allowPhoto: true,
                            pickerFontFamily: 'Inter',
                          );
                          if (selectedMedia != null &&
                              selectedMedia.every((m) =>
                                  validateFileFormat(m.storagePath, context))) {
                            setState(() => _model.isDataUploading1 = true);
                            var selectedUploadedFiles = <FFUploadedFile>[];
                            var downloadUrls = <String>[];
                            try {
                              selectedUploadedFiles = selectedMedia
                                  .map((m) => FFUploadedFile(
                                        name: m.storagePath.split('/').last,
                                        bytes: m.bytes,
                                        height: m.dimensions?.height,
                                        width: m.dimensions?.width,
                                        blurHash: m.blurHash,
                                      ))
                                  .toList();

                              downloadUrls = (await Future.wait(
                                selectedMedia.map(
                                  (m) async =>
                                      await uploadData(m.storagePath, m.bytes),
                                ),
                              ))
                                  .where((u) => u != null)
                                  .map((u) => u!)
                                  .toList();
                            } finally {
                              _model.isDataUploading1 = false;
                            }
                            if (selectedUploadedFiles.length ==
                                    selectedMedia.length &&
                                downloadUrls.length == selectedMedia.length) {
                              setState(() {
                                _model.uploadedLocalFile1 =
                                    selectedUploadedFiles.first;
                                _model.uploadedFileUrl1 = downloadUrls.first;
                              });
                            } else {
                              setState(() {});
                              return;
                            }
                          }

                          final messagesCreateData = createMessagesRecordData(
                            time: getCurrentTimestamp,
                            user: valueOrDefault(currentUserDocument?.name, ''),
                            imgPath: _model.uploadedFileUrl1,
                          );
                          await MessagesRecord.createDoc(widget.chat!.reference)
                              .set(messagesCreateData);

                          final chatsUpdateData = createChatsRecordData(
                            lastmessage: 'Sent an image',
                            lastmessagetime: getCurrentTimestamp,
                            lastmessageuser:
                                valueOrDefault(currentUserDocument?.name, ''),
                          );
                          await widget.chat!.reference.update(chatsUpdateData);
                        },
                      ),
                    if (_model.showAuxilliaries ?? true)
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30.0,
                        borderWidth: 1.0,
                        buttonSize: 56.0,
                        icon: FaIcon(
                          FontAwesomeIcons.video,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 30.0,
                        ),
                        onPressed: () async {
                          final selectedMedia =
                              await selectMediaWithSourceBottomSheet(
                            context: context,
                            allowPhoto: false,
                            allowVideo: true,
                            pickerFontFamily: 'Inter',
                          );
                          if (selectedMedia != null &&
                              selectedMedia.every((m) =>
                                  validateFileFormat(m.storagePath, context))) {
                            setState(() => _model.isDataUploading2 = true);
                            var selectedUploadedFiles = <FFUploadedFile>[];
                            var downloadUrls = <String>[];
                            try {
                              selectedUploadedFiles = selectedMedia
                                  .map((m) => FFUploadedFile(
                                        name: m.storagePath.split('/').last,
                                        bytes: m.bytes,
                                        height: m.dimensions?.height,
                                        width: m.dimensions?.width,
                                        blurHash: m.blurHash,
                                      ))
                                  .toList();

                              downloadUrls = (await Future.wait(
                                selectedMedia.map(
                                  (m) async =>
                                      await uploadData(m.storagePath, m.bytes),
                                ),
                              ))
                                  .where((u) => u != null)
                                  .map((u) => u!)
                                  .toList();
                            } finally {
                              _model.isDataUploading2 = false;
                            }
                            if (selectedUploadedFiles.length ==
                                    selectedMedia.length &&
                                downloadUrls.length == selectedMedia.length) {
                              setState(() {
                                _model.uploadedLocalFile2 =
                                    selectedUploadedFiles.first;
                                _model.uploadedFileUrl2 = downloadUrls.first;
                              });
                            } else {
                              setState(() {});
                              return;
                            }
                          }

                          final messagesCreateData = createMessagesRecordData(
                            time: getCurrentTimestamp,
                            user: valueOrDefault(currentUserDocument?.name, ''),
                            videoPath: _model.uploadedFileUrl2,
                          );
                          await MessagesRecord.createDoc(widget.chat!.reference)
                              .set(messagesCreateData);

                          final chatsUpdateData = createChatsRecordData(
                            lastmessage: 'Sent a video',
                            lastmessagetime: getCurrentTimestamp,
                            lastmessageuser:
                                valueOrDefault(currentUserDocument?.name, ''),
                          );
                          await widget.chat!.reference.update(chatsUpdateData);
                        },
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
