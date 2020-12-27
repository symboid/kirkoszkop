
#include "kirkoszkop/app/setup.h"
#include "kirkoszkop/app/init.h"
#include <qglobal.h>

app_kirkoszkop::app_kirkoszkop(int* _argc, char*** _argv)
    : arh::app_qml<app_kirkoszkop>(_argc, _argv)
{
    Q_INIT_RESOURCE(kirkoszkop_app);
    load_translator();
}

app_kirkoszkop::~app_kirkoszkop()
{
    Q_CLEANUP_RESOURCE(kirkoszkop_app);
}
