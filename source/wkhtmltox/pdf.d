module wkhtmltox.pdf;

import core.stdc.string;

import std.string;

import wkhtmltox.dll;


void init(bool graphics = false) {
	wkhtmltox.dll.init();

	wkhtmltox.dll.wkhtmltopdf_init(graphics ? 1 : 0);
}


const(char)[] ver() {
	return fromStringz(wkhtmltopdf_version());
}


const(char)* verz() {
	return wkhtmltopdf_version();
}


static struct Converter {
	@disable this(this);

	private this(wkhtmltopdf_converter* cvt) {
		cvt_ = cvt;
	}

	~this() {
		if (cvt_) {
			wkhtmltopdf_destroy_converter(cvt_);
			cvt_ = null;
		}
	}

	void add(string source, string[string] settings = null) {
		auto os = wkhtmltopdf_create_object_settings();
		wkhtmltopdf_set_object_setting(os, "page\0".ptr, source.toStringz);

		foreach (k, v; settings)
			wkhtmltopdf_set_object_setting(os, k.toStringz, v.toStringz);

		wkhtmltopdf_add_object(cvt_, os, null);
	}

	void convert() {
		wkhtmltopdf_convert(cvt_);
	}

	const(ubyte)[] data() {
		const(ubyte)* data;
		auto len = wkhtmltopdf_get_output(cvt_, &data);

		return data[0..len];
	}

private:
	wkhtmltopdf_converter* cvt_ = null;
}


auto createConverter(string[string] settings = null) {
	auto gs = wkhtmltopdf_create_global_settings();

	foreach (k, v; settings)
		wkhtmltopdf_set_global_setting(gs, k.toStringz, v.toStringz);

	auto cvt = wkhtmltopdf_create_converter(gs);

	return Converter(cvt);
}


shared static ~this() {
	if (wkhtmltox.dll.loaded())
		wkhtmltopdf_deinit();
}
