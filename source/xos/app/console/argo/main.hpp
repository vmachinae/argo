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
///   File: main.hpp
///
/// Author: $author$
///   Date: 12/24/2021
///////////////////////////////////////////////////////////////////////
#ifndef XOS_APP_CONSOLE_ARGO_MAIN_HPP
#define XOS_APP_CONSOLE_ARGO_MAIN_HPP

#include "xos/app/console/argo/main_opt.hpp"
#include "xos/io/format/json/libjson/to_node.hpp"
#include "xos/io/crt/file/reader.hpp"

namespace xos {
namespace app {
namespace console {
namespace argo {

/// class maint
template 
<class TExtends = xos::app::console::argo::main_opt, 
 class TImplements = typename TExtends::implements>

class exported maint: virtual public TImplements, public TExtends {
public:
    typedef TImplements implements;
    typedef TExtends extends;
    typedef maint derives;

    typedef typename extends::char_t char_t;
    typedef typename extends::end_char_t end_char_t;
    enum { end_char = extends::end_char };
    typedef typename extends::string_t string_t;
    typedef typename extends::reader_t reader_t;
    typedef typename extends::writer_t writer_t;
    typedef typename extends::file_t file_t;

    /// constructor / destructor
    maint()
    : run_(0),
      output_json_(0),
      string_("{\"method\": \"setAudioVolume\", \"id\": 73, \"params\": [{\"volume\": 20}], \"version\": 1.1}"), 
      arg_(string_.has_chars()) {
    }
    virtual ~maint() {
    }
private:
    maint(const maint& copy) {
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
    virtual int default_run(int argc, char_t** argv, char_t** env) {
        int err = 0;
        if ((argc > (optind)) && (argv)) {
            err = json_literal_run(argc, argv, env);
        } else {
            err = extends::default_run(argc, argv, env);
        }
        return err;
    }

    /// ...json_file_run
    virtual int json_file_run(int argc, char_t** argv, char_t** env) {
        int err = 0, argind = 0;
        const char_t* arg = 0;
 
        if ((argc > (argind = optind)) && (argv) 
            && (arg = argv[argind]) && (arg[0])) {
            io::crt::file::char_reader file;
            
            LOGGER_IS_LOGGED_INFO("file.open(\"" << arg << "\")...");
            if ((file.open(arg))) {
                io::format::json::node node;
                io::format::json::libjson::to_node to_node;
                
                LOGGER_IS_LOGGED_INFO("to_node.to(node, file)...");
                to_node.to(node, file);
                output_json(node, argc, argv, env);
                file.close();
            }
        }
        return err;
    }
    virtual int set_json_file_run(int argc, char_t** argv, char_t** env) {
        int err = 0;
        run_ = &derives::json_file_run;
        return err;
    }
    virtual int unset_json_file_run(int argc, char_t** argv, char_t** env) {
        int err = 0;
        run_ = 0;
        return err;
    }

    /// ...json_url_run
    virtual int json_url_run(int argc, char_t** argv, char_t** env) {
        int err = 0, argind = 0;
        if ((argc > (argind = optind)) && (argv)) {
            arg_ = argv[argind];
        }
        return err;
    }
    virtual int set_json_url_run(int argc, char_t** argv, char_t** env) {
        int err = 0;
        run_ = &derives::json_url_run;
        return err;
    }
    virtual int unset_json_url_run(int argc, char_t** argv, char_t** env) {
        int err = 0;
        run_ = 0;
        return err;
    }

    /// ...json_literal_run
    virtual int json_literal_run(int argc, char_t** argv, char_t** env) {
        int err = 0, argind = 0;
        if ((argc > (argind = optind)) && (argv)) {
            arg_ = argv[argind];
        }
        if ((arg_[0])) {
            io::format::json::node node;
            io::format::json::libjson::to_node to_node;
            to_node.to(node, arg_);
            output_json(node, argc, argv, env);
        } else {
            if (!(err = this->version_run(argc, argv, env))) {
                err = this->usage(argc, argv, env);
            }
        }
        return err;
    }
    virtual int set_json_literal_run(int argc, char_t** argv, char_t** env) {
        int err = 0;
        run_ = &derives::json_literal_run;
        return err;
    }
    virtual int unset_json_literal_run(int argc, char_t** argv, char_t** env) {
        int err = 0;
        run_ = 0;
        return err;
    }

    /// ...output_json...
    int (derives::*output_json_)(const io::format::json::node& node, int argc, char_t** argv, char_t** env);
    virtual int output_json(const io::format::json::node& node, int argc, char_t** argv, char_t** env) {
        int err = 0;
        if ((output_json_)) {
            err = (this->*output_json_)(node, argc, argv, env);
        } else {
            err = output_json_literal(node, argc, argv, env);
        }
        return err;
    }
    virtual int output_json_literal(const io::format::json::node& node, int argc, char_t** argv, char_t** env) {
        int err = 0;
        const io::format::json::char_t* chars = 0;
        io::format::json::string_t string;
        node.to(string);
        if ((chars = string.has_chars())) {
            this->outlln("json = \"", chars, "\"", null);
        }
        return err;
    }
    virtual int set_output_json_literal(int argc, char_t** argv, char_t** env) {
        int err = 0;
        output_json_ = &derives::output_json_literal;
        return err;
    }
    virtual int unset_output_json_literal(int argc, char_t** argv, char_t** env) {
        int err = 0;
        output_json_ = 0;
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
        set_json_url_run(argc, argv, env);
        return err;
    }
    virtual int on_json_file_option
    (int optval, const char_t* optarg, const char_t* optname,
     int optind, int argc, char_t**argv, char_t**env) {
        int err = 0;
        if ((optarg) && (optarg[0])) {
        } else {
        }
        set_json_file_run(argc, argv, env);
        return err;
    }
    virtual int on_json_literal_option
    (int optval, const char_t* optarg, const char_t* optname,
     int optind, int argc, char_t**argv, char_t**env) {
        int err = 0;
        if ((optarg) && (optarg[0])) {
        } else {
        }
        set_json_literal_run(argc, argv, env);
        return err;
    }

protected:
    string_t string_;
    const char_t* arg_;
}; /// class maint
typedef maint<> main;

} /// namespace argo
} /// namespace console
} /// namespace app
} /// namespace xos

#endif /// ndef XOS_APP_CONSOLE_ARGO_MAIN_HPP
