package = 'object'
version = '1.0.2-1'
source  = {
    url    = 'git+https://github.com/a1div0/object.git';
    branch = 'main';
    tag = '1.0.2'
}
description = {
    summary  = "Base class implementation for Lua";
    homepage = 'https://github.com/a1div0/object';
    maintainer = "Alexander Klenov <a.a.klenov@ya.ru>";
    license  = 'BSD2';
}
dependencies = {
    'lua >= 5.1';
}
build = {
    type = 'builtin';
    modules = {
        ['object'] = 'object/init.lua';
    }
}
