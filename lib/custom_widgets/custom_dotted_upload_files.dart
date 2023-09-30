import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:job_finder_app/utils/app_images.dart';
import '../../../utils/app_fonts.dart';

class CustomDottedUploadFiles extends StatelessWidget {
  const CustomDottedUploadFiles({
    super.key,
    this.onTap,
    this.removeFile,
    this.fileName,
    this.fileSize,
  });

  final Function()? onTap;
  final Function()? removeFile;
  final String? fileName;
  final String? fileSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        GestureDetector(
          onTap: onTap,
          child: DottedBorder(
            borderType: BorderType.RRect,
            radius: const Radius.circular(8),
            color: const Color(0xff3366FF),
            strokeWidth: 2,
            dashPattern: const [8, 4],
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xffECF2FF),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  fileName != null
                      ? Image.asset(AppImages.kPDF)
                      : CircleAvatar(
                          radius: 30,
                          backgroundColor: const Color(0xffD6E4FF),
                          child: Image.asset(AppImages.kDocument),
                        ),
                  const SizedBox(height: 10),
                  Text(
                    fileName ?? ' Upload your other file',
                    style: const TextStyle(
                      color: Color(0xff111827),
                      fontFamily: AppFonts.kLoginHeadlineFont,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    fileSize ?? 'Max. file size 10 MB',
                    style: const TextStyle(
                      color: Color(0xff6B7280),
                      fontFamily: AppFonts.kLoginSubHeadlineFont,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 25),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                        color: const Color(0xff3366FF),
                      ),
                      color: const Color(0xffD6E4FF),
                    ),
                    child: fileName != null
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.done),
                              SizedBox(width: 10),
                              Text('Uploaded'),
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ColorFiltered(
                                  colorFilter: const ColorFilter.mode(
                                    Color(0xff3366FF),
                                    BlendMode.modulate,
                                  ),
                                  child: Image.asset(AppImages.kExport)),
                              const SizedBox(width: 10),
                              const Text('Add file'),
                            ],
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
