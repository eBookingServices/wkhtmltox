module wkhtmltox.dll;

import core.stdc.stdlib;
import core.sys.posix.dlfcn;

import std.string;


extern(C) @nogc nothrow {
	struct wkhtmltopdf_global_settings {};
	struct wkhtmltopdf_object_settings {};
	struct wkhtmltopdf_converter {};

	alias wkhtmltopdf_str_callback = void function(wkhtmltopdf_converter*, const(char)*);
	alias wkhtmltopdf_int_callback = void function(wkhtmltopdf_converter*, const int);
	alias wkhtmltopdf_void_callback = void function(wkhtmltopdf_converter*);

	alias F_wkhtmltopdf_init = int function(int);
	alias F_wkhtmltopdf_deinit = int function();
	alias F_wkhtmltopdf_extended_qt = int function();
	alias F_wkhtmltopdf_version = const(char)* function();

	alias F_wkhtmltopdf_create_global_settings = wkhtmltopdf_global_settings* function();
	alias F_wkhtmltopdf_destroy_global_settings = void function(wkhtmltopdf_global_settings*);

	alias F_wkhtmltopdf_create_object_settings = wkhtmltopdf_object_settings* function();
	alias F_wkhtmltopdf_destroy_object_settings = void function(wkhtmltopdf_object_settings*);

	alias F_wkhtmltopdf_set_global_setting = int function(wkhtmltopdf_global_settings*, const(char)*, const(char)*);
	alias F_wkhtmltopdf_get_global_setting = int function(wkhtmltopdf_global_settings*, const(char)*, char*, int);
	alias F_wkhtmltopdf_set_object_setting = int function(wkhtmltopdf_object_settings*, const(char)*, const(char)*);
	alias F_wkhtmltopdf_get_object_setting = int function(wkhtmltopdf_object_settings*, const(char)*, char*, int);

	alias F_wkhtmltopdf_create_converter = wkhtmltopdf_converter* function(wkhtmltopdf_global_settings*);
	alias F_wkhtmltopdf_destroy_converter = void function(wkhtmltopdf_converter*);

	alias F_wkhtmltopdf_set_warning_callback = void function(wkhtmltopdf_converter*, wkhtmltopdf_str_callback);
	alias F_wkhtmltopdf_set_error_callback = void function(wkhtmltopdf_converter*, wkhtmltopdf_str_callback);
	alias F_wkhtmltopdf_set_phase_changed_callback = void function(wkhtmltopdf_converter*, wkhtmltopdf_void_callback);
	alias F_wkhtmltopdf_set_progress_changed_callback = void function(wkhtmltopdf_converter*, wkhtmltopdf_int_callback);
	alias F_wkhtmltopdf_set_finished_callback = void function(wkhtmltopdf_converter*, wkhtmltopdf_int_callback);

	/* CAPI(void) wkhtmltopdf_begin_conversion(wkhtmltopdf_converter * converter); */
	/* CAPI(void) wkhtmltopdf_cancel(wkhtmltopdf_converter * converter); */
	alias F_wkhtmltopdf_convert = int function(wkhtmltopdf_converter*);
	alias F_wkhtmltopdf_add_object = void function(wkhtmltopdf_converter*, wkhtmltopdf_object_settings*, const(char)*);

	alias F_wkhtmltopdf_current_phase = int function(wkhtmltopdf_converter*);
	alias F_wkhtmltopdf_phase_count = int function(wkhtmltopdf_converter*);
	alias F_wkhtmltopdf_phase_description = const(char)* function(wkhtmltopdf_converter*, int);
	alias F_wkhtmltopdf_progress_string = const(char)* function(wkhtmltopdf_converter *);
	alias F_wkhtmltopdf_http_error_code = int function(wkhtmltopdf_converter*);

	alias F_wkhtmltopdf_get_output = long function(wkhtmltopdf_converter*, const(ubyte)**);

	struct wkhtmltoimage_global_settings {};
	struct wkhtmltoimage_object_settings {};
	struct wkhtmltoimage_converter {};

	alias wkhtmltoimage_str_callback = void function(wkhtmltoimage_converter*, const(char)*);
	alias wkhtmltoimage_int_callback = void function(wkhtmltoimage_converter*, const int);
	alias wkhtmltoimage_void_callback = void function(wkhtmltoimage_converter*);

	alias F_wkhtmltoimage_init = int function(int);
	alias F_wkhtmltoimage_deinit = int function();
	alias F_wkhtmltoimage_extended_qt = int function();
	alias F_wkhtmltoimage_version = const(char)* function();

	alias F_wkhtmltoimage_create_global_settings = wkhtmltoimage_global_settings* function();

	alias F_wkhtmltoimage_set_global_setting = int function(wkhtmltoimage_global_settings*, const(char)*, const(char)*);
	alias F_wkhtmltoimage_get_global_setting = int function(wkhtmltoimage_global_settings*, const(char)*, char*, int);

	alias F_wkhtmltoimage_create_converter = wkhtmltoimage_converter* function(wkhtmltoimage_global_settings*, const(char)*);
	alias F_wkhtmltoimage_destroy_converter = void function(wkhtmltoimage_converter*);

	alias F_wkhtmltoimage_set_warning_callback = void function(wkhtmltoimage_converter*, wkhtmltoimage_str_callback);
	alias F_wkhtmltoimage_set_error_callback = void function(wkhtmltoimage_converter*, wkhtmltoimage_str_callback);
	alias F_wkhtmltoimage_set_phase_changed_callback = void function(wkhtmltoimage_converter*, wkhtmltoimage_void_callback);
	alias F_wkhtmltoimage_set_progress_changed_callback = void function(wkhtmltoimage_converter*, wkhtmltoimage_int_callback);
	alias F_wkhtmltoimage_set_finished_callback = void function(wkhtmltoimage_converter*, wkhtmltoimage_int_callback);

	/* CAPI(void) wkhtmltoimage_begin_conversion(wkhtmltoimage_converter * converter); */
	/* CAPI(void) wkhtmltoimage_cancel(wkhtmltoimage_converter * converter); */
	alias F_wkhtmltoimage_convert = int function(wkhtmltoimage_converter*);

	alias F_wkhtmltoimage_current_phase = int function(wkhtmltoimage_converter*);
	alias F_wkhtmltoimage_phase_count = int function(wkhtmltoimage_converter*);
	alias F_wkhtmltoimage_phase_description = const(char)* function(wkhtmltoimage_converter*, int);
	alias F_wkhtmltoimage_progress_string = const(char)* function(wkhtmltoimage_converter *);
	alias F_wkhtmltoimage_http_error_code = int function(wkhtmltoimage_converter*);

	alias F_wkhtmltoimage_get_output = long function(wkhtmltoimage_converter*, const(ubyte)**);
}


