# wkhtmltox
Thin wrapper around wkhtmltopdf and wkhtmltoimage for the D language

## Notes
-Currently only works on Posix systems

-Requires `libwkhtmltox.so` to be reachable by the system loader

-Supported settings and their meaning available at http://wkhtmltopdf.org/libwkhtmltox/pagesettings.html



## HTML -> PDF example
```D
static import pdf = wkhtmltox.pdf;

void main() {
  pdf.init();
  
	auto cvt = pdf.createConverter([ "out": "google.pdf" ]);
	cvt.add("https://www.google.com");
	cvt.convert();
}
```



## HTML -> Image example
```D
static import img = wkhtmltox.image;

void main() {
  img.init();
  
	auto cvt = img.createConverter("https://www.google.com", [ "out": "google.png" ]);
	cvt.convert();
}
```

