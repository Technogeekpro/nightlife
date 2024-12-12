import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:night_life/presentation/providers/organiser_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:night_life/styles/colors.dart';

class Step3MediaUpload extends ConsumerWidget {
  const Step3MediaUpload({super.key});

  Future<void> _pickImage(BuildContext context, WidgetRef ref, bool isBanner) async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      if (isBanner) {
        ref.read(organiserProvider.notifier).setBannerImage(pickedImage);
      } else {
        ref.read(organiserProvider.notifier).setImages([pickedImage]);
      }
    }
  }

  Future<void> _pickVideo(BuildContext context, WidgetRef ref) async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedVideo = await picker.pickVideo(source: ImageSource.gallery);
    if (pickedVideo != null) {
      ref.read(organiserProvider.notifier).setTeaserVideo(pickedVideo);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final organiserState = ref.watch(organiserProvider);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Step 3: Media Upload',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),
          ),
          const SizedBox(height: 16),
          _buildUploadContainer(
            context,
            ref,
            isBanner: true,
            image: organiserState.bannerImage,
            hintText: 'Upload Event Banner',
          ),
          const SizedBox(height: 16),
          _buildUploadContainer(
            context,
            ref,
            isBanner: false,
            image: organiserState.images?.isNotEmpty == true ? organiserState.images!.first : null,
            hintText: 'Upload Gallery Images',
          ),
          const SizedBox(height: 16),
          _buildUploadContainer(
            context,
            ref,
            isBanner: false,
            image: organiserState.teaserVideo,
            hintText: 'Upload Teaser Video',
            isVideo: true,
          ),
        ],
      ),
    );
  }

  Widget _buildUploadContainer(
    BuildContext context,
    WidgetRef ref, {
    required bool isBanner,
    XFile? image,
    required String hintText,
    bool isVideo = false,
  }) {
    return GestureDetector(
      onTap: () => isVideo ? _pickVideo(context, ref) : _pickImage(context, ref, isBanner),
      child: Container(
        height: MediaQuery.of(context).size.width /2.3,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.primary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          image: image != null
              ? DecorationImage(
                  image: FileImage(File(image.path)),
                  fit: BoxFit.cover,
                )
              : null,
        ),
        child: image == null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.upload, size: 30, color: Colors.white),
                  const SizedBox(height: 8),
                  Text(
                    hintText,
                    style: const TextStyle(color: AppColors.secondary),
                  ),
                ],
              )
            : Stack(
                children: [
                  Positioned(
                    top: 8,
                    right: 8,
                    child: GestureDetector(
                      onTap: () => isVideo ? _pickVideo(context, ref) : _pickImage(context, ref, isBanner),
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Colors.black54,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.edit, color: Colors.white, size: 20),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}