///////////////////////////////////////////////////////////////////////
/// Copyright (c) 1988-2021 $organization$
///
/// This software is provided by the author and contributors ``as is'' 
/// and any express or implied warranties, including, but not limited to, 
/// the implied warranties of merchantability and fitness for a particular 
/// purpose are disclaimed. In no event shall the author or contributors 
/// be liable for any direct, indirect, incidental, special, exemplary, 
/// or consequential damages (including, but not limited to, procurement 
/// of substitute goods or services; loss of use, data, or profits; or 
/// business interruption) however caused and on any theory of liability, 
/// whether in contract, strict liability, or tort (including negligence 
/// or otherwise) arising in any way out of the use of this software, 
/// even if advised of the possibility of such damage.
///
///   File: main_opt.hpp
///
/// Author: $author$
///   Date: 12/24/2021
///////////////////////////////////////////////////////////////////////
#ifndef XOS_APP_CONSOLE_ARGO_MAIN_OPT_HPP
#define XOS_APP_CONSOLE_ARGO_MAIN_OPT_HPP

#include "xos/app/console/version/main.hpp"
#include "xos/lib/argo/version.hpp"

#define XOS_APP_CONSOLE_ARGO_MAIN_JSON_URL_OPT "json-url"
#define XOS_APP_CONSOLE_ARGO_MAIN_JSON_URL_OPTARG_REQUIRED MAIN_OPT_ARGUMENT_OPTIONAL
#define XOS_APP_CONSOLE_ARGO_MAIN_JSON_URL_OPTARG_RESULT 0
#define XOS_APP_CONSOLE_ARGO_MAIN_JSON_URL_OPTARG "[url]"
#define XOS_APP_CONSOLE_ARGO_MAIN_JSON_URL_OPTUSE "Json url"
#define XOS_APP_CONSOLE_ARGO_MAIN_JSON_URL_OPTVAL_S "r::"
#define XOS_APP_CONSOLE_ARGO_MAIN_JSON_URL_OPTVAL_C 'r'
#define XOS_APP_CONSOLE_ARGO_MAIN_JSON_URL_OPTION \
   {XOS_APP_CONSOLE_ARGO_MAIN_JSON_URL_OPT, \
    XOS_APP_CONSOLE_ARGO_MAIN_JSON_URL_OPTARG_REQUIRED, \
    XOS_APP_CONSOLE_ARGO_MAIN_JSON_URL_OPTARG_RESULT, \
    XOS_APP_CONSOLE_ARGO_MAIN_JSON_URL_OPTVAL_C}, \

#define XOS_APP_CONSOLE_ARGO_MAIN_JSON_FILE_OPT "json-file"
#define XOS_APP_CONSOLE_ARGO_MAIN_JSON_FILE_OPTARG_REQUIRED MAIN_OPT_ARGUMENT_OPTIONAL
#define XOS_APP_CONSOLE_ARGO_MAIN_JSON_FILE_OPTARG_RESULT 0
#define XOS_APP_CONSOLE_ARGO_MAIN_JSON_FILE_OPTARG "[filename]"
#define XOS_APP_CONSOLE_ARGO_MAIN_JSON_FILE_OPTUSE "Json file"
#define XOS_APP_CONSOLE_ARGO_MAIN_JSON_FILE_OPTVAL_S "f::"
#define XOS_APP_CONSOLE_ARGO_MAIN_JSON_FILE_OPTVAL_C 'f'
#define XOS_APP_CONSOLE_ARGO_MAIN_JSON_FILE_OPTION \
   {XOS_APP_CONSOLE_ARGO_MAIN_JSON_FILE_OPT, \
    XOS_APP_CONSOLE_ARGO_MAIN_JSON_FILE_OPTARG_REQUIRED, \
    XOS_APP_CONSOLE_ARGO_MAIN_JSON_FILE_OPTARG_RESULT, \
    XOS_APP_CONSOLE_ARGO_MAIN_JSON_FILE_OPTVAL_C}, \

