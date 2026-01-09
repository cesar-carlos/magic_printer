class DocumentTypeDetector {
  static String? detectFromFileName(String fileName) {
    final extension = fileName.split('.').last.toLowerCase();
    
    switch (extension) {
      case 'pdf':
        return 'PDF';
      case 'doc':
      case 'docx':
        return 'Word';
      case 'xls':
      case 'xlsx':
        return 'Excel';
      case 'ppt':
      case 'pptx':
        return 'PowerPoint';
      case 'txt':
        return 'Text';
      case 'jpg':
      case 'jpeg':
      case 'png':
      case 'gif':
      case 'bmp':
        return 'Image';
      case 'html':
      case 'htm':
        return 'HTML';
      case 'rtf':
        return 'RTF';
      default:
        return null;
    }
  }

  static String? detectFromDatatype(String datatype) {
    switch (datatype.toUpperCase()) {
      case 'RAW':
        return 'RAW';
      case 'TEXT':
        return 'Text';
      case 'PCL':
        return 'PCL';
      case 'POSTSCRIPT':
      case 'PS':
        return 'PostScript';
      case 'EMF':
        return 'EMF';
      case 'XPS':
        return 'XPS';
      default:
        return datatype;
    }
  }

  static String detect(String? fileName, String? datatype) {
    if (fileName != null) {
      final fromFileName = detectFromFileName(fileName);
      if (fromFileName != null) {
        return fromFileName;
      }
    }

    if (datatype != null) {
      final fromDatatype = detectFromDatatype(datatype);
      if (fromDatatype != null) {
        return fromDatatype;
      }
    }

    return 'Unknown';
  }
}
