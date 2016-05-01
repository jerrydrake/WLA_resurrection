#include "defines.hpp"

_display = _this select 0;

_ST_HORIZONTAL = _display displayctrl (CT_PROGRESS + ST_HORIZONTAL);
_ST_VERTICAL = _display displayctrl (CT_PROGRESS + ST_VERTICAL);

_ST_HORIZONTAL progresssetposition 0.5;
_ST_VERTICAL progresssetposition 0.5;