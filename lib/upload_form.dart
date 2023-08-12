import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:upload_form/bloc/upload_bloc.dart';
import 'package:upload_form/bloc/upload_event.dart';
import 'package:upload_form/constants.dart';
import 'package:upload_form/services/upload.service.dart';
import 'package:upload_form/styles.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  final HtmlEditorController _htmlEditorController = HtmlEditorController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Content")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kPadding / 2),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: kPadding,
            ),
            const Text(
              "Description",
              style: titleStyle,
            ),
            const SizedBox(
              height: kPadding,
            ),
            HtmlEditor(
              controller: _htmlEditorController,
              callbacks: Callbacks(onInit: () {
                _htmlEditorController.setFullScreen();
              }),
              htmlEditorOptions: const HtmlEditorOptions(
                  spellCheck: true, autoAdjustHeight: true),
              htmlToolbarOptions: const HtmlToolbarOptions(
                  toolbarType: ToolbarType.nativeGrid,
                  defaultToolbarButtons: [
                    FontButtons(),
                    ListButtons(listStyles: false),
                    StyleButtons(),
                    FontSettingButtons(),
                  ]),
            ),
            const SizedBox(
              height: kPadding,
            ),
            RichText(
                text: const TextSpan(
                    text: "Content Upload",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                    children: [
                  TextSpan(text: " *", style: TextStyle(color: Colors.red))
                ])),
            const SizedBox(
              height: kPadding,
            ),
            DottedBorder(
              child: InkWell(
                onTap: () {
                  uploadFiles(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          height: kPadding,
                        ),
                        BlocBuilder<ContentFileBloc, String>(
                          builder: (context, state) {
                            if (state != "") {
                              return const Icon(
                                Icons.file_copy,
                                size: 28,
                                color: Colors.green,
                              );
                            } else {
                              return const Icon(
                                Icons.picture_as_pdf_outlined,
                                size: 28,
                              );
                            }
                          },
                        ),
                        const SizedBox(
                          height: kPadding / 2,
                        ),
                        BlocBuilder<ContentFileBloc, String>(
                          builder: (context, state) {
                            if (state != "") {
                              return Text(state);
                            } else {
                              return const Text(
                                "Drop your Document here, or click to browse",
                                style: TextStyle(color: Colors.blue),
                              );
                            }
                          },
                        ),
                        const SizedBox(
                          height: kPadding,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: kPadding,
            ),
            Row(
              children: [
                const Text(
                  "Allow user to download content",
                  style: titleStyle,
                ),
                const Spacer(),
                BlocBuilder<ContentSwitchBloc, bool>(
                  builder: (context, state) {
                    return Switch(
                        value: state,
                        onChanged: (value) {
                          BlocProvider.of<ContentSwitchBloc>(context)
                              .add(UploadAllowDownloadEvent(state));
                        });
                  },
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