__gshared static {
	F_wkhtmltopdf_init wkhtmltopdf_init;
	F_wkhtmltopdf_deinit wkhtmltopdf_deinit;
	F_wkhtmltopdf_version wkhtmltopdf_version;

	F_wkhtmltopdf_create_global_settings wkhtmltopdf_create_global_settings;
	F_wkhtmltopdf_destroy_global_settings wkhtmltopdf_destroy_global_settings;

	F_wkhtmltopdf_create_object_settings wkhtmltopdf_create_object_settings;
	F_wkhtmltopdf_destroy_object_settings wkhtmltopdf_destroy_object_settings;

	F_wkhtmltopdf_set_global_setting wkhtmltopdf_set_global_setting;
	F_wkhtmltopdf_get_global_setting wkhtmltopdf_get_global_setting;
	F_wkhtmltopdf_set_object_setting wkhtmltopdf_set_object_setting;
	F_wkhtmltopdf_get_object_setting wkhtmltopdf_get_object_setting;

	F_wkhtmltopdf_create_converter wkhtmltopdf_create_converter;
	F_wkhtmltopdf_destroy_converter wkhtmltopdf_destroy_converter;

	F_wkhtmltopdf_set_warning_callback wkhtmltopdf_set_warning_callback;
	F_wkhtmltopdf_set_error_callback wkhtmltopdf_set_error_callback;
	F_wkhtmltopdf_set_phase_changed_callback wkhtmltopdf_set_phase_changed_callback;
	F_wkhtmltopdf_set_progress_changed_callback wkhtmltopdf_set_progress_changed_callback;
	F_wkhtmltopdf_set_finished_callback wkhtmltopdf_set_finished_callback;

	F_wkhtmltopdf_current_phase wkhtmltopdf_current_phase;
	F_wkhtmltopdf_phase_count wkhtmltopdf_phase_count;
	F_wkhtmltopdf_phase_description wkhtmltopdf_phase_description;
	F_wkhtmltopdf_progress_string wkhtmltopdf_progress_string;
	F_wkhtmltopdf_http_error_code wkhtmltopdf_http_error_code;

	F_wkhtmltopdf_convert wkhtmltopdf_convert;
	F_wkhtmltopdf_add_object wkhtmltopdf_add_object;

	F_wkhtmltopdf_get_output wkhtmltopdf_get_output;


	F_wkhtmltoimage_init wkhtmltoimage_init;
	F_wkhtmltoimage_deinit wkhtmltoimage_deinit;
	F_wkhtmltoimage_version wkhtmltoimage_version;

	F_wkhtmltoimage_create_global_settings wkhtmltoimage_create_global_settings;

	F_wkhtmltoimage_set_global_setting wkhtmltoimage_set_global_setting;
	F_wkhtmltoimage_get_global_setting wkhtmltoimage_get_global_setting;

	F_wkhtmltoimage_create_converter wkhtmltoimage_create_converter;
	F_wkhtmltoimage_destroy_converter wkhtmltoimage_destroy_converter;

	F_wkhtmltoimage_set_warning_callback wkhtmltoimage_set_warning_callback;
	F_wkhtmltoimage_set_error_callback wkhtmltoimage_set_error_callback;
	F_wkhtmltoimage_set_phase_changed_callback wkhtmltoimage_set_phase_changed_callback;
	F_wkhtmltoimage_set_progress_changed_callback wkhtmltoimage_set_progress_changed_callback;
	F_wkhtmltoimage_set_finished_callback wkhtmltoimage_set_finished_callback;

	F_wkhtmltoimage_current_phase wkhtmltoimage_current_phase;
	F_wkhtmltoimage_phase_count wkhtmltoimage_phase_count;
	F_wkhtmltoimage_phase_description wkhtmltoimage_phase_description;
	F_wkhtmltoimage_progress_string wkhtmltoimage_progress_string;
	F_wkhtmltoimage_http_error_code wkhtmltoimage_http_error_code;

	F_wkhtmltoimage_convert wkhtmltoimage_convert;

	F_wkhtmltoimage_get_output wkhtmltoimage_get_output;


	void* dll_ = null;
}


