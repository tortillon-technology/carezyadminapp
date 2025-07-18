import 'dart:io';
import 'package:carezyadminapp/utils/helpers/auto_dispose_view_model.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../../services/get_it.dart';
import '../repo/customer_repo.dart';

class PdfUploadViewModel extends AutoDisposeViewModel with Helper {
  final repo = getIt.get<CustomerRepo>();

  final TextEditingController nameController = TextEditingController();

  File? selectedFile;
  String? fileName;
  String? customerId;
  String? errorMessage;
  bool uploading = false;
  bool enableButton = false;

  Future<void> pickPDF() async {
    checkButtonEnable("");
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null && result.files.single.path != null) {
      selectedFile = File(result.files.single.path!);
      fileName = result.files.single.name;
      checkButtonEnable("");
      notifyListeners();
    }
  }

  checkButtonEnable(String name) {
    enableButton = nameController.text.isNotEmpty && selectedFile != null;
    notifyListeners();
  }

  Future<bool?> uploadReport() async {
    final formData = FormData.fromMap({
      'customer_id': customerId,
      'report_name': nameController.text,
      'health_report':
          await MultipartFile.fromFile(selectedFile!.path, filename: fileName),
    });
    updateLoader(true);
    return await repo.uploadPdf(formData: formData).fold(
      (left) {
        errorMessage = left.message;
        updateLoader(false);
        return false;
      },
      (right) {
        updateLoader(false);
        final status = right['status'] ?? false;
        return status;
      },
    ).catchError((e) {
      errorMessage = e.toString();
      updateLoader(false);
      return false;
    });
  }

  void disposeController() {
    nameController.dispose();
    super.dispose();
  }

  @override
  updateLoader(bool value) {
    isLoading = value;
    notifyListeners();
  }
}

mixin Helper {
  bool isLoading = false;

  updateLoader(bool value);
}
