module wkhtmltox.image;

import core.stdc.string;

import std.string;

import wkhtmltox.dll;


void init(bool graphics = false) {
	wkhtmltox.dll.init();

	wkhtmltox.dll.wkhtmltoimage_init(graphics ? 1 : 0);
}


const(char)[] ver() {
	return fromStringz(wkhtmltoimage_version());
}


const(char)* verz() {
	return wkhtmltoimage_version();
}


static struct Converter {
	@disable this(this);

	private this(wkhtmltoimage_converter* cvt) {
		cvt_ = cvt;
	}

	~this() {
		if (cvt_) {
			wkhtmltoimage_destroy_converter(cvt_);
			cvt_ = null;
		}
	}

	void convert() {
		wkhtmltoimage_convert(cvt_);
	}

	const(ubyte)[] data() {
		const(ubyte)* data;
		auto len = wkhtmltoimage_get_output(cvt_, &data);

		return data[0..len];
	}

private:
	wkhtmltoimage_converter* cvt_ = null;
}


auto createConverter(string source, string[string] settings = null) {
	auto gs = wkhtmltoimage_create_global_settings();
	wkhtmltoimage_set_global_setting(gs, "in\0".ptr, source.toStringz);
	wkhtmltoimage_set_global_setting(gs, "fmt\0".ptr, "png\0".ptr);

	foreach (k, v; settings)
		wkhtmltoimage_set_global_setting(gs, k.toStringz, v.toStringz);

	auto cvt = wkhtmltoimage_create_converter(gs, null);

	return Converter(cvt);
}


shared static ~this() {
	if (wkhtmltox.dll.loaded())
		wkhtmltoimage_deinit();
}
