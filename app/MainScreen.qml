
import QtQuick 2.12
import QtQuick.Controls 2.5
import Symboid.Sdk.Controls 1.0
import Symboid.Sdk.Controls 1.0 as Sdk
import Symboid.Astro.Controls 1.0
import Symboid.Astro.Db 1.0
import Symboid.Astro.Hora 1.0
import QtQuick.Layouts 1.12
import Symboid.Krono.Calculo 1.0

Sdk.MainScreen {
    id: mainScreen

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

    property KronoScope kronoScope: KronoScope {
        year: dateTimeParams.year
        month: dateTimeParams.month
        day: dateTimeParams.day
    }

    MainScreenParamBox {
        id: kronoContours
        title: qsTr("Contours")

        Grid {
            columns: 2
            padding: 10
            rightPadding: 3 * padding
            rowSpacing: 10
            columnSpacing: 15
            horizontalItemAlignment: Grid.AlignRight
            Text {
                text: qsTr("Phisical:")
                font.italic: true
            }
            Text {
                text: kronoScope.phisContour.text
                font.bold: true
            }

            Text {
                text: qsTr("Emotional:")
                font.italic: true
            }
            Text {
                text: kronoScope.emotContour.text
                font.bold: true
            }

            Text {
                text: qsTr("Intellectual:")
                font.italic: true
            }
            Text {
                text: kronoScope.intlContour.text
                font.bold: true
            }
        }
    }

    MainScreenViewSelector {
        id: viewSelector
        viewNames: [ qsTr("Summary") , qsTr("Planet positions") , qsTr("House cusps"), qsTr("Krono contours"), qsTr("Krono puppet") ]
        referenceItem: kronoContours
    }

    StackLayout {
        width: metrics.mandalaSize
        height: metrics.mandalaSize
        currentIndex: viewSelector.currentIndex
        HoraPanel {
            id: horaPanel
            isLandscape: metrics.isLandscape
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
        PlanetsTableView {
            tableModel: horaPanel.planetsModel
            showSeconds: false
        }
        HousesTableView {
            tableModel: horaPanel.housesModel
            showSeconds: false
        }
        KronoTableView {
            kronoScope: mainScreen.kronoScope
        }
        Pane {
            padding: 24
            Rectangle {
                anchors.fill: parent
                color: "white"
                radius: 10
                anchors.margins: 10
                KronoPuppet {
                    anchors.margins: 10
                    anchors.fill: parent
                    phisCapacity: kronoScope.phisContour.capacity
                    phisEmission: kronoScope.phisContour.emission
                    emotCapacity: kronoScope.emotContour.capacity
                    emotEmission: kronoScope.emotContour.emission
                }
            }
        }
    }

    MainScreenLocationBox {
        id: locationParams
        showDetails: details.checked
        showCurrentTimer: false
    }

    MainScreenDetailsSwitch {
        id: details
        referenceItem: locationParams
    }

    Component.onCompleted: {
        dateTimeParams.setDate(2000,1,1)
        dateTimeParams.setTime(0,0,0)
        horaPanel.interactive = true
    }
}
