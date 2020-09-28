
import QtQuick 2.12
import QtQuick.Controls 2.5
import Symboid.Krono.Calculo 1.0

Item {
    property KronoScope kronoScope: null

    Grid {
        anchors.centerIn: parent
        columns: 3
        columnSpacing: 30
        rowSpacing: 15

        Label {
            text: qsTr("Phisical space")
            font.italic: true
            font.pointSize: 13
        }
        Label {
            text: kronoScope.phisContour.capacity + " - " +
                  kronoScope.phisContour.emission
            font.pointSize: 13
        }
        Label {
            text: kronoScope.phisContour.text +
                  " (" + kronoScope.phisContour.marker+ ")"
            font.bold: true
            font.pointSize: 13
        }

        Label {
            text: qsTr("Emotional space")
            font.italic: true
            font.pointSize: 13
        }
        Label {
            text: kronoScope.emotContour.capacity + " - " +
                  kronoScope.emotContour.emission
            font.pointSize: 13
        }
        Label {
            text: kronoScope.emotContour.text +
                  " (" + kronoScope.emotContour.marker+ ")"
            font.bold: true
            font.pointSize: 13
        }

        Label {
            text: qsTr("Intellectual space")
            font.italic: true
            font.pointSize: 13
        }
        Label {
            text: kronoScope.intlContour.capacity + " - " +
                  kronoScope.intlContour.emission
            font.pointSize: 13
        }
        Label {
            text: kronoScope.intlContour.text +
                  " (" + kronoScope.intlContour.marker+ ")"
            font.bold: true
            font.pointSize: 13
        }

        Item { height:20;width:1 }
        Item { height:20;width:1 }
        Item { height:20;width:1 }

        Label {
            text: qsTr("Mask")
            font.italic: true
            font.pointSize: 13
        }
        Label {
            text: kronoScope.maskContour.capacity + " - " +
                  kronoScope.maskContour.emission
            font.pointSize: 13
        }
        Label {
            text: kronoScope.maskContour.text +
                  " (" + kronoScope.maskContour.marker+ ")"
            font.bold: true
            font.pointSize: 13
        }

        Label {
            text: qsTr("Root sum")
            font.italic: true
            font.pointSize: 13
        }
        Label {
            text: kronoScope.rootSum
            font.pointSize: 13
        }
    }
}
