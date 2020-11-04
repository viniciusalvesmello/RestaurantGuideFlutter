import 'package:flutter/material.dart';

ImageLoadingBuilder imageLoading() {
  return (BuildContext context, Widget child, ImageChunkEvent loadingProgress) {
    return (loadingProgress == null)
        ? child
        : Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes
                  : null,
            ),
          );
  };
}

ImageErrorWidgetBuilder imageError() {
  return (BuildContext context, Object exception, StackTrace stackTrace) {
    return Image.asset('assets/images/no_image.png');
  };
}
