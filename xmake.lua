add_rules("mode.debug", "mode.release")

add_repositories("levimc-repo https://github.com/LiteLDev/xmake-repo.git")

option("target_type")
    set_default("server")
    set_showmenu(true)
    set_values("server", "client")
option_end()

-- add_requires("levilamina x.x.x") for a specific version
-- add_requires("levilamina develop") to use develop version
-- please note that you should add bdslibrary yourself if using dev version
add_requires("levilamina", {configs = {target_type = get_config("target_type")}})

add_requires("levibuildscript", "sqlitecpp 3.3.3")

if not has_config("vs_runtime") then
    set_runtimes("MD")
end

target("LegacyMoney")
    add_rules("@levibuildscript/linkrule")
    add_rules("@levibuildscript/modpacker")
    add_cxflags( "/EHa", "/utf-8", "/W4", "/w44265", "/w44289", "/w44296", "/w45263", "/w44738", "/w45204")
    add_defines("NOMINMAX", "UNICODE", "LLMONEY_EXPORTS")
    add_packages("levilamina", "sqlitecpp")
    set_exceptions("none")
    set_kind("shared")
    set_languages("c++20")
    set_symbols("debug")
    add_headerfiles("src/**.h")
    add_files("src/**.cpp")
    add_includedirs("src")
    if is_config("target_type", "server") then
    --  add_includedirs("src-server")
    --  add_files("src-server/**.cpp")
    else
    --  add_includedirs("src-client")
    --  add_files("src-client/**.cpp")
    end
    after_build(function (target)
        local bindir = path.join(os.projectdir(), "bin")
        local includedir = path.join(bindir, "include")
        local libdir = path.join(bindir, "lib")
        os.mkdir(includedir)
        os.mkdir(libdir)
        os.cp(path.join(os.projectdir(), "src", "LLMoney.h"), includedir)
        os.cp(path.join(target:targetdir(), target:name() .. ".lib"), libdir)
        os.cp(path.join(os.projectdir(), "assets", "lang"), path.join(path.join(bindir, target:name()), "lang"))
        end)