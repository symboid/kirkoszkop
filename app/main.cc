
#include "kirkoszkop/app/defs.h"
#include "sdk/arch/mainobject.h"
#include "kirkoszkop/app/init.h"
#include <QQuickStyle>

int main(int _argc, char* _argv[])
{
    arh::main_object_init<app_kirkoszkop, int*, char***> app(&_argc, &_argv);
    QQuickStyle::setStyle("Material");
    return app->run();
}
