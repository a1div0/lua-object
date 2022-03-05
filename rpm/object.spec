Name: object
Version: 1.0.2
Release: 1%{?dist}
Summary: Base class implementation for Lua
Group: Applications/File
License: BSD
URL: https://github.com/a1div0/object
Source0: object-%{version}.tar.gz
BuildArch: noarch

%description
Base class implementation for Lua

%prep
%setup -q -n object-%{version}

%check
./test/object.test.lua

%install
# Create /usr/share/lua/object
mkdir -p %{buildroot}%{_datadir}/lua/object
# Copy init.lua to /usr/share/lua/object/init.lua
cp -p luakit/*.lua %{buildroot}%{_datadir}/lua/object

%files
%dir %{_datadir}/lua/object
%{_datadir}/lua/object/
%doc README.md
%{!?_licensedir:%global license %doc}
%license LICENSE AUTHORS

%changelog
## [1.0.2] - 2022-03-05
* Sat Mar 05 2022 Alexander Klenov <a.a.klenov@ya.ru> 1.0.2-1
- Refactor - function `myInstance` rename to `isInstance`
- Bug fix in function `isInstance`

* Tue Feb 13 2022 Alexander Klenov <a.a.klenov@ya.ru> 1.0.0-1
- Initial version of the RPM spec