template LoadSymbol(string symbol) {
	enum LoadSymbol = symbol ~ " = cast(typeof(" ~ symbol ~ "))dlsym(dll_, \"" ~ symbol ~ "\"); if (!" ~ symbol ~ ") throw new Exception(fromStringz(dlerror()).idup());";
}


void init() {
	if (dll_)
		return;

	dll_ = dlopen("libwkhtmltox.so", RTLD_LAZY);
	if (!dll_)
		throw new Exception(fromStringz(dlerror()).idup());

	mixin(LoadSymbol!"wkhtmltopdf_init");
	mixin(LoadSymbol!"wkhtmltopdf_deinit");
	mixin(LoadSymbol!"wkhtmltopdf_version");

	mixin(LoadSymbol!"wkhtmltopdf_create_global_settings");
	mixin(LoadSymbol!"wkhtmltopdf_destroy_global_settings");

	mixin(LoadSymbol!"wkhtmltopdf_create_object_settings");
	mixin(LoadSymbol!"wkhtmltopdf_destroy_object_settings");

	mixin(LoadSymbol!"wkhtmltopdf_set_global_setting");
	mixin(LoadSymbol!"wkhtmltopdf_get_global_setting");
	mixin(LoadSymbol!"wkhtmltopdf_set_object_setting");
	mixin(LoadSymbol!"wkhtmltopdf_get_object_setting");

	mixin(LoadSymbol!"wkhtmltopdf_create_converter");
	mixin(LoadSymbol!"wkhtmltopdf_destroy_converter");

	mixin(LoadSymbol!"wkhtmltopdf_set_warning_callback");
	mixin(LoadSymbol!"wkhtmltopdf_set_error_callback");
	mixin(LoadSymbol!"wkhtmltopdf_set_phase_changed_callback");
	mixin(LoadSymbol!"wkhtmltopdf_set_progress_changed_callback");
	mixin(LoadSymbol!"wkhtmltopdf_set_finished_callback");

	mixin(LoadSymbol!"wkhtmltopdf_convert");
	mixin(LoadSymbol!"wkhtmltopdf_add_object");

	mixin(LoadSymbol!"wkhtmltopdf_current_phase");
	mixin(LoadSymbol!"wkhtmltopdf_phase_count");
	mixin(LoadSymbol!"wkhtmltopdf_phase_description");
	mixin(LoadSymbol!"wkhtmltopdf_progress_string");
	mixin(LoadSymbol!"wkhtmltopdf_http_error_code");

	mixin(LoadSymbol!"wkhtmltopdf_get_output");


	mixin(LoadSymbol!"wkhtmltoimage_init");
	mixin(LoadSymbol!"wkhtmltoimage_deinit");
	mixin(LoadSymbol!"wkhtmltoimage_version");

	mixin(LoadSymbol!"wkhtmltoimage_create_global_settings");

	mixin(LoadSymbol!"wkhtmltoimage_set_global_setting");
	mixin(LoadSymbol!"wkhtmltoimage_get_global_setting");

	mixin(LoadSymbol!"wkhtmltoimage_create_converter");
	mixin(LoadSymbol!"wkhtmltoimage_destroy_converter");

	mixin(LoadSymbol!"wkhtmltoimage_set_warning_callback");
	mixin(LoadSymbol!"wkhtmltoimage_set_error_callback");
	mixin(LoadSymbol!"wkhtmltoimage_set_phase_changed_callback");
	mixin(LoadSymbol!"wkhtmltoimage_set_progress_changed_callback");
	mixin(LoadSymbol!"wkhtmltoimage_set_finished_callback");

	mixin(LoadSymbol!"wkhtmltoimage_convert");

	mixin(LoadSymbol!"wkhtmltoimage_current_phase");
	mixin(LoadSymbol!"wkhtmltoimage_phase_count");
	mixin(LoadSymbol!"wkhtmltoimage_phase_description");
	mixin(LoadSymbol!"wkhtmltoimage_progress_string");
	mixin(LoadSymbol!"wkhtmltoimage_http_error_code");

	mixin(LoadSymbol!"wkhtmltoimage_get_output");
}


bool loaded() {
	return dll_ != null;
}


shared static ~this() {
	if (dll_) {
		dlclose(dll_);
		dll_ = null;
	}
}
