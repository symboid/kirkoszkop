
#ifndef __SYMBOID_KIRKOSZKOP_APP_INIT_H__
#define __SYMBOID_KIRKOSZKOP_APP_INIT_H__

#include "kirkoszkop/app/defs.h"
#include "sdk/arch/appqml.h"
#include "sdk/network/init.h"
#include "sdk/controls/init.h"
#include "sdk/hosting/init.h"
#include "sdk/dox/init.h"
#include "astro/controls/init.h"
#include "astro/db/init.h"
#include "astro/hora/init.h"
#include "krono/calculo/init.h"

struct app_kirkoszkop : arh::app_qml<app_kirkoszkop>
{
    APP_OBJECT(kirkoszkop)

    static constexpr const char* name = "KirkoSzkop";

    app_kirkoszkop(int* _argc, char*** _argv);
    ~app_kirkoszkop();

    arh::mod_init<mod_sdk_network> _M_mod_sdk_network;
    arh::mod_init<mod_sdk_controls> _M_mod_sdk_controls;
    arh::mod_init<mod_sdk_hosting> _M_mod_sdk_hosting;
    arh::mod_init<mod_sdk_dox> _M_mod_sdk_dox;
    arh::mod_init<mod_astro_controls> _M_mod_astro_controls;
    arh::mod_init<mod_astro_db> _M_mod_astro_db;
    arh::mod_init<mod_astro_hora> _M_mod_astro_hora;
    arh::mod_init<mod_krono_calculo> _M_mod_krono_calculo;
};

#endif // __SYMBOID_KIRKOSZKOP_APP_INIT_H__
