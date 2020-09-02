
import QtQuick 2.12
import QtQuick.Controls 2.5
import Symboid.Sdk.Controls 1.0
import Symboid.Sdk.Controls 1.0 as Sdk
import Symboid.Astro.Controls 1.0
import Symboid.Astro.Db 1.0
import Symboid.Astro.Hora 1.0
import QtQuick.Layouts 1.12

Sdk.MainScreen {

    MainScreenParamBox {
        title: qsTr("Name")
        MainScreenTextField {
            id: name
        }
    }

    MainScreenDateTimeBox {
        id: dateTimeParams
        showSeconds: false
    }

    MainScreenViewSelector {
        id: viewSelector
        viewNames: [ qsTr("Summary") , qsTr("Planet positions") , qsTr("House cusps") ]
        referenceItem: dateTimeParams
    }

    StackLayout {
        width: metrics.mandalaSize
        height: metrics.mandalaSize
        currentIndex: viewSelector.currentIndex
        Rectangle {
            border.width: horaPanel.minHoraSize != horaPanel.horaSize ? 1 : 0
            border.color: "lightgray"
            color: "white"
            HoraPanel {
                id: horaPanel
                anchors.fill: parent
                minHoraSize: metrics.mandalaSize
                horaSize: metrics.mandalaSize

                year: dateTimeParams.year
                month: dateTimeParams.month
                day: dateTimeParams.day
                hour: dateTimeParams.hour
                minute: dateTimeParams.minute
                second: 0

                geoLatt: locationParams.geoLatt
                geoLont: locationParams.geoLont
                tzDiff: locationParams.geoTzDiff

                housesType: "placidus"
                withJulianCalendar: false

                Component.onCompleted: {
                    planetsModel.withSpeed = false
                    housesModel.withSpeed = false
                }
            }
        }
        PlanetsTableView {
            tableModel: horaPanel.planetsModel
            showSeconds: false
        }
        HousesTableView {
            tableModel: horaPanel.housesModel
            showSeconds: false
        }
    }

    MainScreenLocationBox {
        id: locationParams
        showDetails: details.checked
        showCurrentTimer: false
    }

    MainScreenBottomPane {
        referenceItem: locationParams
        controlItem: Pane {
            Switch {
                id: details
                anchors.centerIn: parent
                text: qsTr("Details")
            }
        }
    }

    Component.onCompleted: {
        dateTimeParams.setDate(2000,1,1)
        dateTimeParams.setTime(0,0,0)
        horaPanel.interactive = true
    }
}