#define XOS_APP_CONSOLE_ARGO_MAIN_JSON_LITERAL_OPT "json-literal"
#define XOS_APP_CONSOLE_ARGO_MAIN_JSON_LITERAL_OPTARG_REQUIRED MAIN_OPT_ARGUMENT_OPTIONAL
#define XOS_APP_CONSOLE_ARGO_MAIN_JSON_LITERAL_OPTARG_RESULT 0
#define XOS_APP_CONSOLE_ARGO_MAIN_JSON_LITERAL_OPTARG "[string]"
#define XOS_APP_CONSOLE_ARGO_MAIN_JSON_LITERAL_OPTUSE "Json literal"
#define XOS_APP_CONSOLE_ARGO_MAIN_JSON_LITERAL_OPTVAL_S "i::"
#define XOS_APP_CONSOLE_ARGO_MAIN_JSON_LITERAL_OPTVAL_C 'i'
#define XOS_APP_CONSOLE_ARGO_MAIN_JSON_LITERAL_OPTION \
   {XOS_APP_CONSOLE_ARGO_MAIN_JSON_LITERAL_OPT, \
    XOS_APP_CONSOLE_ARGO_MAIN_JSON_LITERAL_OPTARG_REQUIRED, \
    XOS_APP_CONSOLE_ARGO_MAIN_JSON_LITERAL_OPTARG_RESULT, \
    XOS_APP_CONSOLE_ARGO_MAIN_JSON_LITERAL_OPTVAL_C}, \

#define XOS_APP_CONSOLE_ARGO_MAIN_OPTIONS_CHARS_EXTEND \
   XOS_APP_CONSOLE_ARGO_MAIN_JSON_URL_OPTVAL_S \
   XOS_APP_CONSOLE_ARGO_MAIN_JSON_FILE_OPTVAL_S \
   XOS_APP_CONSOLE_ARGO_MAIN_JSON_LITERAL_OPTVAL_S \

#define XOS_APP_CONSOLE_ARGO_MAIN_OPTIONS_OPTIONS_EXTEND \
   XOS_APP_CONSOLE_ARGO_MAIN_JSON_URL_OPTION \
   XOS_APP_CONSOLE_ARGO_MAIN_JSON_FILE_OPTION \
   XOS_APP_CONSOLE_ARGO_MAIN_JSON_LITERAL_OPTION \

#define XOS_APP_CONSOLE_ARGO_MAIN_OPTIONS_CHARS \
   XOS_APP_CONSOLE_ARGO_MAIN_OPTIONS_CHARS_EXTEND \
   XOS_APP_CONSOLE_VERSION_MAIN_OPTIONS_CHARS

#define XOS_APP_CONSOLE_ARGO_MAIN_OPTIONS_OPTIONS \
   XOS_APP_CONSOLE_ARGO_MAIN_OPTIONS_OPTIONS_EXTEND \
   XOS_APP_CONSOLE_VERSION_MAIN_OPTIONS_OPTIONS

#define XOS_APP_CONSOLE_ARGO_MAIN_ARGS "[{ url | filename | literal }]"
#define XOS_APP_CONSOLE_ARGO_MAIN_ARGV "{ url | filename | literal } Json input",

namespace xos {
namespace app {
namespace console {
namespace argo {

/// class main_optt
template 
<class TExtends = xos::app::console::version::maint<xos::lib::argo::version>, 
 class TImplements = typename TExtends::implements>

class exported main_optt: virtual public TImplements, public TExtends {
public:
    typedef TImplements implements;
    typedef TExtends extends;
    typedef main_optt derives;

    typedef typename extends::char_t char_t;
    typedef typename extends::end_char_t end_char_t;
    enum { end_char = extends::end_char };
    typedef typename extends::string_t string_t;
    typedef typename extends::reader_t reader_t;
    typedef typename extends::writer_t writer_t;
    typedef typename extends::file_t file_t;

    /// constructor / destructor
    main_optt(): run_(0) {
    }
    virtual ~main_optt() {
    }
private:
    main_optt(const main_optt& copy) {
        throw exception(exception_unexpected);
    }

protected:
    typedef typename extends::in_reader_t in_reader_t;
    typedef typename extends::out_writer_t out_writer_t;
    typedef typename extends::err_writer_t err_writer_t;

    /// ...run
    int (derives::*run_)(int argc, char_t** argv, char_t** env);
    virtual int run(int argc, char_t** argv, char_t** env) {
        int err = 0;
        if ((run_)) {
            err = (this->*run_)(argc, argv, env);
        } else {
            err = extends::run(argc, argv, env);
        }
        return err;
    }

