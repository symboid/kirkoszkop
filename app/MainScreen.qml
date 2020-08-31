
import QtQuick 2.12
import QtQuick.Controls 2.5
import Symboid.Sdk.Controls 1.0
import Symboid.Astro.Controls 1.0
import Symboid.Astro.Db 1.0
import QtQuick.Layouts 1.12

MainScreen {

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
        viewNames: [ qsTr("Summary") ] //, qsTr("Planet positions"), qsTr("House cusps") ]
        referenceItem: dateTimeParams
    }

    StackLayout {
        width: metrics.mandalaSize
        height: metrics.mandalaSize
        currentIndex: viewSelector.currentIndex
        Item {}
    }

    MainScreenLocationBox {
        id: locationParams
        showDetails: details.checked
        showCurrentTimer: false
    }

    MainScreenBottomPane {
        referenceItem: locationParams
        controlItem: Frame {
            Switch {
                id: details
                anchors.centerIn: parent
                text: qsTr("Details")
            }
        }
    }
}
