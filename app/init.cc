
#include "kirkoszkop/app/setup.h"
#include "kirkoszkop/app/init.h"
#include <qglobal.h>

app_kirkoszkop::app_kirkoszkop(int* _argc, char*** _argv)
    : arh::app_qml<app_kirkoszkop>(_argc, _argv)
{
    Q_INIT_RESOURCE(kirkoszkop_app);
    load_translator();

    arh::main_object<QHoraConfig> horaConfig;

    horaConfig->mPlanets.push_back(hor::planet(hor::planet::sun, new OrbisConfig(horaConfig->orbis(), 0)));
    horaConfig->mPlanets.push_back(hor::planet(hor::planet::moon, new OrbisConfig(horaConfig->orbis(), 1)));
    horaConfig->mPlanets.push_back(hor::planet(hor::planet::mercury, new OrbisConfig(horaConfig->orbis(), 2)));
    horaConfig->mPlanets.push_back(hor::planet(hor::planet::venus, new OrbisConfig(horaConfig->orbis(), 3)));
    horaConfig->mPlanets.push_back(hor::planet(hor::planet::mars, new OrbisConfig(horaConfig->orbis(), 4)));
    horaConfig->mPlanets.push_back(hor::planet(hor::planet::jupiter, new OrbisConfig(horaConfig->orbis(), 5)));
    horaConfig->mPlanets.push_back(hor::planet(hor::planet::saturn, new OrbisConfig(horaConfig->orbis(), 6)));

    horaConfig->mPlanets.push_back(hor::planet(hor::planet::uranus, new OrbisConfig(horaConfig->orbis(), 7)));
    horaConfig->mPlanets.push_back(hor::planet(hor::planet::neptune, new OrbisConfig(horaConfig->orbis(), 8)));
    horaConfig->mPlanets.push_back(hor::planet(hor::planet::pluto, new OrbisConfig(horaConfig->orbis(), 9)));

    horaConfig->mAspectTypes.insert(hor::conjunction);
    horaConfig->mAspectTypes.insert(hor::opposition);
    horaConfig->mAspectTypes.insert(hor::trigon);
    horaConfig->mAspectTypes.insert(hor::quadrat);
}

app_kirkoszkop::~app_kirkoszkop()
{
    Q_CLEANUP_RESOURCE(kirkoszkop_app);
}