    /// ...option...
    virtual int on_json_url_option
    (int optval, const char_t* optarg, const char_t* optname,
     int optind, int argc, char_t**argv, char_t**env) {
        int err = 0;
        if ((optarg) && (optarg[0])) {
        } else {
        }
        return err;
    }
    virtual const char_t* json_url_option_usage(const char_t*& optarg, const struct option* longopt) {
        const char_t* chars = XOS_APP_CONSOLE_ARGO_MAIN_JSON_URL_OPTUSE;
        optarg = XOS_APP_CONSOLE_ARGO_MAIN_JSON_URL_OPTARG;
        return chars;
    }
    virtual int on_json_file_option
    (int optval, const char_t* optarg, const char_t* optname,
     int optind, int argc, char_t**argv, char_t**env) {
        int err = 0;
        if ((optarg) && (optarg[0])) {
        } else {
        }
        return err;
    }
    virtual const char_t* json_file_option_usage(const char_t*& optarg, const struct option* longopt) {
        const char_t* chars = XOS_APP_CONSOLE_ARGO_MAIN_JSON_FILE_OPTUSE;
        optarg = XOS_APP_CONSOLE_ARGO_MAIN_JSON_FILE_OPTARG;
        return chars;
    }
    virtual int on_json_literal_option
    (int optval, const char_t* optarg, const char_t* optname,
     int optind, int argc, char_t**argv, char_t**env) {
        int err = 0;
        if ((optarg) && (optarg[0])) {
        } else {
        }
        return err;
    }
    virtual const char_t* json_literal_option_usage(const char_t*& optarg, const struct option* longopt) {
        const char_t* chars = XOS_APP_CONSOLE_ARGO_MAIN_JSON_LITERAL_OPTUSE;
        optarg = XOS_APP_CONSOLE_ARGO_MAIN_JSON_LITERAL_OPTARG;
        return chars;
    }
    virtual int on_option
    (int optval, const char_t* optarg, const char_t* optname,
     int optind, int argc, char_t**argv, char_t**env) {
        int err = 0;
        switch(optval) {
        case XOS_APP_CONSOLE_ARGO_MAIN_JSON_URL_OPTVAL_C:
            err = this->on_json_url_option(optval, optarg, optname, optind, argc, argv, env);
            break;
        case XOS_APP_CONSOLE_ARGO_MAIN_JSON_FILE_OPTVAL_C:
            err = this->on_json_file_option(optval, optarg, optname, optind, argc, argv, env);
            break;
        case XOS_APP_CONSOLE_ARGO_MAIN_JSON_LITERAL_OPTVAL_C:
            err = this->on_json_literal_option(optval, optarg, optname, optind, argc, argv, env);
            break;
        default:
            err = extends::on_option(optval, optarg, optname, optind, argc, argv, env);
        }
        return err;
    }
    virtual const char_t* option_usage(const char_t*& optarg, const struct option* longopt) {
        const char_t* chars = "";
        switch(longopt->val) {
        case XOS_APP_CONSOLE_ARGO_MAIN_JSON_URL_OPTVAL_C:
            chars = json_url_option_usage(optarg, longopt);
            break;
        case XOS_APP_CONSOLE_ARGO_MAIN_JSON_FILE_OPTVAL_C:
            chars = json_file_option_usage(optarg, longopt);
            break;
        case XOS_APP_CONSOLE_ARGO_MAIN_JSON_LITERAL_OPTVAL_C:
            chars = json_literal_option_usage(optarg, longopt);
            break;
        default:
            chars = extends::option_usage(optarg, longopt);
            break;
        }
        return chars;
    }
    virtual const char_t* options(const struct option*& longopts) {
        static const char_t* chars = XOS_APP_CONSOLE_ARGO_MAIN_OPTIONS_CHARS;
        static struct option optstruct[]= {
            XOS_APP_CONSOLE_ARGO_MAIN_OPTIONS_OPTIONS
            {0, 0, 0, 0}};
        longopts = optstruct;
        return chars;
    }

    /// ...argument...
    virtual const char_t* arguments(const char_t**& argv) {
        static const char_t* _args = XOS_APP_CONSOLE_ARGO_MAIN_ARGS;
        static const char_t* _argv[] = {
            XOS_APP_CONSOLE_ARGO_MAIN_ARGV
            0};
        argv = _argv;
        return _args;
    }

protected:
}; /// class main_optt
typedef main_optt<> main_opt;

} /// namespace argo
} /// namespace console
} /// namespace app
} /// namespace xos

#endif /// ndef XOS_APP_CONSOLE_ARGO_MAIN_OPT_HPP
