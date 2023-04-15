package = 'lua-object'
version = '1.1.0-1'
source  = {
    url    = 'git+https://github.com/a1div0/lua-object.git';
    branch = 'main';
    tag = '1.1.0'
}
description = {
    summary  = "Base class implementation for Lua";
    homepage = 'https://github.com/a1div0/lua-object';
    maintainer = "Alexander Klenov <a.a.klenov@ya.ru>";
    license  = 'BSD2';
}
dependencies = {
    'lua >= 5.1';
}
build = {
    type = 'builtin';
    modules = {
        ['lua-object'] = 'lua-object/init.lua';
    }
}
